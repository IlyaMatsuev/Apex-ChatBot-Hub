global class BotUpdateModel {
    global final String id;
    global final UserModel user;
    global final ChatModel chat;
    global final MessageModel message;

    private BotUpdateModel(IBotUpdateEntity updateEntity) {
        this.id = updateEntity.getId();
        this.user = new UserModel(updateEntity.getSender());
        this.chat = new ChatModel(updateEntity.getChat());
        this.message = new MessageModel(updateEntity.getMessage());
    }

    public static BotUpdateModel fromPayload(String payload, BotType botType) {
        return new BotUpdateModel(
            (IBotUpdateEntity) ValueMap.fromJson(
                payload,
                Type.forName(BotSettingsProvider.get(botType).BotUpdateEntity__c)
            )
        );
    }

    global class UserModel {
        global final String id;
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
        global final String id;
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
        global final String id;
        global final String text;
        global final DateTime sentAt;

        global final Command command {
            get {
                if (command == null && text.startsWith('/')) {
                    command = new Command(text);
                }
                return command;
            }
            private set;
        }

        private MessageModel(IBotMessageEntity message) {
            this.id = message.getId();
            this.text = message.getText();
            this.sentAt = message.getSendDate();
        }
    }

    global class Command {
        global final String name;
        global final List<String> params;

        private Command(String text) {
            this.name = text.substringBefore(' ').substringAfter('/');
            this.params = text.substringAfter(' ').normalizeSpace().split(' ');
        }
    }
}
