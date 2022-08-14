// This event handler suppose to handle only one event at time
public class BotUpdateHandler implements Triggers.IHandler {
    private final BotServiceFactory serviceFactory;

    public BotUpdateHandler() {
        this(new BotServiceFactory());
    }

    private BotUpdateHandler(BotServiceFactory serviceFactory) {
        this.serviceFactory = serviceFactory;
    }

    public void handle(Triggers.Context context) {
        BotUpdateEvent__e event = (BotUpdateEvent__e) context.props.newList.get(0);
        Bot__c bot = (Bot__c) JSON.deserialize(event.Bot__c, Bot__c.class);
        BotUpdateModel updateModel = BotUpdateModel.fromPayload(event.Payload__c, BotType.valueOf(bot.Type__c));

        getBotHandler(bot.Handler__c).handle(createBotContext(bot, updateModel));

        updateChatDetails(bot, updateModel);
    }

    private void updateChatDetails(Bot__c bot, BotUpdateModel updateModel) {
        Chat__c chat = getChat(bot, updateModel.chat);
        ChatUser__c user = getChatUser(updateModel.user);
        Database.upsert(chat, Chat__c.ExternalId__c);
        Database.upsert(user, ChatUser__c.ExternalId__c);
        Database.insert(getChatMessage(chat, user, updateModel.message));
    }

    private IBotHandler getBotHandler(String handlerType) {
        return (IBotHandler) Type.forName(handlerType).newInstance();
    }

    private BotContext createBotContext(Bot__c bot, BotUpdateModel updateModel) {
        return new BotContext(bot, updateModel, serviceFactory.createBotService(bot, updateModel));
    }

    private Chat__c getChat(Bot__c bot, BotUpdateModel.ChatModel chat) {
        String chatName = chat.username;
        if (String.isNotBlank(chat.title)) {
            chatName = chat.title;
        } else if (String.isNotBlank(chat.firstName) || String.isNotBlank(chat.lastName)) {
            chatName = getValueOrEmptyString(chat.firstName) + getValueOrEmptyString(chat.lastName);
        }
        return new Chat__c(Name = chatName, Bot__c = bot.Id, ExternalId__c = String.valueOf(chat.id));
    }

    private ChatUser__c getChatUser(BotUpdateModel.UserModel user) {
        String userName = user.username;
        if (String.isNotBlank(user.firstName) || String.isNotBlank(user.lastName)) {
            userName = getValueOrEmptyString(user.firstName) + getValueOrEmptyString(user.lastName);
        }
        return new ChatUser__c(
            Name = userName,
            FirstName__c = user.firstName,
            LastName__c = user.lastName,
            Username__c = user.username,
            ExternalId__c = String.valueOf(user.id)
        );
    }

    private ChatMessage__c getChatMessage(Chat__c chat, ChatUser__c user, BotUpdateModel.MessageModel message) {
        return new ChatMessage__c(
            Chat__c = chat.Id,
            User__c = user.Id,
            Text__c = message.text,
            ExternalId__c = String.valueOf(message.id)
        );
    }

    private String getValueOrEmptyString(String value) {
        return String.isBlank(value) ? '' : value;
    }
}
