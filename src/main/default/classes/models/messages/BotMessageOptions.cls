public class BotMessageOptions {
    public final BotMessageType type;
    public final String text;
    public final String mediaUrl;
    public final ValueMap params;

    private BotMessageOptions(BotMessageType type, String text, String mediaUrl, ValueMap params) {
        this.type = type;
        this.text = text;
        this.mediaUrl = mediaUrl;
        this.params = params == null ? new ValueMap() : params;
    }

    public static BotMessageOptions asText(String text) {
        return new BotMessageOptions(BotMessageType.Text, text, null, null);
    }

    public static BotMessageOptions asImage(String text, String imageUrl) {
        return new BotMessageOptions(BotMessageType.Image, text, imageUrl, null);
    }

    public static BotMessageOptions asVideo(String text, String videoUrl, Decimal duration, Decimal size) {
        return new BotMessageOptions(
            BotMessageType.Video,
            text,
            videoUrl,
            new ValueMap().set('duration', duration).set('size', size)
        );
    }
}
