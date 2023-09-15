/**
 * @description Describes the web app info payload received as an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#webappinfo
 */
global class TelegramWebAppInfo extends BotPayload {
    /**
     * @description An HTTPS URL of a Web App to be opened with additional data
     */
    global String url { get { return payload.getString('url'); } }

    public TelegramWebAppInfo(BotJsonPayload payload) {
        super(payload);
    }
}
