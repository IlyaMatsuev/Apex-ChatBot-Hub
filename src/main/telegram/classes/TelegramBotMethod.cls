public class TelegramBotMethod extends BotMethod {
    /**
     * Webhook methods
     */
    public static final TelegramBotMethod GetWebhookInfo = new TelegramBotMethod('getWebhookInfo');
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
    public static final TelegramBotMethod ForwardMessage = new TelegramBotMethod('forwardMessage');
    public static final TelegramBotMethod CopyMessage = new TelegramBotMethod('copyMessage');

    /**
     * Editing methods
     */
    public static final TelegramBotMethod EditMessageText = new TelegramBotMethod('editMessageText');
    public static final TelegramBotMethod EditMessageCaption = new TelegramBotMethod('editMessageCaption');
    public static final TelegramBotMethod EditMessageMedia = new TelegramBotMethod('editMessageMedia');
    public static final TelegramBotMethod EditMessageLiveLocation = new TelegramBotMethod('editMessageLiveLocation');
    public static final TelegramBotMethod StopMessageLiveLocation = new TelegramBotMethod('stopMessageLiveLocation');
    public static final TelegramBotMethod EditMessageReplyMarkup = new TelegramBotMethod('editMessageReplyMarkup');
    public static final TelegramBotMethod StopPoll = new TelegramBotMethod('stopPoll');
    public static final TelegramBotMethod DeleteMessage = new TelegramBotMethod('deleteMessage');

    /**
     * Sticker methods
     */
    public static final TelegramBotMethod GetCustomEmojiStickers = new TelegramBotMethod('getCustomEmojiStickers');
    public static final TelegramBotMethod UploadStickerFile = new TelegramBotMethod('uploadStickerFile');
    public static final TelegramBotMethod SetStickerEmojiList = new TelegramBotMethod('setStickerEmojiList');
    public static final TelegramBotMethod SetStickerKeywords = new TelegramBotMethod('setStickerKeywords');
    public static final TelegramBotMethod SetStickerSetTitle = new TelegramBotMethod('setStickerSetTitle');
    public static final TelegramBotMethod SetStickerSetThumbnail = new TelegramBotMethod('setStickerSetThumbnail');
    public static final TelegramBotMethod GetStickerSet = new TelegramBotMethod('getStickerSet');
    public static final TelegramBotMethod CreateNewStickerSet = new TelegramBotMethod('createNewStickerSet');
    public static final TelegramBotMethod AddStickerToSet = new TelegramBotMethod('addStickerToSet');
    public static final TelegramBotMethod DeleteStickerFromSet = new TelegramBotMethod('deleteStickerFromSet');
    public static final TelegramBotMethod DeleteStickerSet = new TelegramBotMethod('deleteStickerSet');
    public static final TelegramBotMethod SetStickerPositionInSet = new TelegramBotMethod('setStickerPositionInSet');

    /**
     * Inline mode methods
     */
    public static final TelegramBotMethod AnswerInlineQuery = new TelegramBotMethod('answerInlineQuery');

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

    /**
     * Me and My methods
     */
    public static final TelegramBotMethod GetMe = new TelegramBotMethod('getMe');
    public static final TelegramBotMethod GetMyName = new TelegramBotMethod('getMyName');
    public static final TelegramBotMethod SetMyName = new TelegramBotMethod('setMyName');
    public static final TelegramBotMethod GetMyDescription = new TelegramBotMethod('getMyDescription');
    public static final TelegramBotMethod SetMyDescription = new TelegramBotMethod('setMyDescription');
    public static final TelegramBotMethod GetMyShortDescription = new TelegramBotMethod('getMyShortDescription');
    public static final TelegramBotMethod SetMyShortDescription = new TelegramBotMethod('setMyShortDescription');
    public static final TelegramBotMethod GetMyDefaultAdministratorRights = new TelegramBotMethod(
        'getMyDefaultAdministratorRights'
    );
    public static final TelegramBotMethod SetMyDefaultAdministratorRights = new TelegramBotMethod(
        'setMyDefaultAdministratorRights'
    );

    private TelegramBotMethod(String value) {
        super(value, TelegramBotMethod.class);
    }
}
