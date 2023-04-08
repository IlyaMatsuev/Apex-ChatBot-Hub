/**
 * @description Describes the context methods that are common for all bot types
 */
global interface IBotContext {
    /**
     * @description Provides methods for replying on the received update. E.g. send a message back
     * @return The instance of the <<IBotSenderService>> interface
     */
    IBotSenderService reply();

    /**
     * @description Returns an instance of the <<IBotService>> for the current bot type
     * @return The instance of the <<IBotService>> interface
     */
    IBotService getService();

    /**
     * @description Returns the payload received as the update from a bot
     * @return The instance of the <<IBotUpdateEventEntity>> interface
     */
    IBotUpdateEventEntity getReceivedUpdate();
}
