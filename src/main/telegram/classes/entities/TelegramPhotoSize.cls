/**
 * @description Describes the photo size payload that can be received as part of an update from a `Telegram` bot.
 * Source: https://core.telegram.org/bots/api#photosize
 */
global class TelegramPhotoSize extends BotPayload {
    /**
     * @description The identifier for this file, which can be used to download or reuse the file
     */
    global String fileId { get { return payload.getString('file_id'); } }

    /**
     * @description The unique identifier for this file, which is supposed to be the same over time and for different bots
     */
    global String fileUniqueId { get { return payload.getString('file_unique_id'); } }

    /**
     * @description The photo width
     */
    global Integer width { get { return payload.getInteger('width'); } }

    /**
     * @description The photo height
     */
    global Integer height { get { return payload.getInteger('height'); } }

    /**
     * @description The file size in bytes
     */
    global Integer fileSize { get { return payload.getInteger('file_size'); } }

    public TelegramPhotoSize(BotJsonPayload payload) {
        super(payload);
    }
}
