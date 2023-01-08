@IsTest
public class BotCalloutMock implements HttpCalloutMock {
    private final BotType type;
    private final BotMethod botServiceMethod;

    private Integer statusCode;
    private Object responseBody;

    public BotCalloutMock(BotType type) {
        this.type = type;
    }

    public HttpResponse respond(HttpRequest request) {
        System.assertEquals('POST', request.getMethod());
        System.assertEquals('application/json', request.getHeader('Content-Type'));

        String botMethod = request.getEndpoint().substringAfterLast('/');
        ValueMap requestPayload = ValueMap.fromJson(request.getBody());
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setHeader('Content-Type', 'application/json');

        if (type == BotType.Telegram) {
            response.setBody(handleTelegramRequest(requestPayload, TelegramBotMethod.valueOf(botMethod)));
        } else if (type == BotType.Viber) {
            response.setBody(handleViberRequest(requestPayload, ViberBotMethod.valueOf(botMethod)));
        } else {
            throw new IllegalArgumentException('The provided bot type is not supported: ' + type);
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

    private String handleTelegramRequest(ValueMap request, BotMethod method) {
        switch on method.name() {
            when 'setWebhook' {
                String webhookUrl = request.getString('url');
                System.assertEquals(BotUtils.getApiUrl() + type, webhookUrl.substringBeforeLast('/'));
                System.assert(webhookUrl.substringAfterLast('/') instanceof Id);
                System.assert(request.has('allowed_updates'));
                System.assert(request.has('secret_token'));
                return 'True';
            }
            when 'deleteWebhook' {
                System.assert(request.getBoolean('drop_pending_updates'));
                return 'True';
            }
            when 'sendMessage' {
                System.assert(request.has('chat_id'));
                System.assert(request.has('text'));
                return new ValueMap()
                    .set('status', 'ok')
                    .set('result', new ValueMap().set('message_id', generateExternalId()).getValues())
                    .toJson();
            }
        }
        throw new IllegalArgumentException('The provided telegram bot method is not correct: ' + method);
    }

    private String handleViberRequest(ValueMap request, BotMethod method) {
        switch on method.name() {
            when 'set_webhook' {
                String webhookUrl = request.getString('url');
                if (webhookUrl == '') {
                    return new ValueMap().set('status', 0).set('status_message', 'ok').toJson();
                }
                System.assertEquals(BotUtils.getApiUrl() + type, webhookUrl.substringBeforeLast('/'));
                System.assert(webhookUrl.substringAfterLast('/') instanceof Id);
                System.assert(request.has('event_types'));
                System.assert(request.getBoolean('send_name'));
                System.assert(request.getBoolean('send_photo'));
                return new ValueMap()
                    .set('status', 0)
                    .set('status_message', 'ok')
                    .set('event_types', request.get('event_types'))
                    .toJson();
            }
            when 'send_message' {
                System.assert(request.has('receiver'));
                System.assert(request.has('type'));
                System.assert(request.has('text'));
                System.assert(request.has('sender'));
                return new ValueMap()
                    .set('status', 0)
                    .set('status_message', 'ok')
                    .set('message_token', generateExternalId())
                    .set('chat_hostname', 'SN-CHAT-05_')
                    .set('billing_status', 1)
                    .toJson();
            }
        }
        throw new IllegalArgumentException('The provided viber bot method is not correct: ' + method);
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
