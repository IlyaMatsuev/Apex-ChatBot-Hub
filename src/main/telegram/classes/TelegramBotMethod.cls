public class TelegramBotMethod extends BotMethod {
    /**
     * Webhook methods
     */
    public static final TelegramBotMethod SetWebhook = new TelegramBotMethod('setWebhook');
    public static final TelegramBotMethod DeleteWebhook = new TelegramBotMethod('deleteWebhook');

    /**
     * Sending methods
     */
    public static final TelegramBotMethod SendMessage = new TelegramBotMethod('sendMessage');
    public static final TelegramBotMethod SendPhoto = new TelegramBotMethod('sendPhoto');
    public static final TelegramBotMethod SendVideo = new TelegramBotMethod('sendVideo');
    public static final TelegramBotMethod SendVideoNote = new TelegramBotMethod('sendVideoNote');
    public static final TelegramBotMethod SendAudio = new TelegramBotMethod('sendAudio');
    public static final TelegramBotMethod SendVoice = new TelegramBotMethod('sendVoice');
    public static final TelegramBotMethod SendDocument = new TelegramBotMethod('sendDocument');
    public static final TelegramBotMethod SendMediaGroup = new TelegramBotMethod('sendMediaGroup');
    public static final TelegramBotMethod SendContact = new TelegramBotMethod('sendContact');
    public static final TelegramBotMethod SendLocation = new TelegramBotMethod('sendLocation');
    public static final TelegramBotMethod SendVenue = new TelegramBotMethod('sendVenue');
    public static final TelegramBotMethod SendSticker = new TelegramBotMethod('sendSticker');
    public static final TelegramBotMethod SendAnimation = new TelegramBotMethod('sendAnimation');
    public static final TelegramBotMethod SendPoll = new TelegramBotMethod('sendPoll');
    public static final TelegramBotMethod SendDice = new TelegramBotMethod('sendDice');
    public static final TelegramBotMethod SendChatAction = new TelegramBotMethod('sendChatAction');

    /**
     * Chat methods
     */
    public static final TelegramBotMethod GetChat = new TelegramBotMethod('getChat');
    public static final TelegramBotMethod LeaveChat = new TelegramBotMethod('leaveChat');
    public static final TelegramBotMethod GetChatMemberCount = new TelegramBotMethod('getChatMemberCount');
    public static final TelegramBotMethod SetChatPermissions = new TelegramBotMethod('setChatPermissions');
    public static final TelegramBotMethod SetChatPhoto = new TelegramBotMethod('setChatPhoto');
    public static final TelegramBotMethod DeleteChatPhoto = new TelegramBotMethod('deleteChatPhoto');
    public static final TelegramBotMethod SetChatTitle = new TelegramBotMethod('setChatTitle');
    public static final TelegramBotMethod SetChatDescription = new TelegramBotMethod('setChatDescription');
    public static final TelegramBotMethod PinChatMessage = new TelegramBotMethod('pinChatMessage');
    public static final TelegramBotMethod UnpinChatMessage = new TelegramBotMethod('unpinChatMessage');
    public static final TelegramBotMethod UnpinAllChatMessages = new TelegramBotMethod('unpinAllChatMessages');
    public static final TelegramBotMethod GetChatAdministrators = new TelegramBotMethod('getChatAdministrators');
    public static final TelegramBotMethod SetChatStickerSet = new TelegramBotMethod('setChatStickerSet');
    public static final TelegramBotMethod DeleteChatStickerSet = new TelegramBotMethod('deleteChatStickerSet');

    /**
     * Chat Invite Links methods
     */
    public static final TelegramBotMethod ExportChatInviteLink = new TelegramBotMethod('exportChatInviteLink');
    public static final TelegramBotMethod CreateChatInviteLink = new TelegramBotMethod('createChatInviteLink');
    public static final TelegramBotMethod EditChatInviteLink = new TelegramBotMethod('editChatInviteLink');
    public static final TelegramBotMethod RevokeChatInviteLink = new TelegramBotMethod('revokeChatInviteLink');

    /**
     * Chat Join Request methods
     */
    public static final TelegramBotMethod ApproveChatJoinRequest = new TelegramBotMethod('approveChatJoinRequest');
    public static final TelegramBotMethod DeclineChatJoinRequest = new TelegramBotMethod('declineChatJoinRequest');

    /**
     * Chat member methods
     */
    public static final TelegramBotMethod GetChatMember = new TelegramBotMethod('getChatMember');
    public static final TelegramBotMethod BanChatMember = new TelegramBotMethod('banChatMember');
    public static final TelegramBotMethod UnbanChatMember = new TelegramBotMethod('unbanChatMember');
    public static final TelegramBotMethod RestrictChatMember = new TelegramBotMethod('restrictChatMember');
    public static final TelegramBotMethod PromoteChatMember = new TelegramBotMethod('promoteChatMember');
    public static final TelegramBotMethod SetChatAdministratorCustomTitle = new TelegramBotMethod(
        'setChatAdministratorCustomTitle'
    );

    private TelegramBotMethod(String value) {
        super(value, TelegramBotMethod.class);
    }
}
