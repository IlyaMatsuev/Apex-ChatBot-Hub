/**
 * @description The interface that is required to implement to handle chat bot updates
 * @group Interfaces
 */
global interface IBotHandler {
    /**
     * @description Handles the incoming events for a bot. For example new message from a user
     * @param context The context variable that contains all necessary methods for handling the incoming update
     * @param event The information about the received update from the bot. E.g. new message, sender, chat, etc.
     */
    void handle(IBotContext context, IBotUpdateEvent event);
}
