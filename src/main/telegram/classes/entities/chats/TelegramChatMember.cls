/**
 * @description Describes the information about a basic `Telegram` chat member.
 * Source: https://core.telegram.org/bots/api#chatmembermember
 */
global virtual class TelegramChatMember extends BotPayload {
    /**
     * @description The member's status in the chat. One of `member`, `creator`, `administrator`, `restricted`, `left` or `kicked`
     */
    global String status { get { return payload.getString('status'); } }

    /**
     * @description The information about the user
     */
    global TelegramUser user { get { return new TelegramUser(payload.getJsonPayload('user')); } }

    public TelegramChatMember(BotJsonPayload payload) {
        super(payload);
    }

    public static TelegramChatMember getChatMember(BotJsonPayload memberPayload) {
        switch on memberPayload.getString('status') {
            when 'creator' {
                return new TelegramChatMemberOwner(memberPayload);
            }
            when 'administrator' {
                return new TelegramChatMemberAdmin(memberPayload);
            }
            when 'restricted' {
                return new TelegramChatMemberRestricted(memberPayload);
            }
            when 'left' {
                return new TelegramChatMemberLeft(memberPayload);
            }
            when 'kicked' {
                return new TelegramChatMemberBanned(memberPayload);
            }
        }
        return new TelegramChatMember(memberPayload);
    }
}
