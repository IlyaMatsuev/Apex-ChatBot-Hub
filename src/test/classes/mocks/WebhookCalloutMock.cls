@IsTest
public class WebhookCalloutMock implements HttpCalloutMock {
    private final BotType type;

    public WebhookCalloutMock(BotType type) {
        this.type = type;
    }

    public HttpResponse respond(HttpRequest request) {
        System.assertEquals(HttpConstants.METHOD_POST, request.getMethod());
        System.assertEquals(
            HttpConstants.HEADER_VALUE_CONTENT_TYPE_JSON,
            request.getHeader(HttpConstants.HEADER_NAME_CONTENT_TYPE)
        );
        if (type == BotType.Telegram) {
            return handleTelegramRequest(request);
        }
        throw new IllegalArgumentException('The provided bot type is not supported: ' + type);
    }

    private HttpResponse handleTelegramRequest(HttpRequest request) {
        Map<String, Object> requestBody = (Map<String, Object>) JSON.deserializeUntyped(request.getBody());
        HttpResponse response = new HttpResponse();
        response.setStatusCode(HttpConstants.STATUS_CODE_SUCCESS);
        response.setHeader(HttpConstants.HEADER_NAME_CONTENT_TYPE, HttpConstants.HEADER_VALUE_CONTENT_TYPE_JSON);
        TelegramBotMethod method = TelegramBotMethod.valueOf(request.getEndpoint().substringAfterLast('/'));
        switch on method {
            when SetWebhook {
                String webhookUrl = (String) requestBody.get('url');
                List<Object> allowedUpdates = (List<Object>) requestBody.get('allowed_updates');
                System.assertEquals(BotUtils.getApiUrl() + type, webhookUrl.substringBeforeLast('/'));
                System.assert(webhookUrl.substringAfterLast('/') instanceof Id);
                System.assertEquals(1, allowedUpdates.size());
                System.assertEquals('message', (String) allowedUpdates.get(0));
                System.assert(requestBody.containsKey('secret_token'));
                response.setBody('TRUE');
            }
            when DeleteWebhook {
                System.assert((Boolean) requestBody.get('drop_pending_updates'));
                response.setBody('TRUE');
            }
            when SendMessage {
                System.assert(requestBody.containsKey('chat_id'));
                System.assert(requestBody.containsKey('text'));
                response.setBody(JSON.serialize(new Map<String, Object>{ 'message_id' => generateExternalId() }));
            }
            when else {
                throw new IllegalArgumentException('The provided telegram bot method is not correct: ' + method);
            }
        }
        return response;
    }

    private String generateExternalId() {
        Long min = 1000000L;
        Long max = 1000000000L;
        return String.valueOf(Math.round(Math.random() * (max - min) + min));
    }
}
