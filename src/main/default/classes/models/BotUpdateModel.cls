/**
 * @description Contains all the details about the incoming update: message, chat and user information
 */
global class BotUpdateModel {
    /**
     * @description The type of the incoming event. Event types are different for every bot (e.g. `TelegramBotUpdateEventType` or `ViberBotUpdateEventType`)
     */
    global final BotUpdateEventType eventType;
    /**
     * @description The object containing all details about the chat where the update is came from
     */
    global final ChatModel chat;
    /**
     * @description The object containing all details about the message sent to the bot
     */
    global final MessageModel message;

    public BotUpdateModel(IBotUpdateEventEntity updateEntity) {
        this.eventType = updateEntity.getType();
        this.chat = new ChatModel(updateEntity.getChat());
        this.message = new MessageModel(updateEntity.getMessage());
    }

    /**
     * @description Contains all details about the chat where the update is came from
     */
    global class ChatModel {
        /**
         * @description The messanger's chat id
         */
        global final String id;
        /**
         * @description The messanger's chat title. Can be either firstname + lastname or username depending on how much profile information is filled by the user
         */
        global final String title;
        /**
         * @description Evaluates `true` if the current update is coming from the private chat (direct message)
         */
        global Boolean isDM { get { return id == sender?.id; } }
        /**
         * @description The object containing all details about the user who sent a message (or any other update) to the bot
         */
        global final UserModel sender;

        private ChatModel(IBotChatEntity chat) {
            this.id = chat.getId();
            this.title = chat.getTitle();
            this.sender = new UserModel(chat.getSender());
        }
    }

    /**
     * @description Contains all details about the the user who sent a message (or any other update) to the bot
     */
    global class UserModel {
        /**
         * @description The messanger's user id
         */
        global final String id;
        /**
         * @description The messanger's user firstname
         */
        global final String firstName;
        /**
         * @description The messanger's user lastname
         */
        global final String lastName;
        /**
         * @description The messanger's user unique username
         */
        global final String username;

        private UserModel(IBotUserEntity user) {
            this.id = user.getId();
            this.firstName = user.getFirstName();
            this.lastName = user.getLastName();
            this.username = user.getUsername();
        }
    }

    /**
     * @description Contains all details about the message sent to the bot
     */
    global class MessageModel {
        /**
         * @description The messanger's message id
         */
        global final String id;
        /**
         * @description The incoming message text
         */
        global final String text;
        /**
         * @description At what time the message has been sent
         */
        global final DateTime sentAt;

        /**
         * @description The object containing the details about the incoming command. Works if the user sends a message starting with the "/" sign
         */
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

    /**
     * @description Contains the details about the command sent to the bot
     */
    global class Command {
        /**
         * @description The command's name. The first word coming after the "/" sign
         */
        global final String name;
        /**
         * @description The command's parameters. All words separated with space coming after the command name
         */
        global final List<String> params;

        private Command(String text) {
            this.name = text.substringBefore(' ').substringAfter('/');
            this.params = text.substringAfter(' ').normalizeSpace().split(' ');
        }
    }
}
