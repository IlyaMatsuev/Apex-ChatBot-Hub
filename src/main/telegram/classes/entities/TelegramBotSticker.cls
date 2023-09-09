/**
 * @description Describes the sticker payload that can be received as part of an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#sticker
 */
global class TelegramBotSticker extends BotPayload {
    /**
     * @description The identifier for this file, which can be used to download or reuse the file
     */
    global String fileId { get { return payload.getString('file_id'); } }

    /**
     * @description The unique identifier for this file, which is supposed to be the same over time and for different bots
     */
    global String fileUniqueId { get { return payload.getString('file_unique_id'); } }

    /**
     * @description The type of the sticker, one of `regular`, `mask`, `custom_emoji`
     */
    global String type { get { return payload.getString('type'); } }

    /**
     * @description The sticker width
     */
    global Integer width { get { return payload.getInteger('width'); } }

    /**
     * @description The sticker height
     */
    global Integer height { get { return payload.getInteger('height'); } }

    /**
     * @description `True` if the sticker is animated
     */
    global Boolean isAnimated { get { return payload.getBoolean('is_animated'); } }

    /**
     * @description `True` if the sticker is a video sticker
     */
    global Boolean isVideo { get { return payload.getBoolean('is_video'); } }

    /**
     * @description The sticker thumbnail in the .WEBP or .JPG format
     */
    global TelegramBotPhotoSize thumbnail {
        get { return new TelegramBotPhotoSize(payload.getJsonPayload('thumbnail')); }
    }

    /**
     * @description The emoji associated with the sticker
     */
    global String emoji { get { return payload.getString('emoji'); } }

    /**
     * @description The name of the sticker set to which the sticker belongs
     */
    global String setName { get { return payload.getString('set_name'); } }

    /**
     * @description For premium regular stickers, premium animation for the sticker
     */
    global TelegramBotFile premiumAnimation {
        get { return new TelegramBotFile(payload.getJsonPayload('premium_animation')); }
    }

    /**
     * @description For mask stickers, the position where the mask should be placed
     */
    global TelegramBotMaskPosition maskPosition {
        get { return new TelegramBotMaskPosition(payload.getJsonPayload('mask_position')); }
    }

    /**
     * @description For custom emoji stickers, unique identifier of the custom emoji
     */
    global String customEmojiId { get { return payload.getString('custom_emoji_id'); } }

    /**
     * @description `True` if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places
     */
    global Boolean needsRepainting { get { return payload.getBoolean('needs_repainting'); } }

    /**
     * @description The file size in bytes
     */
    global Integer fileSize { get { return payload.getInteger('file_size'); } }

    public TelegramBotSticker(BotJsonPayload payload) {
        super(payload);
    }
}
