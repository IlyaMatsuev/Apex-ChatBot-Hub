/**
 * @description Represents the context with all necessary variables and entities for properly handling the incoming updates for bot webhooks
 */
global class BotContext {
    /**
     * @description The `Bot__c` record associated with the current webhook update
     */
    global final Bot__c bot;
    /**
     * @description The type of the bot associated with the incoming update
     */
    global final BotType type;
    /**
     * @description The model instance containing all incoming related to the incoming update (new message, edited message, etc.)
     */
    global final BotUpdateModel received;
    /**
     * @description The object with the most common methods for quick reply to the incoming updates
     */
    global final Reply reply;

    private final BotServiceFactory factory;

    public BotContext(Bot__c bot, BotUpdateModel received, BotServiceFactory factory) {
        this.bot = bot;
        this.type = BotType.valueOf(bot.Type__c);
        this.received = received;
        this.factory = factory;
        this.reply = new Reply(received, factory.createBotService(bot));
    }

    /**
     * Create BotService not related to the current context
     * @param bot SObject record of the bot you need to create service for
     */
    global BotService getService(Bot__c bot) {
        return factory.createBotService(bot);
    }

    /**
     * Upsert a record asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param record SObject record to be upserted
     */
    global void save(SObject record) {
        save(new List<SObject> { record });
    }

    /**
     * Upsert records asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param records List of records to be upserted
     */
    global void save(List<SObject> records) {
        save(records, null);
    }

    /**
     * Upsert records asynchronously by the provided external id field.
     * This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param records List of records to be upserted
     * @param externalIdField Field name of the external id for the provided objects
     */
    global void save(List<SObject> records, String externalIdField) {
        BotUtils.saveAsync(records, externalIdField);
    }

    /**
     * @description The inner class with the most common methods for quick reply to the incoming updates
     */
    global class Reply {
        private final BotService service;
        private final BotUpdateModel received;

        private String chatId { get { return received.chat.id; } }

        private Reply(BotUpdateModel received, BotService service) {
            this.received = received;
            this.service = service;
        }

        /**
         * @description Sends a text message as a response to the incoming update
         * @param message The text message to be sent to the user who sent the update
         */
        global void sendMessage(String message) {
            service.sendMessage(chatId, message);
        }

        /**
         * @description Sends an image message as a response to the incoming update
         * @param imageUrl The image URL
         */
        global void sendImage(String imageUrl) {
            sendImage(imageUrl, null);
        }

        /**
         * @description Sends an image message with a caption as a response to the incoming update
         * @param imageUrl The image URL
         * @param caption The text to be attached with an image
         */
        global void sendImage(String imageUrl, String caption) {
            service.sendImage(chatId, imageUrl, caption);
        }

        /**
         * @description Sends a video message as a response to the incoming update
         * @param videoUrl The image URL
         */
        global void sendVideo(String videoUrl) {
            sendVideo(videoUrl, null);
        }

        /**
         * @description Sends an image message with a caption as a response to the incoming update
         * @param videoUrl The image URL
         * @param caption The text to be attached with the video
         */
        global void sendVideo(String videoUrl, String caption) {
            service.sendVideo(chatId, videoUrl, caption);
        }

        /**
         * @description Sends a file message as a response to the incoming update
         * @param fileUrl The file URL. Should include file name with extension in the end
         */
        global void sendFile(String fileUrl) {
            sendFile(fileUrl, null);
        }

        /**
         * @description Sends an file message with a caption as a response to the incoming update
         * @param fileUrl The file URL. Should include file name with extension in the end
         * @param caption The text to be attached with the file
         */
        global void sendFile(String fileUrl, String caption) {
            service.sendFile(chatId, fileUrl, caption);
        }
    }
}
