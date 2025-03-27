public abstract class BotCustomException extends Exception {
    public final BotJsonPayload payload {
        get {
            if (payload == null) {
                payload = new BotJsonPayload();
            }
            return payload;
        }
        private set;
    }

    public BotCustomException(String message, BotJsonPayload payload) {
        this(message);
        this.payload = payload;
    }
}
