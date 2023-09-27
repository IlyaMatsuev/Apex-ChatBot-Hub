/**
 * @description Describes the poll payload that can be received as part of an update from a `Telegram` bot.
 * Source: https://core.telegram.org/bots/api#poll
 */
global virtual class TelegramPoll extends BotPayload {
    /**
     * @description The unique poll identifier
     */
    global String id { get { return payload.getString('id'); } }

    /**
     * @description The poll question, `1-300` characters
     */
    global String question { get { return payload.getString('question'); } }

    /**
     * @description The list of poll options
     */
    global List<Option> options {
        get {
            List<Option> opts = new List<Option>();
            List<BotJsonPayload> payloadList = payload.getJsonPayloadList('options');
            if (payloadList != null) {
                for (BotJsonPayload payload : payloadList) {
                    opts.add(new Option(payload));
                }
            }
            return opts;
        }
    }

    /**
     * @description The total number of users that voted in the poll
     */
    global Integer totalVoterCount { get { return payload.getInteger('total_voter_count'); } }

    /**
     * @description `True` if the poll is closed
     */
    global Boolean isClosed { get { return payload.getBoolean('is_closed'); } }

    /**
     * @description `True` if the poll is anonymous
     */
    global Boolean isAnonymous { get { return payload.getBoolean('is_anonymous'); } }

    /**
     * @description The poll type, currently can be `regular` or `quiz`
     */
    global String type { get { return payload.getString('type'); } }

    /**
     * @description `True` if the poll allows multiple answers
     */
    global Boolean allowsMultipleAnswers { get { return payload.getBoolean('allows_multiple_answers'); } }

    /**
     * @description The 0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot
     */
    global Integer correctOptionId { get { return payload.getInteger('correct_option_id'); } }

    /**
     * @description The text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, `0-200` characters
     */
    global String explanation { get { return payload.getString('explanation'); } }

    /**
     * @description The special entities like usernames, URLs, bot commands, etc. that appear in the explanation
     */
    global List<TelegramMessageEntity> explanationEntities {
        get {
            List<TelegramMessageEntity> entities = new List<TelegramMessageEntity>();
            List<BotJsonPayload> payloadList = payload.getJsonPayloadList('explanation_entities');
            if (payloadList != null) {
                for (BotJsonPayload payload : payloadList) {
                    entities.add(new TelegramMessageEntity(payload));
                }
            }
            return entities;
        }
    }

    /**
     * @description The amount of time in seconds the poll will be active after creation
     */
    global Integer openPeriod { get { return payload.getInteger('open_period'); } }

    /**
     * @description The point in time when the poll will be automatically closed
     */
    global DateTime closeDate { get { return payload.getDateTime('close_date'); } }

    public TelegramPoll(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Describes the information about one answer option in a poll.
     * Source: https://core.telegram.org/bots/api#polloption
     */
    global class Option extends BotPayload {
        /**
         * @description The option text, `1-100` characters
         */
        global String text { get { return payload.getString('text'); } }

        /**
         * @description The number of users that voted for this option
         */
        global Integer voterCount { get { return payload.getInteger('voter_count'); } }

        public Option(BotJsonPayload payload) {
            super(payload);
        }
    }
}
