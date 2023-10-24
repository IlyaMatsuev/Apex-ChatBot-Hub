/**
 * @description Service class that provides access to all `Telegram` `sticker` methods
 */
global class TelegramBotStickerService {
    private final BotCalloutService calloutService;

    public TelegramBotStickerService(BotCalloutService calloutService) {
        this.calloutService = calloutService;
    }

    /**
     * @description Gets information about custom emoji stickers by their identifiers
     * @param ids The list of custom emoji identifiers. At most `200` identifiers
     * @return The list of <<TelegramSticker>> class instances
     */
    global List<TelegramSticker> get(List<String> ids) {
        BotJsonPayload request = new BotJsonPayload().set('custom_emoji_ids', ids);
        BotJsonPayload response = calloutService.call(TelegramBotMethod.GetCustomEmojiStickers, request);
        List<TelegramSticker> stickers = new List<TelegramSticker>();
        List<BotJsonPayload> stickerPayloads = response.getJsonPayloadList('result');
        for (BotJsonPayload payload : stickerPayloads) {
            stickers.add(new TelegramSticker(payload));
        }
        return stickers;
    }

    /**
     * @description Uploads a file with a sticker for later use in a sticker set
     * @param userId The user identifier of sticker owner
     * @param fileUrl A file with the sticker in `.WEBP`, `.PNG`, `.TGS`, or `.WEBM` format
     * @param stickerFormat The format of the sticker, must be one of `static`, `animated`, `video`
     * @return The instance of the <<TelegramFile>> class
     */
    global TelegramFile upload(String userId, String fileUrl, String stickerFormat) {
        BotJsonPayload request = new BotJsonPayload()
            .set('user_id', userId)
            .set('sticker', fileUrl)
            .set('sticker_format', stickerFormat);

        BotJsonPayload response = calloutService.call(TelegramBotMethod.UploadStickerFile, request);
        return new TelegramFile(response.getJsonPayload('result'));
    }

    /**
     * @description Changes the list of emojis assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set
     * @param stickerId The sticker file identifier
     * @param emojis The list of `1-20` emojis associated with the sticker
     */
    global void setEmojiList(String stickerId, List<String> emojis) {
        BotJsonPayload request = new BotJsonPayload().set('sticker', stickerId).set('emoji_list', emojis);

        calloutService.call(TelegramBotMethod.SetStickerEmojiList, request);
    }

    /**
     * @description Changes the list of search keywords assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set
     * @param stickerId The sticker file identifier
     * @param keywords The list of `0-20` keywords associated with the sticker with total length of up to `64 characters`
     */
    global void setKeywords(String stickerId, List<String> keywords) {
        BotJsonPayload request = new BotJsonPayload().set('sticker', stickerId).set('keywords', keywords, true);

        calloutService.call(TelegramBotMethod.SetStickerKeywords, request);
    }

    /**
     * @description Creates an instance of the `Telegram` sticker set service
     * @param name The sticker set name
     * @return The instance of the <<TelegramBotStickerSetService>> class
     */
    global TelegramBotStickerSetService set(String name) {
        return new TelegramBotStickerSetService(name, calloutService);
    }
}
