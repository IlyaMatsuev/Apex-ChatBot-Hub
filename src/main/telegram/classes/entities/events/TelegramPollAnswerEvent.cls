/**
 * @description Describes the common payload properties for the `Telegram` bot poll answer events
 * Source: https://core.telegram.org/bots/api#pollanswer
 */
global class TelegramPollAnswerEvent extends BotPayload {
    /**
     * @description The unique poll identifier
     */
    global String pollId { get { return payload.getString('poll_id'); } }

    /**
     * @description The chat that changed the answer to the poll, if the voter is anonymous
     */
    global TelegramChat voterChat { get { return new TelegramChat(payload.getJsonPayload('voter_chat')); } }

    /**
     * @description The user that changed the answer to the poll, if the voter isn't anonymous
     */
    global TelegramUser user { get { return new TelegramUser(payload.getJsonPayload('user')); } }

    /**
     * @description The 0-based identifiers of chosen answer options. May be empty if the vote was retracted
     */
    global List<Integer> optionIds { get { return payload.getIntegerList('option_ids'); } }

    public TelegramPollAnswerEvent(BotJsonPayload payload) {
        super(payload);
    }
}
