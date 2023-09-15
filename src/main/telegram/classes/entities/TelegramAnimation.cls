/**
 * @description Describes the animation payload that can be received as part of an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#animation
 */
global class TelegramAnimation extends BotPayload {
    /**
     * @description The identifier for this file, which can be used to download or reuse the file
     */
    global String fileId { get { return payload.getString('file_id'); } }

    /**
     * @description The unique identifier for this file, which is supposed to be the same over time and for different bots
     */
    global String fileUniqueId { get { return payload.getString('file_unique_id'); } }

    /**
     * @description The animation width
     */
    global Integer width { get { return payload.getInteger('width'); } }

    /**
     * @description The animation height
     */
    global Integer height { get { return payload.getInteger('height'); } }

    /**
     * @description The duration of the video in seconds as defined by sender
     */
    global Integer duration { get { return payload.getInteger('duration'); } }

    /**
     * @description The animation thumbnail as defined by sender
     */
    global TelegramPhotoSize thumbnail { get { return new TelegramPhotoSize(payload.getJsonPayload('thumbnail')); } }

    /**
     * @description The original animation filename as defined by sender
     */
    global String fileName { get { return payload.getString('file_name'); } }

    /**
     * @description The MIME type of the file as defined by sender
     */
    global String mimeType { get { return payload.getString('mime_type'); } }

    /**
     * @description The file size in bytes
     */
    global Integer fileSize { get { return payload.getInteger('file_size'); } }

    public TelegramAnimation(BotJsonPayload payload) {
        super(payload);
    }
}
