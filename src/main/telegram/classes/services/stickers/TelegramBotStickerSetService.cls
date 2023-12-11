/**
 * @description Service class that provides access to all `Telegram` `sticker` methods
 */
global class TelegramBotStickerSetService {
    private final String name;
    private final BotCalloutService calloutService;

    public TelegramBotStickerSetService(String name, BotCalloutService calloutService) {
        this.name = name;
        this.calloutService = calloutService;
    }

    /**
     * @description Gets the information about the sticker set
     * @return The instance of the <<TelegramStickerSet>> class
     */
    global TelegramStickerSet get() {
        BotJsonPayload response = call(TelegramBotMethod.GetStickerSet, new BotJsonPayload());
        return new TelegramStickerSet(response.getJsonPayload('result'));
    }

    /**
     * @description Creates a new sticker set owned by the user. The bot will be able to edit the sticker set
     * @param userId The user identifier of the created sticker set owner
     * @param title The sticker set title, `1-64 characters`
     * @param stickers The list of `1-50` initial stickers to be added in the set
     * @param stickerFormat The format of sticker in the set, one of `static`, `animated`, `video`
     */
    global void create(String userId, String title, List<TelegramInputSticker> stickers, String stickerFormat) {
        create(userId, title, stickers, stickerFormat, new TelegramStickerSetCreateOptions());
    }

    /**
     * @description Creates a new sticker set owned by the user with optional parameters. The bot will be able to edit the sticker set
     * @param userId The user identifier of the created sticker set owner
     * @param title The sticker set title, `1-64 characters`
     * @param stickers The list of `1-50` initial stickers to be added in the set
     * @param stickerFormat The format of sticker in the set, one of `static`, `animated`, `video`
     * @param options Optional parameters for creating a sticker set
     */
    global void create(
        String userId,
        String title,
        List<TelegramInputSticker> stickers,
        String stickerFormat,
        TelegramStickerSetCreateOptions options
    ) {
        BotJsonPayload request = new BotJsonPayload(options)
            .set('user_id', userId)
            .set('title', title)
            .set('stickers', stickers)
            .set('sticker_format', stickerFormat);

        call(TelegramBotMethod.CreateNewStickerSet, request);
    }

    /**
     * @description Changes the sticker set title
     * @param title The new sticker set title, `1-64 characters`
     */
    global void setTitle(String title) {
        call(TelegramBotMethod.SetStickerSetTitle, new BotJsonPayload().set('title', title));
    }

    /**
     * @description Changes the sticker set thumbnail
     * @param userId The user identifier of the sticker set owner
     * @param thumbnailUrl The new sticker set thumbnail URL
     */
    global void setThumbnail(String userId, String thumbnailUrl) {
        BotJsonPayload request = new BotJsonPayload().set('user_id', userId).set('thumbnail', thumbnailUrl, true);

        call(TelegramBotMethod.SetStickerSetThumbnail, request);
    }

    /**
     * @description Adds a new sticker to the set created by the bot. The format of the sticker must match the format of sticker in the set
     * @param userId The user identifier of the sticker set owner
     * @param sticker The input of the sticker to be added in the set
     */
    global void addSticker(String userId, TelegramInputSticker sticker) {
        BotJsonPayload request = new BotJsonPayload().set('user_id', userId).set('sticker', sticker);
        call(TelegramBotMethod.AddStickerToSet, request);
    }

    /**
     * @description Removes the sticker from the set
     * @param stickerId The file identifier of the sticker
     */
    global void removeSticker(String stickerId) {
        calloutService.call(TelegramBotMethod.DeleteStickerFromSet, new BotJsonPayload().set('sticker', stickerId));
    }

    /**
     * @description Moves the sticker in the set to a specific position
     * @param stickerId The file identifier of the sticker
     * @param position The new sticker position in the set, zero based
     */
    global void setStickerPosition(String stickerId, Integer position) {
        BotJsonPayload request = new BotJsonPayload().set('sticker', stickerId).set('position', position);
        calloutService.call(TelegramBotMethod.SetStickerPositionInSet, request);
    }

    /**
     * @description Deletes the sticker set
     */
    global void deleteSet() {
        call(TelegramBotMethod.DeleteStickerSet, new BotJsonPayload());
    }

    private BotJsonPayload call(TelegramBotMethod method, BotJsonPayload request) {
        return calloutService.call(method, new BotJsonPayload(request).set('name', name));
    }
}
