global class BotUpdateModel {
    private static final Map<BotType, Map<String, String>> UPDATE_PAYLOAD_FIELDS_REPLACEMENTS = new Map<BotType, Map<String, String>>{
        BotType.Telegram => new Map<String, String>{ 'from' => 'm_from', 'date' => 'm_date' }
    };

    global final UserModel user;
    global final ChatModel chat;
    global final MessageModel message;

    private BotUpdateModel(TelegramBotUpdateWrapper telegramUpdateWrapper) {
        this.user = new UserModel(telegramUpdateWrapper.message.m_from);
        this.chat = new ChatModel(telegramUpdateWrapper.message.chat);
        this.message = new MessageModel(telegramUpdateWrapper.message);
    }

    public static BotUpdateModel fromPayload(String jsonUpdate, BotType type) {
        if (type == BotType.Telegram) {
            return new BotUpdateModel(
                (TelegramBotUpdateWrapper) deserializePayload(jsonUpdate, type, TelegramBotUpdateWrapper.class)
            );
        }
        throw new IllegalArgumentException('There is no constructor for the provided bot type: ' + type);
    }

    private static Object deserializePayload(String jsonUpdate, BotType botType, Type handlerType) {
        if (UPDATE_PAYLOAD_FIELDS_REPLACEMENTS.containsKey(botType)) {
            Map<String, String> replacements = UPDATE_PAYLOAD_FIELDS_REPLACEMENTS.get(botType);
            for (String replaceField : replacements.keySet()) {
                jsonUpdate = jsonUpdate.replace('"' + replaceField + '"', '"' + replacements.get(replaceField) + '"');
            }
        }
        return JSON.deserialize(jsonUpdate, handlerType);
    }

    global class UserModel {
        global final Long id;
        global final String firstName;
        global final String lastName;
        global final String username;

        private UserModel(TelegramBotUserWrapper user) {
            this.id = user.id;
            this.firstName = user.first_name;
            this.lastName = user.last_name;
            this.username = user.username;
        }
    }

    global class ChatModel {
        global final Long id;
        global final String title;
        global final String firstName;
        global final String lastName;
        global final String username;

        private ChatModel(TelegramBotChatWrapper chat) {
            this.id = chat.id;
            this.title = chat.title;
            this.firstName = chat.first_name;
            this.lastName = chat.last_name;
            this.username = chat.username;
        }
    }

    global class MessageModel {
        global final Long id;
        global final String text;
        global final DateTime sentAt;

        private MessageModel(TelegramBotMessageWrapper message) {
            this.id = message.message_id;
            this.text = message.text;
            this.sentAt = DateTime.newInstance(message.m_date);
        }
    }
}
