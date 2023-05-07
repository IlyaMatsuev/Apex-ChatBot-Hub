public abstract class BotPayload {
    // This is necessary to avoid an exception during JSON serialization: `Apex Type unsupported in JSON: Object`
    private final String initialPayload;

    protected BotJsonPayload payload {
        get {
            if (payload == null) {
                payload = BotJsonPayload.fromJson(initialPayload);
            }
            return payload;
        }
        private set;
    }

    protected BotPayload() {
        this(new BotJsonPayload());
    }

    protected BotPayload(BotJsonPayload payload) {
        this.payload = payload;
    }

    public BotJsonPayload getJsonPayload() {
        return payload;
    }
}
