/**
 * @description Describes the common payload properties for the `Telegram` bot message events.
 * Source: https://core.telegram.org/bots/api#message
 */
global class TelegramMessageEvent extends TelegramMessage {
    public TelegramMessageEvent(BotJsonPayload payload) {
        super(payload);
    }
}
