/**
 * @description Describes the file payload that can be received as part of an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#file
 */
global class TelegramFile extends BotPayload {
    /**
     * @description The identifier for this file, which can be used to download or reuse the file
     */
    global String fileId { get { return payload.getString('file_id'); } }

    /**
     * @description The unique identifier for this file, which is supposed to be the same over time and for different bots
     */
    global String fileUniqueId { get { return payload.getString('file_unique_id'); } }

    /**
     * @description The file size in bytes
     */
    global Integer fileSize { get { return payload.getInteger('file_size'); } }

    /**
     * @description The file path
     */
    global String filePath { get { return payload.getString('file_path'); } }

    public TelegramFile(BotJsonPayload payload) {
        super(payload);
    }
}
