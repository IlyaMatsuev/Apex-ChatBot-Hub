/**
 * @description Represents parameters wrapper for sending a remove reply keyboard signal to the user via the `Telegram` bot service.
 * Source: https://core.telegram.org/bots/api#replykeyboardremove
 */
global class TelegramReplyKeyboardRemoveOptions extends BotPayload {
    /**
     * @description Creates an instance of the remove reply keyboard options without any additional parameters
     */
    global TelegramReplyKeyboardRemoveOptions() {
        super(new BotJsonPayload().set('remove_keyboard', true));
    }

    /**
     * @description Makes the reply keyboard removed for the specific users only
     * 1) Users that are mentioned `@` in the sent message
     * 2) If the current message is a reply, use the target user
     * @return The current <<TelegramReplyKeyboardRemoveOptions>> instance
     */
    global TelegramReplyKeyboardRemoveOptions asSelective() {
        return asSelective(true);
    }

    /**
     * @description Makes the reply keyboard removed for the specific users only
     * 1) Users that are mentioned `@` in the sent message
     * 2) If the current message is a reply, use the target user
     * @param isSelective Determines whether the reply keyboard will be removed for the specific users only or not. Default is `false`
     * @return The current <<TelegramReplyKeyboardRemoveOptions>> instance
     */
    global TelegramReplyKeyboardRemoveOptions asSelective(Boolean isSelective) {
        payload.set('selective', isSelective, true);
        return this;
    }
}
