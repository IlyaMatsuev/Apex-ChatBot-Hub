@IsTest
public class BotServiceMock extends BotService {
    public static final Map<String, ValueMap> outboundMessages = new Map<String, ValueMap>();

    public BotServiceMock(Bot__c bot) {
        this.bot = bot;
    }

    public IBotSenderService send(String chatId) {
        return new SenderService(chatId);
    }

    public class SenderService implements IBotSenderService {
        private final String chatId;

        private SenderService(String chatId) {
            this.chatId = chatId;
        }

        public void text(String text) {
            outboundMessages.put(chatId, new ValueMap().set('type', BotMessageType.Text.name()).set('text', text));
        }

        public void image(String imageUrl) {
            image(imageUrl, null);
        }

        public void image(String imageUrl, String caption) {
            outboundMessages.put(
                chatId,
                new ValueMap()
                    .set('type', BotMessageType.Image.name())
                    .set('text', caption, true)
                    .set('mediaUrl', imageUrl)
            );
        }

        public void video(String videoUrl) {
            video(videoUrl, null);
        }

        public void video(String videoUrl, String caption) {
            outboundMessages.put(
                chatId,
                new ValueMap()
                    .set('type', BotMessageType.Video.name())
                    .set('text', caption, true)
                    .set('mediaUrl', videoUrl)
            );
        }

        public void file(String fileUrl) {
            file(fileUrl, null);
        }

        public void file(String fileUrl, String caption) {
            outboundMessages.put(
                chatId,
                new ValueMap()
                    .set('type', BotMessageType.File.name())
                    .set('text', caption, true)
                    .set('mediaUrl', fileUrl)
            );
        }

        public void contact(String name, String phone) {
            outboundMessages.put(
                chatId,
                new ValueMap().set('type', BotMessageType.Contact.name()).set('name', name).set('phone', phone)
            );
        }

        public void location(Decimal latitude, Decimal longitude) {
            outboundMessages.put(
                chatId,
                new ValueMap().set('type', BotMessageType.Location.name()).set('lat', latitude).set('lon', longitude)
            );
        }
    }
}
