/**
 * @description Describes the input contact message payload that can be attached as part of answer to a `Telegram` bot inline query.
 * Source: https://core.telegram.org/bots/api#inputcontactmessagecontent
 */
global class TelegramInputContactMessageContent extends TelegramInputMessageContent {
    /**
     * @description Creates a new instance of the input message with the provided contact details
     * @param firstName The contact's first name
     * @param phoneNumber The contact's phone number
     */
    global TelegramInputContactMessageContent(String firstName, String phoneNumber) {
        payload.set('first_name', firstName);
        payload.set('phone_number', phoneNumber);
    }

    /**
     * @description Sets the contact's last name
     * @param lastName The contact's last name
     * @return The current instance of the <<TelegramInputContactMessageContent>> class
     */
    global TelegramInputContactMessageContent withLastName(String lastName) {
        payload.set('last_name', lastName);
        return this;
    }

    /**
     * @description Sets the contact's vCard
     * @param vCard The contact's vCard
     * @return The current instance of the <<TelegramInputContactMessageContent>> class
     */
    global TelegramInputContactMessageContent withVCard(String vCard) {
        payload.set('vcard', vCard);
        return this;
    }
}
