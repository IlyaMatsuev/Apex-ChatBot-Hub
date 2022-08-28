@RestResource(urlMapping='/bots/*')
global class BotUpdateApi {
    private static final Map<BotType, String> SECRET_HEADER_NAME_MAPPING = new Map<BotType, String>{
        BotType.Telegram => 'X-Telegram-Bot-Api-Secret-Token'
    };

    @HttpPost
    global static void post() {
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        response.addHeader(HttpConstants.HEADER_NAME_CONTENT_TYPE, HttpConstants.HEADER_VALUE_CONTENT_TYPE_JSON);

        try {
            List<String> typeAndId = request.requestURI.substringAfter('bots/').split('/');
            if (typeAndId.size() != 2) {
                throw new BotUpdateApiException('Invalid URL format; The correct format: /bots/<bot_type>/<bot_id>');
            }
            BotType botType = BotType.valueOf(typeAndId.get(0));
            String botId = typeAndId.get(1);
            String tokenHash = request.headers.get(SECRET_HEADER_NAME_MAPPING.get(botType));

            EventBus.publish(createUpdateEvent(getBot(botId, botType, tokenHash), request.requestBody.toString()));

            response.responseBody = Blob.valueOf(HttpConstants.RESPONSE_OK);
        } catch (Exception error) {
            String message = 'Failed receiving an update: ' + error.getMessage();
            System.debug(LoggingLevel.ERROR, message + '\n' + error.getStackTraceString());
            response.statusCode = 400;
            response.responseBody = Blob.valueOf(HttpConstants.RESPONSE_ERROR);
        }
    }

    private static Bot__c getBot(String botId, BotType type, String tokenHash) {
        List<Bot__c> bots = [
            SELECT Name, Type__c, Token__c, TokenHash__c, Handler__c
            FROM Bot__c
            WHERE Id = :botId AND Type__c = :type.name() AND TokenHash__c = :tokenHash
            LIMIT 1
        ];
        if (bots.isEmpty()) {
            throw new BotUpdateApiException('There is no bot with the provided type and id');
        }
        return bots.get(0);
    }

    private static BotUpdateEvent__e createUpdateEvent(Bot__c bot, String payload) {
        return new BotUpdateEvent__e(Bot__c = JSON.serialize(bot), Payload__c = payload);
    }

    private class BotUpdateApiException extends Exception {
    }
}
