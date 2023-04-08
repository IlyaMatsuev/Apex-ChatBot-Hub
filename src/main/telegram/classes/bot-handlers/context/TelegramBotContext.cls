/**
 * @description Represents the context with variables and entities for handling the incoming updates for `Telegram` bots
 */
global class TelegramBotContext extends BotContext {
    /**
     * @description Provides methods for replying on the received `Telegram` update. E.g. send a message back
     * @return The instance of the <<TelegramBotSenderService>> interface
     */
    global TelegramBotSenderService reply() {
        return getService().send(getReceivedUpdate().getChat().getId());
    }

    /**
     * @description Returns the instance of the `Telegram` bot service
     * @return The instance of the <<TelegramBotService>> class
     */
    global TelegramBotService getService() {
        return (TelegramBotService) service;
    }

    /**
     * @description Returns the payload received as the update from the `Telegram` bot
     * @return The instance of the <<TelegramBotUpdateEventEntity>> class
     */
    global TelegramBotUpdateEventEntity getReceivedUpdate() {
        return (TelegramBotUpdateEventEntity) updateEntity;
    }

    protected override ValueMap initializeUpdateEntity(String payload) {
        return ValueMap.fromJson(payload, TelegramBotUpdateEventEntity.class);
    }
}
