/**
 * @description Represents the context with variables and methods for handling the incoming updates for `Telegram` bots
 */
global class TelegramBotContext extends BotContext {
    /**
     * @description Provides methods for replying on the received `Telegram` update. E.g. send a message back
     * @throws BotContext.NoReplyOptionException When there is no chat payload in the received update event
     * @return The instance of the <<TelegramBotSenderService>> interface
     */
    global TelegramBotSenderService reply() {
        IBotChat chat = updateEvent.getChat();
        if (chat == null) {
            throw new BotContext.NoReplyOptionException(
                'Not possible to reply to an update. There is no chat reference in received update.',
                updateEvent.getPayload()
            );
        }
        return getService().send(chat.getId());
    }

    /**
     * @description Returns the instance of the `Telegram` bot service
     * @return The instance of the <<TelegramBotService>> class
     */
    global TelegramBotService getService() {
        return (TelegramBotService) service;
    }
}
