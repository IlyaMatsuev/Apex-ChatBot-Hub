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
        // The loop is needed when a user sends several messages at the same time
        List<SObject> chatsDetails = new List<SObject>();
        List<BotContext> botContexts = new List<BotContext>();
        for (BotUpdateEvent__e event : (List<BotUpdateEvent__e>) context.props.newList) {
            BotContext botContext = createBotContext(event);
            for (SObject chatDetailEntry : getChatDetails(botContext)) {
                if (!chatsDetails.contains(chatDetailEntry)) {
                    chatsDetails.add(chatDetailEntry);
                }
            }
            botContexts.add(botContext);
        }

        BotUtils.saveAsync(chatsDetails, 'ExternalId__c');

        for (BotContext botContext : botContexts) {
            handleUpdateEvent(botContext);
        }
    }

    private BotContext createBotContext(BotUpdateEvent__e updateEvent) {
        Bot__c bot = (Bot__c) JSON.deserialize(updateEvent.Bot__c, Bot__c.class);
        BotUpdateModel updateModel = BotUpdateModel.fromPayload(updateEvent.Payload__c, BotType.valueOf(bot.Type__c));
        return new BotContext(bot, updateModel, serviceFactory);
    }

    private List<SObject> getChatDetails(BotContext context) {
        Chat__c chat = getChat(context.bot, context.received.chat);
        ChatUser__c user = getChatUser(context.received.chat.sender);
        ChatMessage__c message = getChatMessage(chat.ExternalId__c, user.ExternalId__c, context.received.message);
        return new List<SObject> { chat, user, message };
    }

    // TODO: Handle only for appropriate event types
    private void handleUpdateEvent(BotContext context) {
        try {
            getBotHandler(context.bot.Handler__c).handle(context);
        } catch (Exception error) {
            BotErrorLogger.log(context.bot.Id, error);
        }
    }

    private IBotHandler getBotHandler(String type) {
        return (IBotHandler) BotUtils.createInstance(type);
    }

    private Chat__c getChat(Bot__c bot, BotUpdateModel.ChatModel chat) {
        return new Chat__c(
            Name = chat.title,
            Bot__c = bot.Id,
            ExternalId__c = BotUtils.generateChatId(bot.TokenHash__c, String.valueOf(chat.id))
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
            ExternalId__c = String.valueOf(user.id)
        );
    }

    private ChatMessage__c getChatMessage(String chatId, String userId, BotUpdateModel.MessageModel message) {
        return new ChatMessage__c(
            Chat__r = new Chat__c(ExternalId__c = chatId),
            User__r = new ChatUser__c(ExternalId__c = userId),
            Text__c = message.text,
            SendDate__c = message.sentAt,
            ExternalId__c = String.valueOf(message.id)
        );
    }

    private String getValueOrEmptyString(String value) {
        return String.isBlank(value) ? '' : value;
    }
}
