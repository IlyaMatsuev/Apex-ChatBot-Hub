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
            when 'sendVideoNote' {
                return sendVideoNote(request);
            }
            when 'sendAudio' {
                return sendAudio(request);
            }
            when 'sendVoice' {
                return sendVoice(request);
            }
            when 'sendDocument' {
                return sendDocument(request);
            }
            when 'sendMediaGroup' {
                return sendMediaGroup(request);
            }
            when 'sendContact' {
                return sendContact(request);
            }
            when 'sendLocation' {
                return sendLocation(request);
            }
            when 'sendVenue' {
                return sendVenue(request);
            }
            when 'sendSticker' {
                return sendSticker(request);
            }
            when 'sendAnimation' {
                return sendAnimation(request);
            }
            when 'sendPoll' {
                return sendPoll(request);
            }
            when 'sendDice' {
                return sendDice(request);
            }
            when 'sendChatAction' {
                return sendChatAction(request);
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

    private String sendVideoNote(ValueMap request) {
        Assert.isTrue(request.hasValue('video_note'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendAudio(ValueMap request) {
        Assert.isTrue(request.hasValue('audio'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendVoice(ValueMap request) {
        Assert.isTrue(request.hasValue('voice'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendDocument(ValueMap request) {
        Assert.isTrue(request.hasValue('document'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendMediaGroup(ValueMap request) {
        Assert.isTrue(request.hasValue('media'));
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

    private String sendVenue(ValueMap request) {
        Assert.isTrue(request.hasValue('latitude'));
        Assert.isTrue(request.hasValue('longitude'));
        Assert.isTrue(request.hasValue('title'));
        Assert.isTrue(request.hasValue('address'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendSticker(ValueMap request) {
        Assert.isTrue(request.hasValue('sticker'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendAnimation(ValueMap request) {
        Assert.isTrue(request.hasValue('animation'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendPoll(ValueMap request) {
        Assert.isTrue(request.hasValue('question'));
        Assert.isTrue(request.hasValue('options'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendDice(ValueMap request) {
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendChatAction(ValueMap request) {
        Assert.isTrue(request.hasValue('action'));
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
