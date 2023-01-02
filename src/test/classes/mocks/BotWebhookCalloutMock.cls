@IsTest
public class BotWebhookCalloutMock implements HttpCalloutMock {
    private final BotType type;
    private final BotMethod botServiceMethod;

    private Integer statusCode;
    private Object responseBody;

    public BotWebhookCalloutMock(BotType type) {
        this(type, null);
    }

    public BotWebhookCalloutMock(BotType type, BotMethod botServiceMethod) {
        this.type = type;
        this.botServiceMethod = botServiceMethod;
    }

    public HttpResponse respond(HttpRequest request) {
        System.assertEquals('POST', request.getMethod());
        System.assertEquals('application/json', request.getHeader('Content-Type'));
        if (type == BotType.Telegram) {
            return handleTelegramRequest(request);
        }
        throw new IllegalArgumentException('The provided bot type is not supported: ' + type);
    }

    private HttpResponse handleTelegramRequest(HttpRequest request) {
        Map<String, Object> requestBody = (Map<String, Object>) JSON.deserializeUntyped(request.getBody());
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setHeader('Content-Type', 'application/json');
        BotMethod method = BotMethod.valueOf(request.getEndpoint().substringAfterLast('/'));
        if (botServiceMethod != null) {
            System.assertEquals(botServiceMethod, method);
        }
        switch on method.name() {
            when 'setWebhook' {
                String webhookUrl = (String) requestBody.get('url');
                List<Object> allowedUpdates = (List<Object>) requestBody.get('allowed_updates');
                System.assertEquals(BotUtils.getApiUrl() + type, webhookUrl.substringBeforeLast('/'));
                System.assert(webhookUrl.substringAfterLast('/') instanceof Id);
                System.assertEquals(1, allowedUpdates.size());
                System.assertEquals('message', (String) allowedUpdates.get(0));
                System.assert(requestBody.containsKey('secret_token'));
                response.setBody('True');
            }
            when 'deleteWebhook' {
                System.assert((Boolean) requestBody.get('drop_pending_updates'));
                response.setBody('True');
            }
            when 'sendMessage' {
                System.assert(requestBody.containsKey('chat_id'));
                System.assert(requestBody.containsKey('text'));
                response.setBody(
                    new ValueMap()
                        .set('status', 'ok')
                        .set('result', new ValueMap().set('message_id', generateExternalId()).getValues())
                        .toJson()
                );
            }
            when else {
                throw new IllegalArgumentException('The provided telegram bot method is not correct: ' + method);
            }
        }

        // Apply overrides
        if (this.statusCode != null) {
            response.setStatusCode(this.statusCode);
        }
        if (this.responseBody != null) {
            response.setBody(String.valueOf(this.responseBody));
        }

        return response;
    }

    public HttpCalloutMock overrideResponse(Integer statusCode, Object responseBody) {
        this.statusCode = statusCode;
        this.responseBody = responseBody;
        return this;
    }

    private Long generateExternalId() {
        Long min = 1000000L;
        Long max = 1000000000L;
        return (Long) Math.round(Math.random() * (max - min) + min);
    }
}
