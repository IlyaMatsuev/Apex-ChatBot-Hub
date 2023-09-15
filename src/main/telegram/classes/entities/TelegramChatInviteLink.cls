/**
 * @description Describes the chat invite link payload that can be received as part of an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#chatinvitelink
 */
global class TelegramChatInviteLink extends BotPayload {
    /**
     * @description The invite link. If the link was created by another chat administrator, then the second part of the link will be replaced with `...`
     */
    global String inviteLink { get { return payload.getString('invite_link'); } }

    /**
     * @description The creator of the link
     */
    global TelegramUser creator { get { return new TelegramUser(payload.getJsonPayload('creator')); } }

    /**
     * @description `True` if users joining the chat via the link need to be approved by chat administrators
     */
    global Boolean createsJoinRequest { get { return payload.getBoolean('creates_join_request'); } }

    /**
     * @description `True` if the link is primary
     */
    global Boolean isPrimary { get { return payload.getBoolean('is_primary'); } }

    /**
     * @description `True` if the link is revoked
     */
    global Boolean isRevoked { get { return payload.getBoolean('is_revoked'); } }

    /**
     * @description The invite link name
     */
    global String name { get { return payload.getString('name'); } }

    /**
     * @description The point in time when the link will expire or has been expired
     */
    global DateTime expireDate { get { return payload.getDateTime('expire_date'); } }

    /**
     * @description The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; `1-99999`
     */
    global Integer memberLimit { get { return payload.getInteger('member_limit'); } }

    /**
     * @description The number of pending join requests created using this link
     */
    global Integer pendingJoinRequestCount { get { return payload.getInteger('pending_join_request_count'); } }

    public TelegramChatInviteLink(BotJsonPayload payload) {
        super(payload);
    }
}
