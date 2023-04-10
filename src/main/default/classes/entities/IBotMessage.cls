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
     * @description Returns the message text
     * @return The message text
     */
    String getText();

    /**
     * @description Returns the message send date
     * @return The message send date
     */
    DateTime getSendDate();
}
