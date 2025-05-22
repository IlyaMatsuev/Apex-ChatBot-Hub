/**
 * @description API for receiving webhooks for the bot updates. This class `MUST NOT` be edited
 * @ignore
 */
@RestResource(urlMapping = '/bots/*')
global class BotUpdateApi {
    private static final String RESPONSE_OK = 'OK';
    private static final String RESPONSE_ERROR = 'ERROR';

    /**
     * @description The `POST` method to be called by the bots' APIs on a new event
     */
    @HttpPost
    global static void post() {
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        response.addHeader('Content-Type', 'application/json');

        try {
            UriParams params = new UriParams(request.requestURI);

            BotModel bot = getBotResolver(params.type).resolve(params, request.headers);
            if (bot == null) {
                throw new BotUpdateApiException(
                    'There is no bot with the provided type and id',
                    new BotJsonPayload().set('params', params).set('uri', request.requestURI)
                );
            }

            if (BotSettingsProvider.get(bot.type).HandleWebhooksInSeparateTransaction__c) {
                EventBus.publish(
                    new BotUpdateEvent__e(Bot__c = bot.toJson(), Payload__c = request.requestBody.toString())
                );
            } else {
                handleUpdateSync(bot.toJson(), request.requestBody.toString());
            }

            response.responseBody = Blob.valueOf(RESPONSE_OK);
        } catch (Exception error) {
            BotErrorLogger.log(error);
            String message = 'Failed receiving an update: ' + error.getMessage();
            System.debug(LoggingLevel.ERROR, message + '\n' + error.getStackTraceString());
            response.statusCode = 400;
            response.responseBody = Blob.valueOf(RESPONSE_ERROR);
        }
    }

    private static IBotUpdateResolver getBotResolver(BotType type) {
        return (IBotUpdateResolver) BotUtils.createInstance(BotSettingsProvider.get(type).BotUpdateResolver__c);
    }

    private static void handleUpdateSync(String botJson, String updatePayloadJson) {
        Flow.Interview.HandleBotUpdate updatesHandler = new Flow.Interview.HandleBotUpdate(
            new Map<String, Object> { 'botJson' => botJson, 'botUpdatePayload' => updatePayloadJson }
        );
        updatesHandler.start();
    }

    public class BotUpdateApiException extends BotCustomException {
        public BotUpdateApiException(String message, BotJsonPayload payload) {
            super(message, payload);
        }
    }

    public class UriParams {
        public final Id botId;
        public final BotType type;
        public final String token;

        public UriParams(String uri) {
            Matcher paramsMatcher = compilePattern().matcher(uri);
            if (!paramsMatcher.matches()) {
                throw new BotUpdateApiException(
                    'Invalid URL format or the URI parameters are incorrect. The correct format is: /bots/<botType>/<botId>/<?token>',
                    new BotJsonPayload().set('uri', uri)
                );
            }

            this.type = BotType.valueOf(paramsMatcher.group(1));
            this.botId = (Id) paramsMatcher.group(2);
            this.token = paramsMatcher.group(4);
        }

        private Pattern compilePattern() {
            List<String> botTypes = new List<String>();
            for (BotType type : BotType.values()) {
                botTypes.add(type.name());
            }
            return Pattern.compile(
                '/bots/(?<botType>' + String.join(botTypes, '|') + ')/(?<botId>[A-Za-z\\d]{15,18})(/(?<token>\\w+))?'
            );
        }
    }
}
