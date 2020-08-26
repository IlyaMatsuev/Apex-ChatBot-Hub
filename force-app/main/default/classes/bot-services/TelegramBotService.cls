/**
 * Created by Ilya Matsuev on 8/25/2020.
 */

global with sharing class TelegramBotService {

    private static final Map<String, String> TELEGRAM_BOT_REQUEST_HEADERS = new Map<String, String>{
            CalloutHelper.CONTENT_TYPE_HEADER => CalloutHelper.JSON_CONTENT_TYPE
    };

    public TelegramUpdateWrapper updateWrapper { get; private set; }
    public Bot_Registration__c registration { get; private set; }
    public Bot_Setting__mdt botSettings {
        get {
            if (botSettings == null) {
                botSettings = BotSettingsService.getBotSettings(TelegramBotService.class.getName().substringBefore('BotService'));
            }
            return botSettings;
        }
        private set;
    }
    public Integer currentChatId {
        get {
            return updateWrapper == null ? 0 : updateWrapper.message.chat.id;
        }
    }

    global TelegramBotService(Bot_Registration__c registration) {
        this.registration = registration;
    }

    public TelegramBotService(TelegramUpdateWrapper updateWrapper, Bot_Registration__c registration) {
        this.updateWrapper = updateWrapper;
        this.registration = registration;
    }


    global Callout getMe() {
        return new Callout(getEndpoint('getMe'), CalloutHelper.METHOD_GET);
    }

    global Callout sendMessage(String text) {
        return sendMessage(new Map<String, Object>{
                'chat_id' => currentChatId, 'text' => text
        });
    }

    global Callout sendMessage(String text, TelegramMessageParseMode parseMode) {
        return sendMessage(new Map<String, Object>{
                'chat_id' => currentChatId, 'text' => text, 'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name()
        });
    }

    global Callout sendMessage(String text, TelegramMessageParseMode parseMode, Boolean disablePreview) {
        return sendMessage(new Map<String, Object>{
                'chat_id' => currentChatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview
        });
    }

    global Callout sendMessage(String text, TelegramMessageParseMode parseMode, Boolean disablePreview, Boolean silentNotification) {
        return sendMessage(new Map<String, Object>{
                'chat_id' => currentChatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview,
                'disable_notification' => silentNotification
        });
    }

    global Callout sendMessage(String text, TelegramMessageParseMode parseMode, Boolean disablePreview, Boolean silentNotification, String replyMessageId) {
        return sendMessage(new Map<String, Object>{
                'chat_id' => currentChatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview,
                'disable_notification' => silentNotification,
                'reply_to_message_id' => replyMessageId
        });
    }

    global Callout sendMessage(Integer chatId, String text) {
        return sendMessage(new Map<String, Object>{
                'chat_id' => chatId, 'text' => text
        });
    }

    global Callout sendMessage(Integer chatId, String text, TelegramMessageParseMode parseMode) {
        return sendMessage(new Map<String, Object>{
                'chat_id' => chatId, 'text' => text, 'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name()
        });
    }

    global Callout sendMessage(Integer chatId, String text, TelegramMessageParseMode parseMode, Boolean disablePreview) {
        return sendMessage(new Map<String, Object>{
                'chat_id' => chatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview
        });
    }

    global Callout sendMessage(Integer chatId, String text, TelegramMessageParseMode parseMode, Boolean disablePreview, Boolean silentNotification) {
        return sendMessage(new Map<String, Object>{
                'chat_id' => chatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview,
                'disable_notification' => silentNotification
        });
    }

    global Callout sendMessage(Integer chatId, String text, TelegramMessageParseMode parseMode, Boolean disablePreview, Boolean silentNotification, String replyMessageId) {
        return sendMessage(new Map<String, Object>{
                'chat_id' => chatId,
                'text' => text,
                'parse_mode' => parseMode == TelegramMessageParseMode.TEXT ? '' : parseMode.name(),
                'disable_web_page_preview' => disablePreview,
                'disable_notification' => silentNotification,
                'reply_to_message_id' => replyMessageId
        });
    }

    private Callout sendMessage(Map<String, Object> params) {
        return new Callout(
                getEndpoint('sendMessage'),
                CalloutHelper.METHOD_POST,
                TELEGRAM_BOT_REQUEST_HEADERS,
                JSON.serialize(params)
        );
    }


    private String getEndpoint(String method) {
        return this.botSettings.API_Url__c + registration.Token__c + CalloutHelper.SLASH + method;
    }

    private String getEndpoint(String method, Map<String, String> params) {
        return this.botSettings.API_Url__c + registration.Token__c + CalloutHelper.SLASH + method + CalloutHelper.buildUrlParams(params);
    }
}
