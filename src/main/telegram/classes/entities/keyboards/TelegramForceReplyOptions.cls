/**
 * @description Represents parameters wrapper for sending a force reply to the user via the `Telegram` bot service.
 * Source: https://core.telegram.org/bots/api#forcereply
 */
global class TelegramForceReplyOptions extends BotPayload {
    /**
     * @description Creates an instance of the force reply options without any additional parameters
     */
    global TelegramForceReplyOptions() {
        super(new BotJsonPayload().set('force_reply', true));
    }

    /**
     * @description Sets the placeholder to be shown in the input field when the force reply applied
     * @param placeholder The placeholder text
     * @return The current <<TelegramForceReplyOptions>> instance
     */
    global TelegramForceReplyOptions setInputPlaceholder(String placeholder) {
        payload.set('input_field_placeholder', placeholder, true);
        return this;
    }

    /**
     * @description Makes the force reply available for the specific users only
     * 1) Users that are mentioned `@` in the sent message
     * 2) If the current message is a reply, use the target user
     * @param isSelective Determines whether the force reply will be available for the specific users only or not. Default is `false`
     * @return The current <<TelegramForceReplyOptions>> instance
     */
    global TelegramForceReplyOptions asSelective(Boolean isSelective) {
        payload.set('selective', isSelective, true);
        return this;
    }
}
