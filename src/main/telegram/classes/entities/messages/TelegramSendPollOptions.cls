/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendPoll` method.
 * Source: https://core.telegram.org/bots/api#sendpoll
 */
global class TelegramSendPollOptions extends TelegramSendMessageOptions {
    /**
     * @description The list of poll answers (options)
     */
    global List<String> answers {
        get { return (List<String>) payload.get('options'); }
        set { payload.set('options', value); }
    }

    /**
     * @description Creates a new instance of the poll options
     */
    global TelegramSendPollOptions() {
        super('explanation_entities');
    }

    /**
     * @description Sets the forum channel thread id where the message has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions withThreadId(String threadId) {
        return (TelegramSendPollOptions) setThreadId(threadId);
    }

    /**
     * @description Adds an answer to the poll
     * @param answer The poll answer to add
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions withAnswer(String answer) {
        return withAnswers(new List<String> { answer });
    }

    /**
     * @description Adds the list of answers to the poll
     * @param answers The list of answers for the poll
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions withAnswers(String[] answers) {
        if (this.answers == null) {
            this.answers = new List<String>();
        }
        this.answers.addAll(answers);
        return this;
    }

    /**
     * @description Makes the poll anonymous
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions asAnonymous() {
        return asAnonymous(true);
    }

    /**
     * @description Determines whether the poll should be anonymous or not
     * @param isAnonymous Determines whether the poll should be anonymous or not. Default is `true`
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions asAnonymous(Boolean isAnonymous) {
        payload.set('is_anonymous', isAnonymous, true);
        return this;
    }

    /**
     * @description Allows selecting multiple answers or not. Ignored for `quiz` polls
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions allowMultipleAnswers() {
        return allowMultipleAnswers(true);
    }

    /**
     * @description Determines whether the poll should allow selecting multiple answers or not. Ignored for `quiz` polls
     * @param allowMultiAnswers Determines whether the poll should allow selecting multiple answers or not. Default is `false`
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions allowMultipleAnswers(Boolean allowMultiAnswers) {
        payload.set('allows_multiple_answers', allowMultiAnswers, true);
        return this;
    }

    /**
     * @description Sends the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions withoutNotification() {
        return (TelegramSendPollOptions) disableNotification();
    }

    /**
     * @description Protects the contents of the sent message from forwarding and saving
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions withProtectedContent() {
        return (TelegramSendPollOptions) setProtectedContent();
    }

    /**
     * @description Sends the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions asReplyToMessage(String messageId) {
        return (TelegramSendPollOptions) setReplyMessageId(messageId);
    }

    /**
     * @description Makes the poll to be a `quiz`
     * @param correctOptionId The id of the correct answer, starting from `0`
     * @param explanation The text that is shown when a user chooses an incorrect answer or taps on the lamp icon
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions asQuiz(Integer correctOptionId, String explanation) {
        payload.set('type', 'quiz');
        payload.set('correct_option_id', correctOptionId, true);
        payload.set('explanation', explanation, true);
        return this;
    }

    /**
     * @description Sets the explanation text parse mode. Needed when the text is formatted with HTML or Markdown markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions withExplanationParseMode(String mode) {
        payload.set('explanation_parse_mode', mode, true);
        return this;
    }

    /**
     * @description Adds a special entity that appear in the explanation text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions withExplanationMessageEntity(TelegramMessageEntity entity) {
        return withExplanationMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the explanation text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions withExplanationMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramSendPollOptions) addMessageEntities(entities);
    }

    /**
     * @description Specifies the amount of time the poll will be active after creation. Does not work when the `close date` is set
     * @param period The amount of time in seconds. Accepts values in range: `5..600`
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions withOpenPeriod(Integer period) {
        payload.set('open_period', period, true);
        return this;
    }

    /**
     * @description Specifies the date after creation when poll should be closed. Does not work when the `open period` is set
     * @param closeDate The date in future when the poll should be closed. Should be at least `5` and no more than `600` seconds in future
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions withCloseDate(DateTime closeDate) {
        payload.set('close_date', BotUtils.parseShortUnixTimestamp(closeDate), true);
        return this;
    }

    /**
     * @description Marks the poll immediately closed
     * @return The current instance of the <<TelegramSendPollOptions>> class
     */
    global TelegramSendPollOptions asClosed() {
        payload.set('is_closed', true);
        return this;
    }
}
