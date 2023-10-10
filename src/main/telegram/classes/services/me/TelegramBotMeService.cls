/**
 * @description Service class that provides access to all `Telegram` `me` and `my` methods
 */
global class TelegramBotMeService {
    private final BotCalloutService calloutService;

    public TelegramBotMeService(BotCalloutService calloutService) {
        this.calloutService = calloutService;
    }

    /**
     * @description Returns the basic information about the bot
     * @return The instance of the <<TelegramUser>> class
     */
    global TelegramUser get() {
        return new TelegramUser(send(TelegramBotMethod.GetMe, new BotJsonPayload()).getJsonPayload('result'));
    }

    /**
     * @description Returns the bot's name
     * @return The bot's name
     */
    global String getName() {
        return getName(null);
    }

    /**
     * @description Returns the bot's name
     * @param languageCode The two-letter language code
     * @return The bot's name
     */
    global String getName(String languageCode) {
        BotJsonPayload payload = new BotJsonPayload().set('language_code', languageCode, true);
        BotJsonPayload result = send(TelegramBotMethod.GetMyName, payload).getJsonPayload('result');
        return result.getString('name');
    }

    /**
     * @description Returns the bot's description
     * @return The bot's description
     */
    global String getDescription() {
        return getDescription(null);
    }

    /**
     * @description Returns the bot's description
     * @param languageCode The two-letter language code
     * @return The bot's description
     */
    global String getDescription(String languageCode) {
        BotJsonPayload payload = new BotJsonPayload().set('language_code', languageCode, true);
        BotJsonPayload result = send(TelegramBotMethod.GetMyDescription, payload).getJsonPayload('result');
        return result.getString('description');
    }

    /**
     * @description Returns the bot's short description
     * @return The bot's short description
     */
    global String getShortDescription() {
        return getShortDescription(null);
    }

    /**
     * @description Returns the bot's short description
     * @param languageCode The two-letter language code
     * @return The bot's short description
     */
    global String getShortDescription(String languageCode) {
        BotJsonPayload payload = new BotJsonPayload().set('language_code', languageCode, true);
        BotJsonPayload result = send(TelegramBotMethod.GetMyShortDescription, payload).getJsonPayload('result');
        return result.getString('short_description');
    }

    /**
     * @description Returns the bot's default administrator rights
     * @return The instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights getDefaultAdminRights() {
        return getDefaultAdminRights(null);
    }

    /**
     * @description Returns the bot's default administrator rights
     * @param forChannels `True` to get default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be returned
     * @return The instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights getDefaultAdminRights(Boolean forChannels) {
        BotJsonPayload payload = new BotJsonPayload().set('for_channels', forChannels, true);
        BotJsonPayload result = send(TelegramBotMethod.GetMyDefaultAdministratorRights, payload)
            .getJsonPayload('result');

        return new TelegramChatAdministratorRights(result);
    }

    /**
     * @description Sets the new bot's name
     * @param name The new bot's name
     */
    global void setName(String name) {
        setName(name, null);
    }

    /**
     * @description Sets the new bot's name for a specific language
     * @param name The new bot's name
     * @param languageCode The two-letter language code
     */
    global void setName(String name, String languageCode) {
        BotJsonPayload payload = new BotJsonPayload().set('name', name).set('language_code', languageCode, true);
        send(TelegramBotMethod.SetMyName, payload);
    }

    /**
     * @description Sets the new bot's description
     * @param description The new bot's description
     */
    global void setDescription(String description) {
        setDescription(description, null);
    }

    /**
     * @description Sets the new bot's description for a specific language
     * @param description The new bot's description
     * @param languageCode The two-letter language code
     */
    global void setDescription(String description, String languageCode) {
        BotJsonPayload payload = new BotJsonPayload()
            .set('description', description)
            .set('language_code', languageCode, true);

        send(TelegramBotMethod.SetMyDescription, payload);
    }

    /**
     * @description Sets the new bot's short description
     * @param description The new bot's short description
     */
    global void setShortDescription(String description) {
        setShortDescription(description, null);
    }

    /**
     * @description Sets the new bot's short description for a specific language
     * @param description The new bot's short description
     * @param languageCode The two-letter language code
     */
    global void setShortDescription(String description, String languageCode) {
        BotJsonPayload payload = new BotJsonPayload()
            .set('short_description', description)
            .set('language_code', languageCode, true);

        send(TelegramBotMethod.SetMyShortDescription, payload);
    }

    /**
     * @description Sets the bot's default administrator rights
     * @param rights The instance of the <<TelegramChatAdministratorRights>> class, describing the bot's default chat admin rights
     */
    global void setDefaultAdminRights(TelegramChatAdministratorRights rights) {
        setDefaultAdminRights(rights, null);
    }

    /**
     * @description Sets the bot's default administrator rights
     * @param rights The instance of the <<TelegramChatAdministratorRights>> class, describing the bot's default chat admin rights
     * @param forChannels `True` to set default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be set
     */
    global void setDefaultAdminRights(TelegramChatAdministratorRights rights, Boolean forChannels) {
        BotJsonPayload payload = new BotJsonPayload().set('rights', rights).set('for_channels', forChannels, true);

        send(TelegramBotMethod.SetMyDefaultAdministratorRights, payload);
    }

    private BotJsonPayload send(TelegramBotMethod method, BotJsonPayload payload) {
        return calloutService.call(method, payload);
    }
}
