/**
 * @description Describes the message payload received as an update from a bot
 */
global interface IBotMessage {
    /**
     * @description Returns the message external id
     * @return The message external id
     */
    String getId();

    /**
     * @description Returns the message type
     * @return The instance of the <<BotMessageType>> enum
     */
    BotMessageType getType();

    /**
     * @description Returns the message text
     * @return The message text
     */
    String getText();

    /**
     * @description Returns the media URL if it was attached to the message
     * @return The message media URL
     */
    String getMediaUrl();

    /**
     * @description Returns the message send date
     * @return The message send date
     */
    DateTime getSendDate();

    /**
     * @description Returns the additional message parameters
     * @return The instance of the <<BotJsonPayload>> class
     */
    BotJsonPayload getParameters();
}
