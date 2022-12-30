public interface IBotWebhookEventEntity {
    // TODO: Decide on something that is not string. Maybe consider my own enum type
    String getType();
    IBotUpdateEntity getUpdate();
}
