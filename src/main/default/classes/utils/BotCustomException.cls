public abstract class BotCustomException extends Exception {
    public final ValueMap payload;

    public BotCustomException(String message, ValueMap payload) {
        this(message);
        this.payload = payload;
    }
}
