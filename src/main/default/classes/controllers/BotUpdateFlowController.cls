public without sharing class BotUpdateFlowController {
    @InvocableMethod(label = 'Handle Bot Update')
    public static void handleBotUpdate(List<BotUpdateInput> params) {
        try {
            BotUpdateInput input = params.get(0);

            List<IBotContext> contexts = createBotContexts(input.botJson, input.updatePayloadJson);

            saveChatDetails(contexts);

            for (IBotContext context : contexts) {
                handleUpdateEvent(context);
            }
        } catch (Exception ex) {
            System.debug(LoggingLevel.ERROR, ex.getMessage() + '\n' + ex.getStackTraceString());
        }
    }

    private static List<IBotContext> createBotContexts(String botJson, String botJsonPayload) {
        BotModel bot = BotModel.fromJson(botJson);
        return new List<IBotContext> { new BotServiceFactory().createBotContext(bot, botJsonPayload) };
    }

    private static void saveChatDetails(List<IBotContext> contexts) {
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

        List<SObject> recordsToUpdate = new List<SObject>();
        recordsToUpdate.addAll(chats);
        recordsToUpdate.addAll(chatUsers);
        recordsToUpdate.addAll(chatMessages);
        BotUtils.saveAsync(recordsToUpdate, 'ExternalId__c');
    }

    private static Chat__c getChat(BotModel bot, IBotChat chat) {
        if (chat == null) {
            return null;
        }

        return new Chat__c(
            Name = chat.getTitle(),
            Bot__c = bot.id,
            ExternalId__c = BotUtils.generateExternalId(chat.getId(), bot.tokenHash)
        );
    }

    private static ChatUser__c getChatUser(IBotUser user) {
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

    private static ChatMessage__c getChatMessage(String chatId, String userId, IBotMessage message) {
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

    private static String getValueOrEmptyString(String value) {
        return String.isBlank(value) ? '' : value;
    }

    private static void handleUpdateEvent(IBotContext context) {
        BotModel bot;
        try {
            bot = context.getBot();
            bot.handler.handle(context);
        } catch (Exception error) {
            BotErrorLogger.log(bot?.id, error);
        }
    }

    public class BotUpdateInput {
        @InvocableVariable(label = 'Bot JSON' required = true)
        public String botJson;
        @InvocableVariable(label = 'Bot Update Payload JSON' required = true)
        public String updatePayloadJson;
    }
}
