@IsTest
public class TelegramBotCalloutMock extends BotCalloutMock {
    protected override String handleRequest(ValueMap request, String method) {
        switch on method {
            when 'setWebhook' {
                return setWebhook(request);
            }
            when 'deleteWebhook' {
                return deleteWebhook(request);
            }
            when 'sendMessage' {
                return sendMessage(request);
            }
            when 'sendPhoto' {
                return sendPhoto(request);
            }
            when 'sendVideo' {
                return sendVideo(request);
            }
            when 'sendDocument' {
                return sendDocument(request);
            }
            when 'sendContact' {
                return sendContact(request);
            }
            when 'sendLocation' {
                return sendLocation(request);
            }
            when 'sendSticker' {
                return sendSticker(request);
            }
        }
        throw new IllegalArgumentException('The provided telegram bot method is not correct: ' + method);
    }

    private String setWebhook(ValueMap request) {
        String webhookUrl = request.getString('url');
        Assert.isTrue(webhookUrl.substringBeforeLast('/').endsWith('/Telegram'));
        Assert.isTrue(webhookUrl.substringAfterLast('/') instanceof Id);
        Assert.isTrue(request.hasValue('allowed_updates'));
        Assert.isTrue(request.hasValue('secret_token'));
        return 'True';
    }

    private String deleteWebhook(ValueMap request) {
        Assert.isTrue(request.getBoolean('drop_pending_updates'));
        return 'True';
    }

    private String sendMessage(ValueMap request) {
        Assert.isTrue(request.hasValue('text'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendPhoto(ValueMap request) {
        Assert.isTrue(request.hasValue('photo'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendVideo(ValueMap request) {
        Assert.isTrue(request.hasValue('video'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendDocument(ValueMap request) {
        Assert.isTrue(request.hasValue('document'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendContact(ValueMap request) {
        Assert.isTrue(request.hasValue('first_name'));
        Assert.isTrue(request.hasValue('phone_number'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendLocation(ValueMap request) {
        Assert.isTrue(request.hasValue('latitude'));
        Assert.isTrue(request.hasValue('longitude'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendSticker(ValueMap request) {
        Assert.isTrue(request.hasValue('sticker'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String getSuccessTelegramMessageResponse(ValueMap request) {
        Assert.isTrue(request.hasValue('chat_id'));
        return new ValueMap()
            .set('status', 'ok')
            .set('result', new ValueMap().set('message_id', generateExternalId()).getValues())
            .toJson();
    }
}
