/**
 * @description Describes the contact result payload that can be attached as part of answer to a `Telegram` bot inline query.
 * Source: https://core.telegram.org/bots/api#inlinequeryresultcontact
 */
global class TelegramInlineQueryResultContact extends TelegramInlineQueryResult {
    /**
     * @description Creates a new instance of the contact inline query result with the provided result id, first name and phone number
     * @param id The unique identifier for the result, `1-64 bytes`
     * @param firstName The contact's first name
     * @param phoneNumber The contact's phone number
     */
    global TelegramInlineQueryResultContact(String id, String firstName, String phoneNumber) {
        super(id, 'contact');
        payload.set('first_name', firstName);
        payload.set('phone_number', phoneNumber);
    }

    /**
     * @description Sets the contact's last name
     * @param lastName The contact's last name
     * @return The current instance of the <<TelegramInlineQueryResultContact>> class
     */
    global TelegramInlineQueryResultContact withLastName(String lastName) {
        payload.set('last_name', lastName);
        return this;
    }

    /**
     * @description Sets the contact's vCard
     * @param vCard The contact's vCard
     * @return The current instance of the <<TelegramInlineQueryResultContact>> class
     */
    global TelegramInlineQueryResultContact withVCard(String vCard) {
        payload.set('vcard', vCard);
        return this;
    }

    /**
     * @description Sets the thumbnail for the inline result
     * @param url The thumbnail URL
     * @param width The thumbnail width
     * @param height The thumbnail height
     * @return The current instance of the <<TelegramInlineQueryResultContact>> class
     */
    global TelegramInlineQueryResultContact withThumbnail(String url, Integer width, Integer height) {
        payload.set('thumbnail_url', url);
        payload.set('thumbnail_width', width, true);
        payload.set('thumbnail_height', height, true);
        return this;
    }

    /**
     * @description Sets the inline keyboard to the message
     * @param keyboard The inline keyboard attached to the message
     * @return The current instance of the <<TelegramInlineQueryResultContact>> class
     */
    global TelegramInlineQueryResultContact withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        return (TelegramInlineQueryResultContact) addInlineKeyboard(keyboard);
    }

    /**
     * @description Sets the content of the message to be sent instead of the contact
     * @param messageContent The content of the message to be sent
     * @return The current instance of the <<TelegramInlineQueryResultContact>> class
     */
    global TelegramInlineQueryResultContact withInputMessage(TelegramInputMessageContent messageContent) {
        return (TelegramInlineQueryResultContact) addInputMessage(messageContent);
    }
}
