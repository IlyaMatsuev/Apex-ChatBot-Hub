/**
 * @description Describes the contact payload that can be received as part of an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#contact
 */
global class TelegramBotContact extends BotPayload {
    /**
     * @description The contact's phone number
     */
    global String phoneNumber { get { return payload.getString('phone_number'); } }

    /**
     * @description The contact's first name
     */
    global String firstName { get { return payload.getString('first_name'); } }

    /**
     * @description The contact's last name
     */
    global String lastName { get { return payload.getString('last_name'); } }

    /**
     * @description The contact's user identifier in `Telegram`
     */
    global Integer userId { get { return payload.getInteger('user_id'); } }

    /**
     * @description The additional data about the contact in the form of a vCard
     */
    global String vCard { get { return payload.getString('vcard'); } }

    public TelegramBotContact(BotJsonPayload payload) {
        super(payload);
    }
}
