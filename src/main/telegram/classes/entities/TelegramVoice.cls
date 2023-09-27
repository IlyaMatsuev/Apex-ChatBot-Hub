/**
 * @description Describes the voice payload that can be received as part of an update from a `Telegram` bot.
 * Source: https://core.telegram.org/bots/api#voice
 */
global class TelegramVoice extends BotPayload {
    /**
     * @description The identifier for this file, which can be used to download or reuse the file
     */
    global String fileId { get { return payload.getString('file_id'); } }

    /**
     * @description The unique identifier for this file, which is supposed to be the same over time and for different bots
     */
    global String fileUniqueId { get { return payload.getString('file_unique_id'); } }

    /**
     * @description The duration of the audio in seconds as defined by sender or by audio tags
     */
    global Integer duration { get { return payload.getInteger('duration'); } }

    /**
     * @description The MIME type of the file as defined by sender
     */
    global String mimeType { get { return payload.getString('mime_type'); } }

    /**
     * @description The file size in bytes
     */
    global Integer fileSize { get { return payload.getInteger('file_size'); } }

    public TelegramVoice(BotJsonPayload payload) {
        super(payload);
    }
}
