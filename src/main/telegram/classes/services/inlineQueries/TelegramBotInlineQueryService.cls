/**
 * @description Service class that provides access to all `Telegram` `inline` mode methods
 */
global class TelegramBotInlineQueryService {
    private final String inlineQueryId;
    private final BotCalloutService calloutService;

    public TelegramBotInlineQueryService(String inlineQueryId, BotCalloutService calloutService) {
        this.inlineQueryId = inlineQueryId;
        this.calloutService = calloutService;
    }

    /**
     * @description Sends answers to the inline query
     * @param results The results to be shown to the user
     */
    global void answer(TelegramInlineQueryResult[] results) {
        answer(new TelegramAnswerInlineQueryOptions(results));
    }

    /**
     * @description Sends answers to the inline query
     * @param options Results and other options
     */
    global void answer(TelegramAnswerInlineQueryOptions options) {
        BotJsonPayload request = new BotJsonPayload(options).set('inline_query_id', inlineQueryId);
        calloutService.call(TelegramBotMethod.AnswerInlineQuery, request);
    }
}
