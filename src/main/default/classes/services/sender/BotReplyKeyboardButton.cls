/**
 * @description The builder-like class for building custom keyboard buttons, used as reply by the user
 */
global class BotReplyKeyboardButton {
    /**
     * @description The button text. Will be sent to the bot as a message if the button is clicked
     */
    global final String text;
    /**
     * @description Determines whether the button is meant for sharing a user's phone number. Sends the user phone number to the bot instead of the `text` value
     */
    global Boolean sharesContact;
    /**
     * @description Determines whether the button is meant for sharing a user's location. Sends the user location to the bot instead of the `text` value
     */
    global Boolean sharesLocation;

    /**
     * @description Creates an instance of the button with the provided text
     * @param text The button text
     */
    global BotReplyKeyboardButton(String text) {
        this.text = text;
        this.sharesContact = false;
        this.sharesLocation = false;
    }

    /**
     * @description Makes the current button to share the user's phone number when clicked
     * @return The current <<BotReplyKeyboardButton>> instance
     */
    global BotReplyKeyboardButton shareContact() {
        this.sharesContact = true;
        this.sharesLocation = false;
        return this;
    }

    /**
     * @description Makes the current button to share the user's location when clicked
     * @return The current <<BotReplyKeyboardButton>> instance
     */
    global BotReplyKeyboardButton shareLocation() {
        this.sharesLocation = true;
        this.sharesContact = false;
        return this;
    }
}
