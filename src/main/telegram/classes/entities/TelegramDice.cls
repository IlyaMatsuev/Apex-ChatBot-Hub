/**
 * @description Describes the dice payload that can be received as part of an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#dice
 */
global class TelegramDice extends BotPayload {
    /**
     * @description The emoji on which the dice throw animation is based
     */
    global String emoji { get { return payload.getString('emoji'); } }

    /**
     * @description The value of the dice
     * `🎲`, `🎯` and `🎳` - generate values in range: `1..6`
     * `🏀` and `⚽` - generate values in range `1..5`
     * `🎰` - generate values in range `1..64`
     */
    global Integer value { get { return payload.getInteger('value'); } }

    public TelegramDice(BotJsonPayload payload) {
        super(payload);
    }
}
