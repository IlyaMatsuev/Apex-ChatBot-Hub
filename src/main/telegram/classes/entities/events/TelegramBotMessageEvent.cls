/**
 * @description Describes the common payload properties for the `Telegram` bot message events
 * Source: https://core.telegram.org/bots/api#message
 */
global class TelegramBotMessageEvent extends TelegramBotMessage {
    public TelegramBotMessageEvent(BotJsonPayload payload) {
        super(payload);
    }
}
