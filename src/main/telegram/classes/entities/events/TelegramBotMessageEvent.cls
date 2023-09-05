/**
 * @description Describes the common payload properties for the `Telegram` bot message events
 * Source: https://core.telegram.org/bots/api#message
 */
global class TelegramBotMessageEvent {
    private final BotJsonPayload eventPayload;

    /**
     * @description The unique identifier of the related message
     */
    global Integer messageId { get { return eventPayload.getInteger('message_id'); } }

    /**
     * @description The message text
     */
    global String text { get { return eventPayload.getString('text'); } }

    // TODO: Add other event properties, look here: https://core.telegram.org/bots/api#message

    public TelegramBotMessageEvent(TelegramBotUpdateEventType eventType, TelegramBotUpdateEvent event) {
        this.eventPayload = event.getPayload().getJsonPayload(eventType.name());
    }
}
