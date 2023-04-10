/**
 * @description Describes the chat payload received as an update from a `Viber` bot
 */
global class ViberBotChat extends ValueMap implements IBotChat {
    /**
     * @description Returns the `Viber` chat id
     * @return The `Viber` chat id
     */
    global String getId() {
        return getString('id');
    }

    /**
     * @description Returns the chat title
     * @return The chat title
     */
    global String getTitle() {
        return getString('name');
    }

    /**
     * @description Returns the payload of the `Viber` user who wrote the message received in the update
     * @return The instance of the <<ViberBotUser>> interface
     */
    global ViberBotUser getSender() {
        return (ViberBotUser) ValueMap.fromJson(toJson(), ViberBotUser.class);
    }
}
