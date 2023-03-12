public class BotUpdateHandler implements Triggers.IHandler {
    private final BotServiceFactory serviceFactory;

    public BotUpdateHandler() {
        this(new BotServiceFactory());
    }

    @TestVisible
    private BotUpdateHandler(BotServiceFactory serviceFactory) {
        this.serviceFactory = serviceFactory;
    }

    public void handle(Triggers.Context context) {
        List<BotContext> botContexts = createBotContexts((List<BotUpdateEvent__e>) context.props.newList);

        collectChatDetails(botContexts);

        for (BotContext botContext : botContexts) {
            handleUpdateEvent(botContext);
        }
    }

    private List<BotContext> createBotContexts(List<BotUpdateEvent__e> events) {
        // The loop is needed when a user sends several messages at the same time
        List<BotContext> botContexts = new List<BotContext>();
        for (BotUpdateEvent__e event : events) {
            BotModel bot = BotModel.fromJson(event.Bot__c);
            BotSetting__mdt settings = BotSettingsProvider.get(bot.type);

            IBotUpdateEventEntity updateEventEntity = (IBotUpdateEventEntity) ValueMap.fromJson(
                event.Payload__c,
                Type.forName(settings.BotUpdateEventEntity__c)
            );

            if (shouldHandleEvent(settings, updateEventEntity)) {
                botContexts.add(new BotContext(bot, new BotUpdateModel(updateEventEntity), serviceFactory));
            }
        }
        return botContexts;
    }

    private void collectChatDetails(List<BotContext> botContexts) {
        List<SObject> chatsDetails = new List<SObject>();
        for (BotContext context : botContexts) {
            for (SObject chatDetailEntry : getChatDetails(context)) {
                if (!chatsDetails.contains(chatDetailEntry)) {
                    chatsDetails.add(chatDetailEntry);
                }
            }
        }
        BotUtils.saveAsync(chatsDetails, 'ExternalId__c');
    }

    private void handleUpdateEvent(BotContext context) {
        try {
            context.bot.handler.handle(context);
        } catch (Exception error) {
            BotErrorLogger.log(context.bot.id, error);
        }
    }

    private Boolean shouldHandleEvent(BotSetting__mdt settings, IBotUpdateEventEntity updateEventEntity) {
        List<String> ignoreEventTypes = settings.EventTypesToIgnore__c?.split(';');
        return ignoreEventTypes == null || !ignoreEventTypes.contains(updateEventEntity.getType().name());
    }

    private List<SObject> getChatDetails(BotContext context) {
        Chat__c chat = getChat(context.bot, context.received.chat);
        ChatUser__c user = getChatUser(context.received.chat.sender);
        ChatMessage__c message = getChatMessage(chat.ExternalId__c, user.ExternalId__c, context.received.message);
        return new List<SObject> { chat, user, message };
    }

    private Chat__c getChat(BotModel bot, BotUpdateModel.ChatModel chat) {
        return new Chat__c(
            Name = chat.title,
            Bot__c = bot.id,
            ExternalId__c = BotUtils.generateExternalId(chat.id, bot.tokenHash)
        );
    }

    private ChatUser__c getChatUser(BotUpdateModel.UserModel user) {
        String userName = user.username;
        if (String.isNotBlank(user.firstName) || String.isNotBlank(user.lastName)) {
            userName = getValueOrEmptyString(user.firstName) + ' ' + getValueOrEmptyString(user.lastName);
        }
        return new ChatUser__c(
            Name = userName.trim(),
            FirstName__c = user.firstName,
            LastName__c = user.lastName,
            Username__c = user.username,
            ExternalId__c = user.id
        );
    }

    private ChatMessage__c getChatMessage(String chatId, String userId, BotUpdateModel.MessageModel message) {
        return new ChatMessage__c(
            Chat__r = new Chat__c(ExternalId__c = chatId),
            User__r = new ChatUser__c(ExternalId__c = userId),
            Text__c = message.text,
            SendDate__c = message.sentAt,
            ExternalId__c = BotUtils.generateExternalId(message.id, chatId)
        );
    }

    private String getValueOrEmptyString(String value) {
        return String.isBlank(value) ? '' : value;
    }
}
