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
        List<UpdateEventWrapper> updateEvents = createUpdateEventWrappers(
            (List<BotUpdateEvent__e>) context.props.newList
        );

        collectChatDetails(updateEvents);

        for (UpdateEventWrapper updateEvent : updateEvents) {
            handleUpdateEvent(updateEvent);
        }
    }

    private List<UpdateEventWrapper> createUpdateEventWrappers(List<BotUpdateEvent__e> events) {
        // The loop is needed when a user sends several messages at the same time
        List<UpdateEventWrapper> updateEvents = new List<UpdateEventWrapper>();
        for (BotUpdateEvent__e event : events) {
            BotModel bot = BotModel.fromJson(event.Bot__c);

            IBotUpdateEvent updateEvent = (IBotUpdateEvent) ValueMap.fromJson(
                event.Payload__c,
                BotSettingsProvider.getClassType(bot.type, BotSetting__mdt.BotUpdateEvent__c)
            );

            if (shouldHandleEvent(BotSettingsProvider.get(bot.type), updateEvent.getType())) {
                IBotContext context = serviceFactory.createBotContext(bot, event.Payload__c);
                updateEvents.add(new UpdateEventWrapper(context, updateEvent));
            }
        }
        return updateEvents;
    }

    private void collectChatDetails(List<UpdateEventWrapper> updateEvents) {
        List<SObject> chatsDetails = new List<SObject>();
        for (UpdateEventWrapper updateEvent : updateEvents) {
            for (SObject chatDetailEntry : getChatDetails(updateEvent.context)) {
                if (!chatsDetails.contains(chatDetailEntry)) {
                    chatsDetails.add(chatDetailEntry);
                }
            }
        }
        // TODO: Can I save these records syncroniusly?
        BotUtils.saveAsync(chatsDetails, 'ExternalId__c');
    }

    private void handleUpdateEvent(UpdateEventWrapper updateEvent) {
        BotModel bot;
        try {
            bot = updateEvent.context.getBot();
            bot.handler.handle(updateEvent.context, updateEvent.updateEvent);
        } catch (Exception error) {
            BotErrorLogger.log(bot?.id, error);
        }
    }

    private Boolean shouldHandleEvent(BotSetting__mdt settings, BotUpdateEventType updateEventType) {
        List<String> ignoreEventTypes = settings.EventTypesToIgnore__c?.split(';');
        return ignoreEventTypes == null || !ignoreEventTypes.contains(updateEventType.name());
    }

    private List<SObject> getChatDetails(IBotContext context) {
        Chat__c chat = getChat(context.getBot(), context.getReceivedUpdate().getChat());
        ChatUser__c user = getChatUser(context.getReceivedUpdate().getChat().getSender());
        ChatMessage__c message = getChatMessage(
            chat.ExternalId__c,
            user.ExternalId__c,
            context.getReceivedUpdate().getMessage()
        );
        return new List<SObject> { chat, user, message };
    }

    private Chat__c getChat(BotModel bot, IBotChat chat) {
        return new Chat__c(
            Name = chat.getTitle(),
            Bot__c = bot.id,
            ExternalId__c = BotUtils.generateExternalId(chat.getId(), bot.tokenHash)
        );
    }

    private ChatUser__c getChatUser(IBotUser user) {
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

    private ChatMessage__c getChatMessage(String chatId, String userId, IBotMessage message) {
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

    private class UpdateEventWrapper {
        public final IBotContext context;
        public final IBotUpdateEvent updateEvent;

        private UpdateEventWrapper(IBotContext context, IBotUpdateEvent updateEvent) {
            this.context = context;
            this.updateEvent = updateEvent;
        }
    }
}
