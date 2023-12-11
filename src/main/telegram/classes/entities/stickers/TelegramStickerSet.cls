/**
 * @description Describes the `Telegram` sticker set payload.
 * Source: https://core.telegram.org/bots/api#stickerset
 */
global class TelegramStickerSet extends BotPayload {
    /**
     * @description The sticker set name
     */
    global String name { get { return payload.getString('name'); } }

    /**
     * @description The sticker set title
     */
    global String title { get { return payload.getString('title'); } }

    /**
     * @description The type of the stickers in the set, one of `regular`, `mask`, `custom_emoji`
     */
    global String stickerType { get { return payload.getString('sticker_type'); } }

    /**
     * @description `True`, if the sticker set contains animated stickers
     */
    global Boolean isAnimated { get { return payload.getBoolean('is_animated'); } }

    /**
     * @description `True`, if the sticker set contains video stickers
     */
    global Boolean isVideo { get { return payload.getBoolean('is_video'); } }

    /**
     * @description The list of all set sticker
     */
    global List<TelegramSticker> stickers {
        get {
            if (stickers == null) {
                stickers = new List<TelegramSticker>();
                for (BotJsonPayload payload : payload.getJsonPayloadList('stickers')) {
                    stickers.add(new TelegramSticker(payload));
                }
            }
            return stickers;
        }
        private set;
    }

    /**
     * @description The sticker set thumbnail
     */
    global TelegramPhotoSize thumbnail { get { return new TelegramPhotoSize(payload.getJsonPayload('thumbnail')); } }

    public TelegramStickerSet(BotJsonPayload payload) {
        super(payload);
    }
}
