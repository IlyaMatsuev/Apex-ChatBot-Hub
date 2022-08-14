public class BotUpdateModel {
    private static final Map<BotType, Map<String, String>> UPDATE_PAYLOAD_FIELDS_REPLACEMENTS = new Map<BotType, Map<String, String>>{
        BotType.Telegram => new Map<String, String>{ 'from' => 'm_from', 'date' => 'm_date' }
    };

    public final UserModel user;
    public final ChatModel chat;
    public final MessageModel message;
    public final DateTime sentAt;

    private BotUpdateModel(TelegramBotUpdateWrapper telegramUpdateWrapper) {
        // TODO: Think about a proper way to convert wrappers to models
        if (telegramUpdateWrapper.message == null) {
            return;
        }
        this.user = new UserModel(
            telegramUpdateWrapper.message.m_from.id,
            telegramUpdateWrapper.message.m_from.first_name,
            telegramUpdateWrapper.message.m_from.last_name,
            telegramUpdateWrapper.message.m_from.username
        );
        this.chat = new ChatModel(
            telegramUpdateWrapper.message.chat.id,
            telegramUpdateWrapper.message.chat.title,
            telegramUpdateWrapper.message.chat.first_name,
            telegramUpdateWrapper.message.chat.last_name,
            telegramUpdateWrapper.message.chat.username
        );
        this.message = new MessageModel(telegramUpdateWrapper.message.message_id, telegramUpdateWrapper.message.text);
        this.sentAt = DateTime.newInstance(telegramUpdateWrapper.message.m_date);
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

    public class UserModel {
        public final Long id;
        public final String firstName;
        public final String lastName;
        public final String username;

        private UserModel(Long id, String firstName, String lastName, String username) {
            this.id = id;
            this.firstName = firstName;
            this.lastName = lastName;
            this.username = username;
        }
    }

    public class ChatModel {
        public final Long id;
        public final String title;
        public final String firstName;
        public final String lastName;
        public final String username;

        private ChatModel(Long id, String title, String firstName, String lastName, String username) {
            this.id = id;
            this.title = title;
            this.firstName = firstName;
            this.lastName = lastName;
            this.username = username;
        }
    }

    public class MessageModel {
        public final Long id;
        public final String text;

        private MessageModel(Long id, String text) {
            this.id = id;
            this.text = text;
        }
    }
}
