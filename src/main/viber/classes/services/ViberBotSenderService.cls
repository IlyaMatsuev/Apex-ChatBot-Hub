/**
 * @description Service class that provides access to all `Viber` `send` methods
 */
global class ViberBotSenderService implements IBotSenderService {
    private static final Integer DEFAULT_FILE_MESSAGE_SIZE = 10000;

    private final String senderName;
    private final List<String> chatIds;
    private final BotCalloutService calloutService;
    private final IBotCallback callback;
    private ViberBotMethod sendMethod {
        get { return chatIds.size() > 1 ? ViberBotMethod.BroadcastMessage : ViberBotMethod.SendMessage; }
    }

    public ViberBotSenderService(
        String senderName,
        List<String> chatIds,
        BotCalloutService calloutService,
        IBotCallback callback
    ) {
        this.chatIds = chatIds;
        this.senderName = senderName;
        this.calloutService = calloutService;
        this.callback = callback;
    }

    /**
     * @description Sends a text message
     * @param text The message text to send
     */
    global void text(String text) {
        if (BotUtils.isUrl(text)) {
            url(text);
            return;
        }

        send(
            prepareMessagePayload('text').set('text', text),
            new ValueMap().set('type', BotMessageType.Text.name()).set('text', text)
        );
    }

    // TODO: Add overload with options: thumbnail
    /**
     * @description Sends an image
     * @param imageUrl The image URL
     */
    global void image(String imageUrl) {
        image(imageUrl, null);
    }

    /**
     * @description Sends an image with a caption
     * @param imageUrl The image URL
     * @param caption The text to attach to the image
     */
    global void image(String imageUrl, String caption) {
        send(
            prepareMessagePayload('picture').set('text', caption, true).set('media', imageUrl),
            new ValueMap().set('type', BotMessageType.Image.name()).set('text', caption).set('mediaUrl', imageUrl)
        );
    }

    // TODO: Add overload with options: size, duration, thumbnail
    /**
     * @description Sends a video
     * @param videoUrl The video URL
     */
    global void video(String videoUrl) {
        video(videoUrl, null);
    }

    /**
     * @description Sends a video with a caption
     * @param videoUrl The video URL
     * @param caption The text to attach to the video
     */
    global void video(String videoUrl, String caption) {
        send(
            prepareMessagePayload('video')
                .set('text', caption, true)
                .set('media', videoUrl)
                .set('size', DEFAULT_FILE_MESSAGE_SIZE),
            new ValueMap().set('type', BotMessageType.Video.name()).set('text', caption).set('mediaUrl', videoUrl)
        );
    }

    // TODO: Add overload with options: size, file_name
    /**
     * @description Sends a file
     * @param fileUrl The file URL. Should include file name with extension in the end
     */
    global void file(String fileUrl) {
        file(fileUrl, null);
    }

    /**
     * @description Sends a file
     * @param fileUrl The file URL. Should include file name with extension in the end
     * @param caption The text to attach to the file
     */
    global void file(String fileUrl, String caption) {
        send(
            prepareMessagePayload('file')
                .set('media', fileUrl)
                // Capturing the file name from the url: "https://example.com/static/file.pdf"
                .set('file_name', fileUrl.substringAfterLast('/'))
                .set('size', DEFAULT_FILE_MESSAGE_SIZE),
            new ValueMap().set('type', BotMessageType.File.name()).set('mediaUrl', fileUrl)
        );

        // Viber doesn't support captions for file messages, so send caption text separately
        if (String.isNotBlank(caption?.trim())) {
            text(caption);
        }
    }

    /**
     * @description Sends a contact reference
     * @param name The contact first name or full name (via spaces)
     * @param phone The contact phone number
     */
    global void contact(String name, String phone) {
        send(
            prepareMessagePayload('contact')
                .set('contact', new ValueMap().set('name', name).set('phone_number', phone)),
            new ValueMap()
                .set('type', BotMessageType.Contact.name())
                .set('parameters', new ValueMap().set('name', name).set('phone', phone))
        );
    }

    /**
     * @description Sends a location. Latitude and longitude values are not validated
     * @param latitude The location latitude
     * @param longitude The location longitude
     */
    global void location(Decimal latitude, Decimal longitude) {
        send(
            prepareMessagePayload('location')
                .set('location', new ValueMap().set('lat', latitude).set('lon', longitude)),
            new ValueMap()
                .set('type', BotMessageType.Location.name())
                .set('parameters', new ValueMap().set('lat', latitude).set('lon', longitude))
        );
    }

    /**
     * @description Sends a sticker
     * @param stickerId The unique identifier of the sticker
     */
    global void sticker(Integer stickerId) {
        send(
            prepareMessagePayload('sticker').set('sticker_id', stickerId),
            new ValueMap()
                .set('type', BotMessageType.Sticker.name())
                .set('parameters', new ValueMap().set('stickerId', String.valueOf(stickerId)))
        );
    }

    /**
     * @description Sends a URL
     * @param link The URL link
     */
    global void url(String link) {
        send(
            prepareMessagePayload('url').set('media', link),
            new ValueMap().set('type', BotMessageType.Url.name()).set('mediaUrl', link)
        );
    }

    private ValueMap prepareMessagePayload(String type) {
        ValueMap payload = new ValueMap().set('sender', new ValueMap().set('name', senderName)).set('type', type);

        if (sendMethod == ViberBotMethod.SendMessage) {
            payload.set('receiver', chatIds.get(0));
        } else {
            payload.set('broadcast_list', chatIds);
        }
        return payload;
    }

    private void send(ValueMap payload, ValueMap callbackParams) {
        ValueMap response = calloutService.call(sendMethod, payload);
        callback.execute(callbackParams.set('messageId', response.getString('message_token')));
    }
}
