public class BotUpdateEventHandler implements Triggers.IHandler {
    private final BotServiceFactory serviceFactory;

    public BotUpdateEventHandler() {
        this(new BotServiceFactory());
    }

    @TestVisible
    private BotUpdateEventHandler(BotServiceFactory serviceFactory) {
        this.serviceFactory = serviceFactory;
    }

    public void handle(Triggers.Context context) {
        List<UpdateEventWrapper> updateEvents = createUpdateEventWrappers(
            (List<BotUpdateEvent__e>) context.props.newList
        );

        saveChatDetails(updateEvents);

        System.enqueueJob(new UpdateEventExecutor(updateEvents));
    }

    // TODO: Make this handler able to handle not only message events
    private List<UpdateEventWrapper> createUpdateEventWrappers(List<BotUpdateEvent__e> events) {
        // The loop is needed when a user sends several messages at the same time
        List<UpdateEventWrapper> updateEvents = new List<UpdateEventWrapper>();
        for (BotUpdateEvent__e event : events) {
            BotModel bot = BotModel.fromJson(event.Bot__c);

            IBotUpdateEvent updateEvent = serviceFactory.createBotUpdateEvent(bot, event.Payload__c);

            if (shouldHandleEvent(BotSettingsProvider.get(bot.type), updateEvent.getType())) {
                IBotContext context = serviceFactory.createBotContext(bot, event.Payload__c);
                updateEvents.add(new UpdateEventWrapper(context, updateEvent));
            }
        }
        return updateEvents;
    }

    private void saveChatDetails(List<UpdateEventWrapper> updateEvents) {
        List<Chat__c> chats = new List<Chat__c>();
        List<ChatUser__c> chatUsers = new List<ChatUser__c>();
        List<ChatMessage__c> chatMessages = new List<ChatMessage__c>();
        for (UpdateEventWrapper updateEvent : updateEvents) {
            Chat__c chat = getChat(updateEvent.context.getBot(), updateEvent.updateEvent.getChat());
            ChatUser__c user = getChatUser(updateEvent.updateEvent.getChat().getSender());
            ChatMessage__c message = getChatMessage(
                chat.ExternalId__c,
                user.ExternalId__c,
                updateEvent.updateEvent.getMessage()
            );
            if (!chats.contains(chat)) {
                chats.add(chat);
            }
            if (!chatUsers.contains(user)) {
                chatUsers.add(user);
            }
            if (!chatMessages.contains(message)) {
                chatMessages.add(message);
            }
        }

        Database.upsert(chats, Chat__c.ExternalId__c);
        Database.upsert(chatUsers, ChatUser__c.ExternalId__c);
        Database.upsert(chatMessages, ChatMessage__c.ExternalId__c);
    }

    private Boolean shouldHandleEvent(BotSetting__mdt settings, BotUpdateEventType updateEventType) {
        List<String> ignoreEventTypes = settings.EventTypesToIgnore__c?.split(';');
        return ignoreEventTypes == null || !ignoreEventTypes.contains(updateEventType.name());
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

    private class UpdateEventExecutor implements Queueable, Database.AllowsCallouts {
        private final List<UpdateEventWrapper> updateEvents;

        public UpdateEventExecutor(List<UpdateEventWrapper> updateEvents) {
            this.updateEvents = updateEvents;
        }

        public void execute(QueueableContext ctx) {
            for (UpdateEventWrapper updateEvent : updateEvents) {
                handleUpdateEvent(updateEvent);
            }
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
    }
}
