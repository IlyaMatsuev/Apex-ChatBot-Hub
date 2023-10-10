@IsTest
public class TelegramBotCalloutMock extends BotCalloutMock {
    protected override String handleRequest(BotJsonPayload request, String method) {
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
            when 'forwardMessage' {
                return getSuccessTelegramMessageResponse(request);
            }
            when 'copyMessage' {
                return getSuccessTelegramMessageResponse(request);
            }
            when 'getChat' {
                return getChat(request);
            }
            when 'editMessageText' {
                return getSuccessTelegramResponse(request);
            }
            when 'editMessageCaption' {
                return getSuccessTelegramResponse(request);
            }
            when 'editMessageMedia' {
                return getSuccessTelegramResponse(request);
            }
            when 'editMessageLiveLocation' {
                return getSuccessTelegramResponse(request);
            }
            when 'stopMessageLiveLocation' {
                return getSuccessTelegramResponse(request);
            }
            when 'editMessageReplyMarkup' {
                return getSuccessTelegramResponse(request);
            }
            when 'stopPoll' {
                return getSuccessTelegramResponse(request);
            }
            when 'deleteMessage' {
                return getSuccessTelegramResponse(request);
            }
            when 'leaveChat' {
                return getSuccessTelegramResponse(request);
            }
            when 'getChatMemberCount' {
                return getChatMemberCount(request);
            }
            when 'setChatPermissions' {
                return getSuccessTelegramResponse(request);
            }
            when 'setChatPhoto' {
                return getSuccessTelegramResponse(request);
            }
            when 'deleteChatPhoto' {
                return getSuccessTelegramResponse(request);
            }
            when 'setChatTitle' {
                return getSuccessTelegramResponse(request);
            }
            when 'setChatDescription' {
                return getSuccessTelegramResponse(request);
            }
            when 'pinChatMessage' {
                return getSuccessTelegramResponse(request);
            }
            when 'unpinChatMessage' {
                return getSuccessTelegramResponse(request);
            }
            when 'unpinAllChatMessages' {
                return getSuccessTelegramResponse(request);
            }
            when 'getChatAdministrators' {
                return getChatAdministrators(request);
            }
            when 'setChatStickerSet' {
                return getSuccessTelegramResponse(request);
            }
            when 'deleteChatStickerSet' {
                return getSuccessTelegramResponse(request);
            }
            when 'exportChatInviteLink' {
                return exportChatInviteLink(request);
            }
            when 'createChatInviteLink' {
                return createEditChatInviteLink(request);
            }
            when 'editChatInviteLink' {
                return createEditChatInviteLink(request);
            }
            when 'revokeChatInviteLink' {
                return getSuccessTelegramResponse(request);
            }
            when 'approveChatJoinRequest' {
                return getSuccessTelegramResponse(request);
            }
            when 'declineChatJoinRequest' {
                return getSuccessTelegramResponse(request);
            }
            when 'getChatMember' {
                return getChatMember(request);
            }
            when 'banChatMember' {
                return getSuccessTelegramResponse(request);
            }
            when 'unbanChatMember' {
                return getSuccessTelegramResponse(request);
            }
            when 'restrictChatMember' {
                return getSuccessTelegramResponse(request);
            }
            when 'promoteChatMember' {
                return getSuccessTelegramResponse(request);
            }
            when 'setChatAdministratorCustomTitle' {
                return getSuccessTelegramResponse(request);
            }
            when 'answerInlineQuery' {
                return getSuccessTelegramResponse(request);
            }
            when 'getMe' {
                return getMe();
            }
            when 'getMyName' {
                return getMyName();
            }
            when 'getMyDescription' {
                return getMyDescription();
            }
            when 'getMyShortDescription' {
                return getMyShortDescription();
            }
            when 'getMyDefaultAdministratorRights' {
                return getMyDefaultAdminRights();
            }
            when 'setMyName' {
                return getSuccessTelegramResponse(request);
            }
            when 'setMyDescription' {
                return getSuccessTelegramResponse(request);
            }
            when 'setMyShortDescription' {
                return getSuccessTelegramResponse(request);
            }
            when 'setMyDefaultAdministratorRights' {
                return getSuccessTelegramResponse(request);
            }
        }
        throw new IllegalArgumentException('The provided telegram bot method is not correct: ' + method);
    }

    private String setWebhook(BotJsonPayload request) {
        String webhookUrl = request.getString('url');
        Assert.isTrue(webhookUrl.substringBeforeLast('/').endsWith('/Telegram'));
        Assert.isTrue(webhookUrl.substringAfterLast('/') instanceof Id);
        Assert.isTrue(request.hasValue('allowed_updates'));
        Assert.isTrue(request.hasValue('secret_token'));
        return 'True';
    }

    private String deleteWebhook(BotJsonPayload request) {
        Assert.isTrue(request.getBoolean('drop_pending_updates'));
        return 'True';
    }

    private String sendMessage(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('text'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendPhoto(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('photo'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendVideo(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('video'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendVideoNote(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('video_note'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendAudio(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('audio'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendVoice(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('voice'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendDocument(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('document'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendMediaGroup(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('media'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendContact(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('first_name'));
        Assert.isTrue(request.hasValue('phone_number'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendLocation(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('latitude'));
        Assert.isTrue(request.hasValue('longitude'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendVenue(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('latitude'));
        Assert.isTrue(request.hasValue('longitude'));
        Assert.isTrue(request.hasValue('title'));
        Assert.isTrue(request.hasValue('address'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendSticker(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('sticker'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendAnimation(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('animation'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendPoll(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('question'));
        Assert.isTrue(request.hasValue('options'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendDice(BotJsonPayload request) {
        return getSuccessTelegramMessageResponse(request);
    }

    private String sendChatAction(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('action'));
        return getSuccessTelegramMessageResponse(request);
    }

    private String getChat(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('chat_id'));
        return new BotJsonPayload()
            .set('result', new TelegramChat(new BotJsonPayload().set('id', Integer.valueOf(request.get('chat_id')))))
            .toJson();
    }

    private String getChatMemberCount(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('chat_id'));
        return new BotJsonPayload().set('result', 3).toJson();
    }

    private String getChatAdministrators(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('chat_id'));
        return new BotJsonPayload()
            .set('result', new List<Object> { new TelegramChatMemberAdmin(new BotJsonPayload().set('id', 21312123)) })
            .toJson();
    }

    private String exportChatInviteLink(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('chat_id'));
        return new BotJsonPayload().set('result', 'https://tg.com/invite/1231').toJson();
    }

    private String createEditChatInviteLink(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('chat_id'));
        return new BotJsonPayload()
            .set(
                'result',
                new TelegramChatInviteLink(new BotJsonPayload().set('invite_link', 'https://tg.com/invite/1231'))
            )
            .toJson();
    }

    private String getChatMember(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('chat_id'));
        Assert.isTrue(request.hasValue('user_id'));
        return new BotJsonPayload()
            .set(
                'result',
                new TelegramChatMemberRestricted(new BotJsonPayload().set('id', 21312145).set('status', 'restricted'))
            )
            .toJson();
    }

    private String getMe() {
        return new BotJsonPayload()
            .set(
                'result',
                new TelegramUser(
                    new BotJsonPayload().set('id', 21312145).set('username', 'some_username').set('is_bot', true)
                )
            )
            .toJson();
    }

    private String getMyName() {
        return new BotJsonPayload().set('result', new BotJsonPayload().set('name', 'Test Bot')).toJson();
    }

    private String getMyDescription() {
        return new BotJsonPayload()
            .set('result', new BotJsonPayload().set('description', 'Some test description'))
            .toJson();
    }

    private String getMyShortDescription() {
        return new BotJsonPayload()
            .set('result', new BotJsonPayload().set('short_description', 'Some short test description'))
            .toJson();
    }

    private String getMyDefaultAdminRights() {
        return new BotJsonPayload().set('result', new TelegramChatAdministratorRights()).toJson();
    }

    private String getSuccessTelegramMessageResponse(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('chat_id'));
        return new BotJsonPayload()
            .set('status', 'ok')
            .set('result', new BotJsonPayload().set('message_id', generateExternalId()).getValues())
            .toJson();
    }

    private String getSuccessTelegramResponse(BotJsonPayload request) {
        return new BotJsonPayload().set('status', 'ok').set('result', true).toJson();
    }
}
