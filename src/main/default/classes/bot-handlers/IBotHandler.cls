/**
 * @description The interface that is required to implement for creating new `Bot__c` records
 */
global interface IBotHandler {
    /**
     * @description Handles the incoming events for a bot. For example new message from a user
     * @param context The context variable that contains all necessary information for handling the incoming update
     */
    void handle(BotContext context);
}
