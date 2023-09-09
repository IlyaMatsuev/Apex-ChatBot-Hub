/**
 * @description The builder-like class that represents parameters for sending a custom reply keyboard to the user via the `Telegram` bot service.
 * Source: https://core.telegram.org/bots/api#replykeyboardmarkup
 */
global class TelegramReplyKeyboardMarkupOptions extends BotPayload {
    /**
     * @description The matrix of keyboard buttons to be shown to the receiver. Represents the list of button rows
     */
    global List<List<Button>> buttons {
        get { return (List<List<Button>>) payload.get('keyboard'); }
        private set { payload.set('keyboard', value); }
    }

    /**
     * @description Creates an instance of the reply keyboard without any buttons, so that they can be added separately
     */
    global TelegramReplyKeyboardMarkupOptions() {
        this(new List<Button>());
    }

    /**
     * @description Creates an instance of the reply keyboard with the provided buttons row
     * @param buttons The list of buttons as a single row to be shown to the user
     */
    global TelegramReplyKeyboardMarkupOptions(Button[] buttons) {
        this(new List<List<Button>> { buttons });
    }

    /**
     * @description Creates an instance of the reply keyboard with the provided buttons matrix
     * @param buttons The list of button rows to be shown to the user
     */
    global TelegramReplyKeyboardMarkupOptions(List<List<Button>> buttons) {
        super();
        this.buttons = buttons;
    }

    /**
     * @description Adds a button to the keyboard's first row
     * @param button The button to be added to the first row on the keyboard
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions addButton(Button button) {
        return addButtons(new List<Button> { button });
    }

    /**
     * @description Adds a button to the specific keyboard's row
     * @param row The row number to add the button to. Counting starts from `0`
     * @param button The button to be added to the specified row on the keyboard
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions addButton(Integer row, Button button) {
        return addButtons(row, new List<Button> { button });
    }

    /**
     * @description Adds multiple buttons to the keyboard's first row
     * @param buttons The buttons to be added to the first row on the keyboard
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions addButtons(Button[] buttons) {
        return addButtons(0, buttons);
    }

    /**
     * @description Adds multiple buttons to the specific keyboard's row
     * @param row The row number to add the buttons to. Counting starts from `0`
     * @param buttons The buttons to be added to the specified row on the keyboard
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions addButtons(Integer row, Button[] buttons) {
        // Filling empty places to avoid `index out of bounds` exception
        while (this.buttons.size() < row + 1) {
            this.buttons.add(new List<Button>());
        }
        this.buttons.get(row).addAll(buttons);
        return this;
    }

    /**
     * @description Allows to resize the keyboard vertically depending on the buttons height. By default the keyboard is always of the same size
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions allowResizeKeyboard() {
        return allowResizeKeyboard(true);
    }

    /**
     * @description Allows to resize the keyboard vertically depending on the buttons height. By default the keyboard is always of the same size
     * @param allowResize Allows to resize the keyboard vertically depending on the buttons height. Default is `false`
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions allowResizeKeyboard(Boolean allowResize) {
        payload.set('resize_keyboard', allowResize, true);
        return this;
    }

    /**
     * @description Makes the keyboard always shown to the client when the regular keyboard is hidden. By default the custom keyboard can be hidden and opened with an icon
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions asPersistent() {
        return asPersistent(true);
    }

    /**
     * @description Makes the keyboard always shown to the client when the regular keyboard is hidden. By default the custom keyboard can be hidden and opened with an icon
     * @param isPersistent Determines whether the keyboard always shown to the client when the regular keyboard is hidden. Default is `false`
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions asPersistent(Boolean isPersistent) {
        payload.set('is_persistent', isPersistent, true);
        return this;
    }

    /**
     * @description Makes the keyboard hidden as soon as it's used. User will have to open a custom keyboard manually after that, if needed
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions asOneTimeKeyboard() {
        return asOneTimeKeyboard(true);
    }

    /**
     * @description Makes the keyboard hidden as soon as it's used. User will have to open a custom keyboard manually after that, if needed
     * @param isOneTime Determines whether the keyboard should be hidden as soon as it's used. Default is `false`
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions asOneTimeKeyboard(Boolean isOneTime) {
        payload.set('one_time_keyboard', isOneTime, true);
        return this;
    }

    /**
     * @description Sets the placeholder to be shown in the input field when the keyboard is active
     * @param placeholder The placeholder text
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions setInputPlaceholder(String placeholder) {
        payload.set('input_field_placeholder', placeholder, true);
        return this;
    }

    /**
     * @description Makes the keyboard available for the specific users only
     * 1) Users that are mentioned `@` in the sent message
     * 2) If the current message is a reply, use the target user
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions asSelective() {
        return asSelective(true);
    }

    /**
     * @description Makes the keyboard available for the specific users only
     * 1) Users that are mentioned `@` in the sent message
     * 2) If the current message is a reply, use the target user
     * @param isSelective Determines whether the keyboard available for the specific users only or not. Default is `false`
     * @return The current <<TelegramReplyKeyboardMarkupOptions>> instance
     */
    global TelegramReplyKeyboardMarkupOptions asSelective(Boolean isSelective) {
        payload.set('selective', isSelective, true);
        return this;
    }

    /**
     * @description The builder-like class representing a button in the `Telegram` reply keyboard.
     * Source: https://core.telegram.org/bots/api#keyboardbutton
     */
    global class Button extends BotPayload {
        /**
         * @description Creates an instance of the button with the provided text
         * @param text The button text
         */
        global Button(String text) {
            super();
            payload.set('text', text);
        }

        /**
         * @description Determines if the clicking on the button will request to share user's contact details with the bot
         * @return The current <<TelegramReplyKeyboardMarkupOptions.Button>> instance
         */
        global Button asContactRequest() {
            payload.set('request_contact', true);
            return this;
        }

        /**
         * @description Determines if the clicking on the button will request to share user's location with the bot
         * @return The current <<TelegramReplyKeyboardMarkupOptions.Button>> instance
         */
        global Button asLocationRequest() {
            payload.set('request_location', true);
            return this;
        }

        /**
         * @description Determines if the clicking on the button will request to share specific users with the bot (user will get a prompt with the list of available users)
         * @return The current <<TelegramReplyKeyboardMarkupOptions.Button>> instance
         */
        global Button asUserRequest() {
            return asUserRequest(false, false);
        }

        /**
         * @description Determines if the clicking on the button will request to share specific users with the bot (user will get a prompt with the list of available users)
         * @param botsOnly Determines if the user should be able to choose from their bots
         * @param premiumOnly Determines if the user should be able to choose from their contacts with premium account
         * @return The current <<TelegramReplyKeyboardMarkupOptions.Button>> instance
         */
        global Button asUserRequest(Boolean botsOnly, Boolean premiumOnly) {
            payload.set(
                'request_user',
                new BotJsonPayload()
                    .set('request_id', DateTime.now().getTime().intValue())
                    .set('user_is_bot', botsOnly, true)
                    .set('user_is_premium', premiumOnly, true)
            );
            return this;
        }

        /**
         * @description Determines if the clicking on the button will request to share specific chats with the bot (user will get a prompt with the list of available chats)
         * @return The current <<TelegramReplyKeyboardMarkupOptions.Button>> instance
         */
        global Button asChatRequest() {
            return asChatRequest(new ButtonRequestChatConfigs());
        }

        /**
         * @description Determines if the clicking on the button will request to share specific chats with the bot (user will get a prompt with the list of available chats)
         * @param chatRequestConfigs The object with requirements for the chat to choose
         * @return The current <<TelegramReplyKeyboardMarkupOptions.Button>> instance
         */
        global Button asChatRequest(ButtonRequestChatConfigs chatRequestConfigs) {
            payload.set('request_chat', chatRequestConfigs);
            return this;
        }

        /**
         * @description Determines if the clicking on the button will request a user to create a poll and send it to the bot
         * @return The current <<TelegramReplyKeyboardMarkupOptions.Button>> instance
         */
        global Button asPollRequest() {
            return asPollRequest(null);
        }

        /**
         * @description Determines if the clicking on the button will request a user to create a poll of a specific type and send it to the bot
         * @param pollType The type of the poll to create. Possible values: `quiz`, `regular`
         * @return The current <<TelegramReplyKeyboardMarkupOptions.Button>> instance
         */
        global Button asPollRequest(String pollType) {
            payload.set('request_poll', new BotJsonPayload().set('type', pollType));
            return this;
        }

        /**
         * @description Determines if the clicking on the button will launch a specified web app
         * @param webAppUrl The URL of the web app to be launched
         * @return The current <<TelegramReplyKeyboardMarkupOptions.Button>> instance
         */
        global Button asWebAppLauncher(String webAppUrl) {
            payload.set('web_app', new BotJsonPayload().set('url', webAppUrl));
            return this;
        }
    }

    /**
     * @description The builder-like class for requesting to share a specific list of chats
     * Source: https://core.telegram.org/bots/api#keyboardbuttonrequestchat
     */
    global class ButtonRequestChatConfigs extends BotPayload {
        /**
         * @description Creates an instance of the request chat configs without any requirements
         */
        global ButtonRequestChatConfigs() {
            super();
            payload.set('request_id', DateTime.now().getTime().intValue());
        }

        /**
         * @description Requests only channel chats
         * @param isChannel Determines if channel chats should be only requested. Pass `false` to request group or supergroup chats
         * @return The current <<TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs>> instance
         */
        global ButtonRequestChatConfigs withChannels(Boolean isChannel) {
            payload.set('chat_is_channel', isChannel, true);
            return this;
        }

        /**
         * @description Requests only forum supergroup chats
         * @param isForum Determines if forum chats should be only requested. Pass `false` to request non-forum chats
         * @return The current <<TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs>> instance
         */
        global ButtonRequestChatConfigs withForums(Boolean isForum) {
            payload.set('chat_is_forum', isForum, true);
            return this;
        }

        /**
         * @description Requests only chats that have username
         * @param hasUsername Determines if chats with usernames should be only requested. Pass `false` to request chats without usernames
         * @return The current <<TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs>> instance
         */
        global ButtonRequestChatConfigs withUsername(Boolean hasUsername) {
            payload.set('chat_has_username', hasUsername, true);
            return this;
        }

        /**
         * @description Requests only chats that were created by the user
         * @param isCreated Determines if chats that were created by the user should be only requested
         * @return The current <<TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs>> instance
         */
        global ButtonRequestChatConfigs withCreated(Boolean isCreated) {
            payload.set('chat_is_created', isCreated, true);
            return this;
        }

        /**
         * @description Requests only chats were the bot is presented
         * @param hasBot Determines if chats were the bot is presented should be only requested
         * @return The current <<TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs>> instance
         */
        global ButtonRequestChatConfigs withBot(Boolean hasBot) {
            payload.set('bot_is_member', hasBot, true);
            return this;
        }

        /**
         * @description Requests only chats were the user has all provided rights list
         * @param rights The list of available rights for the user in a chat. All values can be checked here: https://core.telegram.org/bots/api#chatadministratorrights
         * @return The current <<TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs>> instance
         */
        global ButtonRequestChatConfigs withUserAdminRights(List<String> rights) {
            BotJsonPayload rightsList = new BotJsonPayload();
            for (String right : rights) {
                rightsList.set(right, true);
            }
            payload.set('user_administrator_rights', rightsList);
            return this;
        }

        /**
         * @description Requests only chats were the bot has all provided rights list
         * @param rights The list of available rights for the user in a chat. All values can be checked here: https://core.telegram.org/bots/api#chatadministratorrights
         * @return The current <<TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs>> instance
         */
        global ButtonRequestChatConfigs withBotAdminRights(List<String> rights) {
            BotJsonPayload rightsList = new BotJsonPayload();
            for (String right : rights) {
                rightsList.set(right, true);
            }
            payload.set('bot_administrator_rights', rightsList);
            return this;
        }
    }
}
