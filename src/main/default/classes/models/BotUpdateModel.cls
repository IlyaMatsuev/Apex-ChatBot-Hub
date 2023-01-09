/**
 * @description TODO
 */
global class BotUpdateModel {
    global final BotUpdateEventType eventType;
    global final ChatModel chat;
    global final MessageModel message;

    public BotUpdateModel(IBotUpdateEventEntity updateEntity) {
        this.eventType = updateEntity.getType();
        this.chat = new ChatModel(updateEntity.getChat());
        this.message = new MessageModel(updateEntity.getMessage());
    }

    global class ChatModel {
        global final String id;
        global final String title;
        global Boolean isDM { get { return id == sender?.id; } }
        global final UserModel sender;

        private ChatModel(IBotChatEntity chat) {
            this.id = chat.getId();
            this.title = chat.getTitle();
            this.sender = new UserModel(chat.getSender());
        }
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
