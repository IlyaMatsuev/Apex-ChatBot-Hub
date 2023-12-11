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
        List<IBotContext> contexts = createBotContexts((List<BotUpdateEvent__e>) context.props.newList);

        saveChatDetails(contexts);

        System.enqueueJob(new UpdateEventExecutor(contexts));
    }

    private List<IBotContext> createBotContexts(List<BotUpdateEvent__e> events) {
        // The loop is needed when a user sends several messages at the same time
        List<IBotContext> contexts = new List<IBotContext>();
        for (BotUpdateEvent__e event : events) {
            BotModel bot = BotModel.fromJson(event.Bot__c);
            contexts.add(serviceFactory.createBotContext(bot, event.Payload__c));
        }
        return contexts;
    }

    private void saveChatDetails(List<IBotContext> contexts) {
        List<Chat__c> chats = new List<Chat__c>();
        List<ChatUser__c> chatUsers = new List<ChatUser__c>();
        List<ChatMessage__c> chatMessages = new List<ChatMessage__c>();
        for (IBotContext context : contexts) {
            IBotUpdateEvent updateEvent = context.getUpdateEvent();
            Chat__c chat = getChat(context.getBot(), updateEvent.getChat());
            ChatUser__c user = getChatUser(updateEvent.getChat()?.getSender());
            ChatMessage__c message;

            if (chat != null && user != null) {
                message = getChatMessage(chat.ExternalId__c, user.ExternalId__c, updateEvent.getMessage());
            }

            if (chat != null && !chats.contains(chat)) {
                chats.add(chat);
            }
            if (user != null && !chatUsers.contains(user)) {
                chatUsers.add(user);
            }
            if (message != null && !chatMessages.contains(message)) {
                chatMessages.add(message);
            }
        }

        Database.upsert(chats, Chat__c.ExternalId__c);
        Database.upsert(chatUsers, ChatUser__c.ExternalId__c);
        Database.upsert(chatMessages, ChatMessage__c.ExternalId__c);
    }

    private Chat__c getChat(BotModel bot, IBotChat chat) {
        if (chat == null) {
            return null;
        }

        return new Chat__c(
            Name = chat.getTitle(),
            Bot__c = bot.id,
            ExternalId__c = BotUtils.generateExternalId(chat.getId(), bot.tokenHash)
        );
    }

    private ChatUser__c getChatUser(IBotUser user) {
        if (user == null) {
            return null;
        }

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
        if (message == null) {
            return null;
        }

        return new ChatMessage__c(
            Chat__r = new Chat__c(ExternalId__c = chatId),
            User__r = new ChatUser__c(ExternalId__c = userId),
            Text__c = message.getText(),
            Type__c = message.getType().name(),
            MediaUrl__c = message.getMediaUrl(),
            SendDate__c = message.getSendDate(),
            Parameters__c = message.getParameters().toJson(true),
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
        private final List<IBotContext> contexts;

        public UpdateEventExecutor(List<IBotContext> contexts) {
            this.contexts = contexts;
        }

        public void execute(QueueableContext ctx) {
            for (IBotContext context : contexts) {
                handleUpdateEvent(context);
            }
        }

        private void handleUpdateEvent(IBotContext context) {
            BotModel bot;
            try {
                bot = context.getBot();
                bot.handler.handle(context);
            } catch (Exception error) {
                BotErrorLogger.log(bot?.id, error);
            }
        }
    }
}
