/**
 * @description Describes the common payload properties for the `Telegram` bot chat join request events
 * Source: https://core.telegram.org/bots/api#chatjoinrequest
 */
global class TelegramChatJoinRequestEvent extends BotPayload {
    /**
     * @description The chat to which the request was sent
     */
    global TelegramChat chat { get { return new TelegramChat(payload.getJsonPayload('chat')); } }

    /**
     * @description The user that sent the join request
     */
    global TelegramUser sender { get { return new TelegramUser(payload.getJsonPayload('from')); } }

    /**
     * @description The identifier of a private chat with the user who sent the join request
     */
    global Integer userChatId { get { return payload.getInteger('user_chat_id'); } }

    /**
     * @description The date the request was sent
     */
    global DateTime requestDate { get { return payload.getDateTime('date'); } }

    /**
     * @description The bio of the user
     */
    global String bio { get { return payload.getString('bio'); } }

    /**
     * @description The chat invite link that was used by the user to send the join request
     */
    global TelegramChatInviteLink inviteLink {
        get { return new TelegramChatInviteLink(payload.getJsonPayload('invite_link')); }
    }

    public TelegramChatJoinRequestEvent(BotJsonPayload payload) {
        super(payload);
    }
}
