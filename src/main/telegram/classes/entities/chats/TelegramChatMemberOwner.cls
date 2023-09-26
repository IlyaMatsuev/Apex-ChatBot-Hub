/**
 * @description Describes the information about an owner `Telegram` chat member
 * Source: https://core.telegram.org/bots/api#chatmemberowner
 */
global virtual class TelegramChatMemberOwner extends TelegramChatMember {
    /**
     * @description `True` if the user's presence in the chat is hidden
     */
    global Boolean isAnonymous { get { return payload.getBoolean('is_anonymous'); } }

    /**
     * @description The custom title for this user
     */
    global String customTitle { get { return payload.getString('custom_title'); } }

    public TelegramChatMemberOwner(BotJsonPayload payload) {
        super(payload);
    }
}
