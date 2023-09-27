/**
 * @description Describes the video note payload that can be received as part of an update from a `Telegram` bot.
 * Source: https://core.telegram.org/bots/api#videonote
 */
global class TelegramVideoNote extends BotPayload {
    /**
     * @description The identifier for this file, which can be used to download or reuse the file
     */
    global String fileId { get { return payload.getString('file_id'); } }

    /**
     * @description The unique identifier for this file, which is supposed to be the same over time and for different bots
     */
    global String fileUniqueId { get { return payload.getString('file_unique_id'); } }

    /**
     * @description The video width and height (diameter of the video message) as defined by sender
     */
    global Integer length { get { return payload.getInteger('height'); } }

    /**
     * @description The duration of the video in seconds as defined by sender
     */
    global Integer duration { get { return payload.getInteger('duration'); } }

    /**
     * @description The video thumbnail
     */
    global TelegramPhotoSize thumbnail { get { return new TelegramPhotoSize(payload.getJsonPayload('thumbnail')); } }

    /**
     * @description The file size in bytes
     */
    global Integer fileSize { get { return payload.getInteger('file_size'); } }

    public TelegramVideoNote(BotJsonPayload payload) {
        super(payload);
    }
}
