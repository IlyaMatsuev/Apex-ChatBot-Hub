/**
 * @description Describes the information about a banned `Telegram` chat member
 * Source: https://core.telegram.org/bots/api#chatmemberbanned
 */
global class TelegramChatMemberBanned extends TelegramChatMember {
    /**
     * @description The date when restrictions will be lifted for this user. If `0` then the user is restricted forever
     */
    global DateTime untilDate { get { return payload.getDateTime('until_date'); } }

    public TelegramChatMemberBanned(BotJsonPayload payload) {
        super(payload);
    }
}
