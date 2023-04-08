/**
 * @description Describes the payload received as an update from a bot
 */
global interface IBotUpdateEventEntity {
    /**
     * @description Returns the type of the received update
     * @return The instance of the <<BotUpdateEventType>> enum
     */
    BotUpdateEventType getType();

    /**
     * @description Returns the message payload received in the update. Can be null
     * @return The instance of the <<IBotMessageEntity>> interface
     */
    IBotMessageEntity getMessage();

    /**
     * @description Returns the sender payload received in the update
     * @return The instance of the <<IBotChatEntity>> interface
     */
    IBotChatEntity getChat();
}
