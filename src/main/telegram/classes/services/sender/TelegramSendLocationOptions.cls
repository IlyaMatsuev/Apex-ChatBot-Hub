/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendLocation` method. The source: https://core.telegram.org/bots/api#sendlocation
 */
global class TelegramSendLocationOptions extends BotJsonPayload {
    /**
     * @description Sets the forum channel thread id where the message has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendLocationOptions>> class
     */
    global TelegramSendLocationOptions withThreadId(String threadId) {
        set('message_thread_id', BotUtils.parseExternalId(threadId), true);
        return this;
    }

    /**
     * @description Sets the radius of uncertainty for the location, measured in meters
     * @param accuracy The radius of uncertainty for the location in meters. Accepts values in range: `0..1500`
     * @return The current instance of the <<TelegramSendLocationOptions>> class
     */
    global TelegramSendLocationOptions withHorizontalAccuracy(Decimal accuracy) {
        set('horizontal_accuracy', accuracy, true);
        return this;
    }

    /**
     * @description Sets the period in seconds for which the location will be updated
     * @param period The period in seconds for which the location will be updated. Accepts values in range: `60..86400`
     * @return The current instance of the <<TelegramSendLocationOptions>> class
     */
    global TelegramSendLocationOptions withLivePeriod(Integer period) {
        set('live_period', period, true);
        return this;
    }

    /**
     * @description Sets the maximum distance in meters for proximity alerts about approaching another chat member
     * @param period The maximum distance in meters for proximity alerts about approaching another chat member. Accepts values in range: `1..100000`
     * @return The current instance of the <<TelegramSendLocationOptions>> class
     */
    global TelegramSendLocationOptions withProximityAlertRadius(Integer alertRadius) {
        set('proximity_alert_radius', alertRadius, true);
        return this;
    }

    /**
     * @description Sets the direction in degrees in which the user is moving
     * @param heading The direction in degrees in which the user is moving. Accepts values in range: `1..360`
     * @return The current instance of the <<TelegramSendLocationOptions>> class
     */
    global TelegramSendLocationOptions withHeading(Integer heading) {
        set('heading', heading, true);
        return this;
    }

    /**
     * @description Sends the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendLocationOptions>> class
     */
    global TelegramSendLocationOptions withoutNotification() {
        set('disable_notification', true);
        return this;
    }

    /**
     * @description Protects the contents of the sent message from forwarding and saving
     * @return The current instance of the <<TelegramSendLocationOptions>> class
     */
    global TelegramSendLocationOptions withProtectedContent() {
        set('protect_content', true);
        return this;
    }

    /**
     * @description Sends the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendLocationOptions>> class
     */
    global TelegramSendLocationOptions asReplyToMessage(String messageId) {
        set('reply_to_message_id', BotUtils.parseExternalId(messageId), true);
        set('allow_sending_without_reply', true);
        return this;
    }
}
