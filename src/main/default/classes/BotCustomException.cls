public abstract class BotCustomException extends Exception {
    public final BotJsonPayload payload;

    public BotCustomException(String message, BotJsonPayload payload) {
        this(message);
        this.payload = payload;
    }
}
