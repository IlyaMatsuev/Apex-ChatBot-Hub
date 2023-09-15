/**
 * @description Describes the chat payload received as an update from a bot
 */
global interface IBotChat {
    /**
     * @description Returns the chat external id
     * @return The chat external id
     */
    String getId();

    /**
     * @description Returns the chat title
     * @return The chat title
     */
    String getTitle();

    /**
     * @description Returns the payload of the user who wrote the message received in the update
     * @return The instance of the <<IBotUser>> interface
     */
    IBotUser getSender();
}
