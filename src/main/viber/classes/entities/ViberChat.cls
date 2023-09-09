/**
 * @description Describes the chat payload received as an update from a `Viber` bot
 */
global class ViberChat extends BotPayload implements IBotChat {
    public ViberChat(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Returns the `Viber` chat id
     * @return The `Viber` chat id
     */
    global String getId() {
        return payload.getString('id');
    }

    /**
     * @description Returns the chat title
     * @return The chat title
     */
    global String getTitle() {
        return payload.getString('name');
    }

    /**
     * @description Returns the payload of the `Viber` user who wrote the message received in the update
     * @return The instance of the <<ViberUser>> class
     */
    global ViberUser getSender() {
        return new ViberUser(payload);
    }
}
