/**
 * @description Represents the context with variables and methods for handling the incoming updates for `Telegram` bots
 */
global class TelegramBotContext extends BotContext {
    /**
     * @description Provides methods for replying on the received `Telegram` update. E.g. send a message back
     * @return The instance of the <<TelegramBotSenderService>> interface
     */
    global TelegramBotSenderService reply() {
        return getService().send(updateEvent.getChat().getId());
    }

    /**
     * @description Returns the instance of the `Telegram` bot service
     * @return The instance of the <<TelegramBotService>> class
     */
    global TelegramBotService getService() {
        return (TelegramBotService) service;
    }
}
