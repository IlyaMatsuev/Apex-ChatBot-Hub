global class TelegramBotService extends BotService {
    private static final Map<String, String> TELEGRAM_BOT_REQUEST_HEADERS = new Map<String, String>{
        CalloutHelper.CONTENT_TYPE_HEADER => CalloutHelper.JSON_CONTENT_TYPE
    };

    public TelegramUpdateWrapper updateWrapper { get; private set; }
    public Integer currentChatId {
        get {
            return updateWrapper == null ? 0 : updateWrapper.message.chat.id;
        }
    }

    global TelegramBotService(Bot__c registration) {
        super(registration);
    }

    public TelegramBotService(TelegramUpdateWrapper updateWrapper, Bot__c registration) {
        super(registration);
        this.updateWrapper = updateWrapper;
    }

    global Callout getMe() {
        return new Callout(getEndpoint('getMe'), CalloutHelper.METHOD_GET);
    }

    global Callout getWebHookInfo() {
        return new Callout(getEndpoint('getWebhookInfo'), CalloutHelper.METHOD_GET);
    }

    global Callout setWebHook(String url) {
        return new Callout(
            getEndpoint('setWebhook'),
            CalloutHelper.METHOD_POST,
            TELEGRAM_BOT_REQUEST_HEADERS,
            JSON.serialize(new Map<String, String>{ 'url' => url })
        );
    }

    global Callout deleteWebHook() {
        return new Callout(getEndpoint('deleteWebhook'), CalloutHelper.METHOD_POST);
    }

    global Callout sendMessage(String text) {
        return sendMessage(new Map<String, Object>{ 'chat_id' => currentChatId, 'text' => text });
    }

    global Callout sendMessage(String text, TelegramMessageParseMode parseMode) {
        return sendMessage(
            new Map<String, Object>{
                'chat_id' => currentChatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name()
            }
        );
    }

    global Callout sendMessage(String text, TelegramMessageParseMode parseMode, Boolean disablePreview) {
        return sendMessage(
            new Map<String, Object>{
                'chat_id' => currentChatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview
            }
        );
    }

    global Callout sendMessage(
        String text,
        TelegramMessageParseMode parseMode,
        Boolean disablePreview,
        Boolean silentNotification
    ) {
        return sendMessage(
            new Map<String, Object>{
                'chat_id' => currentChatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview,
                'disable_notification' => silentNotification
            }
        );
    }

    global Callout sendMessage(
        String text,
        TelegramMessageParseMode parseMode,
        Boolean disablePreview,
        Boolean silentNotification,
        String replyMessageId
    ) {
        return sendMessage(
            new Map<String, Object>{
                'chat_id' => currentChatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview,
                'disable_notification' => silentNotification,
                'reply_to_message_id' => replyMessageId
            }
        );
    }

    global Callout sendMessage(Integer chatId, String text) {
        return sendMessage(new Map<String, Object>{ 'chat_id' => chatId, 'text' => text });
    }

    global Callout sendMessage(Integer chatId, String text, TelegramMessageParseMode parseMode) {
        return sendMessage(
            new Map<String, Object>{
                'chat_id' => chatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name()
            }
        );
    }

    global Callout sendMessage(
        Integer chatId,
        String text,
        TelegramMessageParseMode parseMode,
        Boolean disablePreview
    ) {
        return sendMessage(
            new Map<String, Object>{
                'chat_id' => chatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview
            }
        );
    }

    global Callout sendMessage(
        Integer chatId,
        String text,
        TelegramMessageParseMode parseMode,
        Boolean disablePreview,
        Boolean silentNotification
    ) {
        return sendMessage(
            new Map<String, Object>{
                'chat_id' => chatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview,
                'disable_notification' => silentNotification
            }
        );
    }

    global Callout sendMessage(
        Integer chatId,
        String text,
        TelegramMessageParseMode parseMode,
        Boolean disablePreview,
        Boolean silentNotification,
        String replyMessageId
    ) {
        return sendMessage(
            new Map<String, Object>{
                'chat_id' => chatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview,
                'disable_notification' => silentNotification,
                'reply_to_message_id' => replyMessageId
            }
        );
    }

    protected override String getEndpoint(String method) {
        return this.botSettings.ApiUrl__c + registration.Token__c + CalloutHelper.SLASH + method;
    }

    private Callout sendMessage(Map<String, Object> params) {
        return new Callout(
            getEndpoint('sendMessage'),
            CalloutHelper.METHOD_POST,
            TELEGRAM_BOT_REQUEST_HEADERS,
            JSON.serialize(params)
        );
    }
}
