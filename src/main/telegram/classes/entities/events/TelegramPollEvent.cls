/**
 * @description Describes the common payload properties for the `Telegram` bot poll events.
 * Source: https://core.telegram.org/bots/api#poll
 */
global class TelegramPollEvent extends TelegramPoll {
    public TelegramPollEvent(BotJsonPayload payload) {
        super(payload);
    }
}
