/**
 * @description Represents the context with variables and entities for handling the incoming updates for `Viber` bots
 */
global class ViberBotContext extends BotContext {
    /**
     * @description Provides methods for replying on the received `Viber` update. E.g. send a message back
     * @return The instance of the <<ViberBotSenderService>> interface
     */
    global ViberBotSenderService reply() {
        return getService().send(getReceivedUpdate().getChat().getId());
    }

    /**
     * @description Returns the instance of the `Viber` bot service
     * @return The instance of the <<ViberBotService>> class
     */
    global ViberBotService getService() {
        return (ViberBotService) service;
    }

    /**
     * @description Returns the payload received as the update from the `Viber` bot
     * @return The instance of the <<ViberBotUpdateEvent>> class
     */
    global ViberBotUpdateEvent getReceivedUpdate() {
        return (ViberBotUpdateEvent) updateEntity;
    }

    protected override Type getUpdateEntityType() {
        return ViberBotUpdateEvent.class;
    }
}
