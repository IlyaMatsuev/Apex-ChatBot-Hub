global class BotUpdateModel {
    private static final Map<BotType, Type> UPDATE_ENTITY_TYPES_BY_BOT_TYPES = new Map<BotType, Type>{
        BotType.Telegram => TelegramBotUpdate.class
    };

    global final UserModel user;
    global final ChatModel chat;
    global final MessageModel message;

    private BotUpdateModel(IBotUpdateEntity updateEntity) {
        this.user = new UserModel(updateEntity.getSender());
        this.chat = new ChatModel(updateEntity.getChat());
        this.message = new MessageModel(updateEntity.getMessage());
    }

    public static BotUpdateModel fromPayload(String payload, BotType type) {
        if (!UPDATE_ENTITY_TYPES_BY_BOT_TYPES.containsKey(type)) {
            throw new IllegalArgumentException('There is no constructor for the provided bot type: ' + type);
        }
        return new BotUpdateModel(
            (IBotUpdateEntity) JSON.deserialize(payload, UPDATE_ENTITY_TYPES_BY_BOT_TYPES.get(type))
        );
    }

    global class UserModel {
        global final Long id;
        global final String firstName;
        global final String lastName;
        global final String username;

        private UserModel(IBotUserEntity user) {
            this.id = user.getId();
            this.firstName = user.getFirstName();
            this.lastName = user.getLastName();
            this.username = user.getUsername();
        }
    }

    global class ChatModel {
        global final Long id;
        global final String title;
        global final String firstName;
        global final String lastName;
        global final String username;

        private ChatModel(IBotChatEntity chat) {
            this.id = chat.getId();
            this.title = chat.getTitle();
            this.firstName = chat.getFirstName();
            this.lastName = chat.getLastName();
            this.username = chat.getUsername();
        }
    }

    global class MessageModel {
        global final Long id;
        global final String text;
        global final DateTime sentAt;

        private MessageModel(IBotMessageEntity message) {
            this.id = message.getId();
            this.text = message.getText();
            this.sentAt = message.getSendDate();
        }
    }
}
