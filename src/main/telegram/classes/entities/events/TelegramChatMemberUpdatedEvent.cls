/**
 * @description Describes the common payload properties for the `Telegram` bot chat member updated events.
 * Source: https://core.telegram.org/bots/api#chatmemberupdated
 */
global class TelegramChatMemberUpdatedEvent extends BotPayload {
    /**
     * @description The chat the user belongs to
     */
    global TelegramChat chat { get { return new TelegramChat(payload.getJsonPayload('chat')); } }

    /**
     * @description The performer of the action, which resulted in the change
     */
    global TelegramUser sender { get { return new TelegramUser(payload.getJsonPayload('from')); } }

    /**
     * @description The date the change was done
     */
    global DateTime changeDate { get { return payload.getDateTime('date'); } }

    /**
     * @description The previous information about the chat member
     */
    global TelegramChatMember oldChatMember {
        get { return TelegramChatMember.getChatMember(payload.getJsonPayload('old_chat_member')); }
    }

    /**
     * @description The new information about the chat member
     */
    global TelegramChatMember newChatMember {
        get { return TelegramChatMember.getChatMember(payload.getJsonPayload('new_chat_member')); }
    }

    /**
     * @description The chat invite link, which was used by the user to join the chat; for joining by invite link events only
     */
    global TelegramChatInviteLink inviteLink {
        get { return new TelegramChatInviteLink(payload.getJsonPayload('invite_link')); }
    }

    /**
     * @description `True` if the user joined the chat via a chat folder invite link
     */
    global Boolean viaChatFolderInviteLink { get { return payload.getBoolean('via_chat_folder_invite_link'); } }

    public TelegramChatMemberUpdatedEvent(BotJsonPayload payload) {
        super(payload);
    }
}
