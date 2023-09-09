/**
 * @description Describes the common payload properties for the `Telegram` bot message events
 * Source: https://core.telegram.org/bots/api#message
 */

// TODO: Need to rename all entities to remove `Bot` part
global class TelegramBotMessageEvent extends TelegramBotMessage {
    public TelegramBotMessageEvent(BotJsonPayload payload) {
        super(payload);
    }
}
