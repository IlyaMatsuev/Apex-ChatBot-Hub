/**
 * @description Represents the context with variables and methods for handling the incoming updates for `Viber` bots
 */
global class ViberBotContext extends BotContext {
    /**
     * @description Provides methods for replying on the received `Viber` update. E.g. send a message back
     * @throws BotContext.NoReplyOptionException When there is no chat payload in the received update event
     * @return The instance of the <<ViberBotSenderService>> interface
     */
    global ViberBotSenderService reply() {
        IBotChat chat = updateEvent.getChat();
        if (chat == null) {
            throw new BotContext.NoReplyOptionException(
                'Not possible to reply to an update. There is no chat reference in received update.',
                updateEvent.getPayload()
            );
        }
        return getService().send(updateEvent.getChat().getId());
    }

    /**
     * @description Returns a received `Viber` bot update event
     * @return The instance of the <<ViberUpdateEvent>> class
     */
    global ViberUpdateEvent getUpdateEvent() {
        return (ViberUpdateEvent) updateEvent;
    }

    /**
     * @description Returns the instance of the `Viber` bot service
     * @return The instance of the <<ViberBotService>> class
     */
    global ViberBotService getService() {
        return (ViberBotService) service;
    }
}
