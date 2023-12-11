/**
 * @description Describes the `Telegram` optional parameters for creation of a sticker set.
 * Source: https://core.telegram.org/bots/api#createnewstickerset
 */
global class TelegramStickerSetCreateOptions extends BotPayload {
    /**
     * @description Sets the type of stickers in the set
     * @param stickerType The type of stickers in the set, pass `regular`, `mask`, or `custom_emoji`. By default, a regular sticker set is created
     * @return The current instance of the <<TelegramStickerSetCreateOptions>> class
     */
    global TelegramStickerSetCreateOptions withStickerType(String stickerType) {
        payload.set('sticker_type', stickerType, true);
        return this;
    }

    /**
     * @description Determines if stickers in the sticker set must be repainted to the color of text when used in messages, the accent color if used as emoji status, white on chat photos, or another appropriate color based on context
     * @param repaintingNeeded `True` if stickers in the sticker set must be repainted to the color of text when used in messages, the accent color if used as emoji status, white on chat photos, or another appropriate color based on context
     * @return The current instance of the <<TelegramStickerSetCreateOptions>> class
     */
    global TelegramStickerSetCreateOptions withRepainting(Boolean repaintingNeeded) {
        payload.set('needs_repainting', repaintingNeeded, true);
        return this;
    }
}
