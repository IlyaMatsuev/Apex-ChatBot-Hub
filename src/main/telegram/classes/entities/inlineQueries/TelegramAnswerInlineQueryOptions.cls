/**
 * @description Represents the optional parameters for inline mode `answer` method.
 * Source: https://core.telegram.org/bots/api#inlinequeryresult
 */
global class TelegramAnswerInlineQueryOptions extends BotPayload {
    /**
     * @description The list of results to be shown to the user for the inline query
     */
    global List<TelegramInlineQueryResult> results {
        get { return (List<TelegramInlineQueryResult>) payload.get('results'); }
        private set { payload.set('results', value); }
    }

    /**
     * @description Creates an instance of the answer inline query options without any results, so that they can be added separately
     */
    global TelegramAnswerInlineQueryOptions() {
        this(new List<TelegramInlineQueryResult>());
    }

    /**
     * @description Creates an instance of the answer inline query options with the provided results
     * @param results The list of results to be shown to the user
     */
    global TelegramAnswerInlineQueryOptions(TelegramInlineQueryResult[] results) {
        this.results = results;
    }

    /**
     * @description Adds a result to the inline query answer
     * @param result The inline query result entry, instance of the <<TelegramInlineQueryResult>> class
     * @return The current instance of the <<TelegramAnswerInlineQueryOptions>> class
     */
    global TelegramAnswerInlineQueryOptions addResult(TelegramInlineQueryResult result) {
        return addResults(new List<TelegramInlineQueryResult> { result });
    }

    /**
     * @description Adds multiple results to the inline query answer
     * @param results The list of inline query results, instances of the <<TelegramInlineQueryResult>> class
     * @return The current instance of the <<TelegramAnswerInlineQueryOptions>> class
     */
    global TelegramAnswerInlineQueryOptions addResults(TelegramInlineQueryResult[] results) {
        this.results.addAll(results);
        return this;
    }

    /**
     * @description Sets the maximum amount of time in seconds that the result of the inline query may be cached on the server. Defaults to `300`
     * @param seconds The maximum amount of time in seconds that the result of the inline query may be cached on the server
     * @return The current instance of the <<TelegramAnswerInlineQueryOptions>> class
     */
    global TelegramAnswerInlineQueryOptions withCacheTime(Integer seconds) {
        payload.set('cache_time', seconds);
        return this;
    }

    /**
     * @description Sets if results may be cached on the server side only for the user that sent the query. By default, results may be returned to any user who sends the same query
     * @return The current instance of the <<TelegramAnswerInlineQueryOptions>> class
     */
    global TelegramAnswerInlineQueryOptions asPersonal() {
        payload.set('is_personal', true);
        return this;
    }

    /**
     * @description Sets the offset that a client should send in the next query with the same text to receive more results. Pass an empty string if there are no more results or if you don't support pagination
     * @param offset the offset that a client should send in the next query with the same text to receive more results. Offset length can't exceed `64 bytes`
     * @return The current instance of the <<TelegramAnswerInlineQueryOptions>> class
     */
    global TelegramAnswerInlineQueryOptions withNextOffset(String offset) {
        payload.set('next_offset', offset);
        return this;
    }

    /**
     * @description Sets the button to be shown above inline query results
     * @param button The button to be shown above inline query results. The instance of the <<TelegramAnswerInlineQueryOptions.Button>> class
     * @return The current instance of the <<TelegramAnswerInlineQueryOptions>> class
     */
    global TelegramAnswerInlineQueryOptions withButton(TelegramAnswerInlineQueryOptions.Button button) {
        payload.set('button', button);
        return this;
    }

    /**
     * @description The builder-like class representing a button in the `Telegram` inline mode results.
     * Source: https://core.telegram.org/bots/api#inlinequeryresultsbutton
     */
    global class Button extends BotPayload {
        /**
         * @description Creates a new instance of the inline mode results button with the provided label
         * @param text The button label text
         */
        global Button(String text) {
            payload.set('text', text);
        }

        /**
         * @description
         * @param parameter wqd
         * @return The current instance of the <<TelegramAnswerInlineQueryOptions.Button>> class
         */
        global Button withStartParameter(String parameter) {
            payload.set('start_parameter', parameter);
            return this;
        }
    }
}
