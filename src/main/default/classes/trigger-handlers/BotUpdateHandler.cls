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
            Bot__c bot = (Bot__c) JSON.deserialize(event.Bot__c, Bot__c.class);
            BotUpdateModel updateModel = BotUpdateModel.fromPayload(event.Payload__c, BotType.valueOf(bot.Type__c));
            for (SObject chatDetailEntry : getChatDetails(bot, updateModel)) {
                if (!chatsDetails.contains(chatDetailEntry)) {
                    chatsDetails.add(chatDetailEntry);
                }
            }
            botContexts.add(new BotContext(bot, updateModel, serviceFactory));
        }

        BotUtils.saveAsync(chatsDetails, 'ExternalId__c');

        for (BotContext botContext : botContexts) {
            getBotHandler(botContext.bot.Handler__c).handle(botContext);
        }
    }

    private List<SObject> getChatDetails(Bot__c bot, BotUpdateModel updateModel) {
        Chat__c chat = getChat(bot, updateModel.chat);
        ChatUser__c user = getChatUser(updateModel.user);
        ChatMessage__c message = getChatMessage(chat.ExternalId__c, user.ExternalId__c, updateModel.message);
        return new List<SObject>{ chat, user, message };
    }

    private IBotHandler getBotHandler(String handlerType) {
        return (IBotHandler) Type.forName(handlerType).newInstance();
    }

    private Chat__c getChat(Bot__c bot, BotUpdateModel.ChatModel chat) {
        String chatName = chat.username;
        if (String.isNotBlank(chat.title)) {
            chatName = chat.title;
        } else if (String.isNotBlank(chat.firstName) || String.isNotBlank(chat.lastName)) {
            chatName = getValueOrEmptyString(chat.firstName) + ' ' + getValueOrEmptyString(chat.lastName);
        }
        return new Chat__c(
            Name = chatName.trim(),
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
            ExternalId__c = String.valueOf(message.id)
        );
    }

    private String getValueOrEmptyString(String value) {
        return String.isBlank(value) ? '' : value;
    }
}
