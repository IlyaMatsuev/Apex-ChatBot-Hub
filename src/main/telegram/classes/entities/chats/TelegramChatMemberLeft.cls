/**
 * @description Describes the information about a left `Telegram` chat member.
 * Source: https://core.telegram.org/bots/api#chatmemberleft
 */
global class TelegramChatMemberLeft extends TelegramChatMember {
    public TelegramChatMemberLeft(BotJsonPayload payload) {
        super(payload);
    }
}
