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

            IBotContext context = serviceFactory.createBotContext(bot, event.Payload__c);
            BotUpdateEventType updateEventType = context.getReceivedUpdate().getType();

            if (shouldHandleEvent(BotSettingsProvider.get(bot.type), updateEventType)) {
                botContexts.add((BotContext) context);
            }
        }
        return botContexts;
    }

    private void collectChatDetails(List<BotContext> botContexts) {
        List<SObject> chatsDetails = new List<SObject>();
        for (BotContext context : botContexts) {
            for (SObject chatDetailEntry : getChatDetails(context.bot, context)) {
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

    private Boolean shouldHandleEvent(BotSetting__mdt settings, BotUpdateEventType updateEventType) {
        List<String> ignoreEventTypes = settings.EventTypesToIgnore__c?.split(';');
        return ignoreEventTypes == null || !ignoreEventTypes.contains(updateEventType.name());
    }

    private List<SObject> getChatDetails(BotModel bot, IBotContext context) {
        Chat__c chat = getChat(bot, context.getReceivedUpdate().getChat());
        ChatUser__c user = getChatUser(context.getReceivedUpdate().getChat().getSender());
        ChatMessage__c message = getChatMessage(
            chat.ExternalId__c,
            user.ExternalId__c,
            context.getReceivedUpdate().getMessage()
        );
        return new List<SObject> { chat, user, message };
    }

    private Chat__c getChat(BotModel bot, IBotChatEntity chat) {
        return new Chat__c(
            Name = chat.getTitle(),
            Bot__c = bot.id,
            ExternalId__c = BotUtils.generateExternalId(chat.getId(), bot.tokenHash)
        );
    }

    private ChatUser__c getChatUser(IBotUserEntity user) {
        String userName = user.getUsername();
        if (String.isNotBlank(user.getFirstName()) || String.isNotBlank(user.getLastName())) {
            userName = getValueOrEmptyString(user.getFirstName()) + ' ' + getValueOrEmptyString(user.getLastName());
        }
        return new ChatUser__c(
            Name = userName.trim(),
            FirstName__c = user.getFirstName(),
            LastName__c = user.getLastName(),
            Username__c = user.getUsername(),
            ExternalId__c = user.getId()
        );
    }

    private ChatMessage__c getChatMessage(String chatId, String userId, IBotMessageEntity message) {
        return new ChatMessage__c(
            Chat__r = new Chat__c(ExternalId__c = chatId),
            User__r = new ChatUser__c(ExternalId__c = userId),
            Text__c = message.getText(),
            SendDate__c = message.getSendDate(),
            ExternalId__c = BotUtils.generateExternalId(message.getId(), chatId)
        );
    }

    private String getValueOrEmptyString(String value) {
        return String.isBlank(value) ? '' : value;
    }
}
