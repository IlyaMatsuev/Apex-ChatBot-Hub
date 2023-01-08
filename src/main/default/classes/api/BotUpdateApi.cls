@RestResource(urlMapping = '/bots/*')
global class BotUpdateApi {
    private static final String RESPONSE_OK = 'OK';
    private static final String RESPONSE_ERROR = 'ERROR';

    @HttpPost
    global static void post() {
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        response.addHeader('Content-Type', 'application/json');

        try {
            UriParams params = new UriParams(request.requestURI.substringAfter('bots/'));

            Bot__c bot = getBotResolver(params.type).resolve(params, request.headers);
            if (bot == null) {
                throw new BotUpdateApiException(
                    'There is no bot with the provided type and id',
                    new ValueMap().set('botId', params.botId).set('botType', params.type)
                );
            }

            EventBus.publish(
                new BotUpdateEvent__e(Bot__c = JSON.serialize(bot), Payload__c = request.requestBody.toString())
            );

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

    public class BotUpdateApiException extends BotCustomException {
        public BotUpdateApiException(String message, ValueMap payload) {
            super(message, payload);
        }
    }

    public class UriParams {
        public final Id botId;
        public final BotType type;
        public final Map<String, String> queryParams;

        public UriParams(String uri) {
            Matcher paramsMatcher = compilePattern().matcher(uri);
            if (!paramsMatcher.matches()) {
                throw new BotUpdateApiException(
                    'Invalid URL format or the URI parameters are incorrect. The correct format is: /bots/<botType>/<botId>',
                    new ValueMap().set('uri', uri)
                );
            }

            this.type = BotType.valueOf(paramsMatcher.group(1));
            this.botId = (Id) paramsMatcher.group(2);
            this.queryParams = parseQueryParams(uri);
        }

        private Pattern compilePattern() {
            List<String> botTypes = new List<String>();
            for (BotType type : BotType.values()) {
                botTypes.add(type.name());
            }
            return Pattern.compile(
                '(?<botType>' +
                String.join(botTypes, '|') +
                ')\\/(?<botId>[A-Za-z\\d]{15,18})(\\?([A-Za-z]+=[A-Za-z\\d]*&?)*)?'
            );
        }

        private Map<String, String> parseQueryParams(String uri) {
            Map<String, String> params = new Map<String, String>();
            for (String parts : uri.substringAfter('?').split('&')) {
                if (String.isNotBlank(parts)) {
                    params.put(parts.substringBefore('='), parts.substringAfter('='));
                }
            }
            return params;
        }
    }
}
