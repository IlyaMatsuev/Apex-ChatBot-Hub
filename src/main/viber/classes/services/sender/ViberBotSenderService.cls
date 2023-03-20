/**
 * @description Service class that provides access to all `Viber` `send` methods
 */
global class ViberBotSenderService implements IBotSenderService {
    private static final Integer REACH_MEDIA_MESSAGE_API_VERSION = 7;

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

    /**
     * @description Sends an image
     * @param imageUrl The image URL
     */
    global void image(String imageUrl) {
        image(imageUrl, new ViberSendImageOptions());
    }

    /**
     * @description Sends an image with a caption
     * @param imageUrl The image URL
     * @param caption The text to attach to the image
     */
    global void image(String imageUrl, String caption) {
        image(imageUrl, new ViberSendImageOptions(caption, null));
    }

    /**
     * @description Sends an image with the provided optional parameters
     * @param imageUrl The image URL
     * @param options The instance of <<ViberSendImageOptions>> with other optional parameters
     */
    global void image(String imageUrl, ViberSendImageOptions options) {
        ValueMap payload = prepareMessagePayload('picture')
            .set('media', imageUrl)
            .set('text', options.caption, true)
            .set('thumbnail', options.thumbnail, true);

        ValueMap callbackParams = new ValueMap()
            .set('type', BotMessageType.Image.name())
            .set('mediaUrl', imageUrl)
            .set('text', options.caption, true)
            .set('parameters', new ValueMap().set('thumbnail', options.thumbnail, true));

        send(payload, callbackParams);
    }

    /**
     * @description Sends a video
     * @param videoUrl The video URL
     */
    global void video(String videoUrl) {
        video(videoUrl, new ViberSendVideoOptions());
    }

    /**
     * @description Sends a video with a caption
     * @param videoUrl The video URL
     * @param caption The text to attach to the video
     */
    global void video(String videoUrl, String caption) {
        video(videoUrl, new ViberSendVideoOptions(caption, null, null, null));
    }

    /**
     * @description Sends a video with the provided optional parameters
     * @param videoUrl The video URL
     * @param options The instance of <<ViberSendVideoOptions>> with other optional parameters
     */
    global void video(String videoUrl, ViberSendVideoOptions options) {
        ValueMap payload = prepareMessagePayload('video')
            .set('text', options.caption, true)
            .set('media', videoUrl)
            .set('size', options.size)
            .set('duration', options.duration, true)
            .set('thumbnail', options.thumbnail, true);

        ValueMap callbackParams = new ValueMap()
            .set('type', BotMessageType.Video.name())
            .set('mediaUrl', videoUrl)
            .set('text', options.caption, true)
            .set(
                'parameters',
                new ValueMap()
                    .set('size', options.size)
                    .set('duration', options.duration, true)
                    .set('thumbnail', options.thumbnail, true)
            );

        send(payload, callbackParams);
    }

    /**
     * @description Sends a file
     * @param fileUrl The file URL. Should include file name with extension in the end
     */
    global void file(String fileUrl) {
        file(fileUrl, new ViberSendFileOptions());
    }

    /**
     * @description Sends a file
     * @param fileUrl The file URL. Should include file name with extension in the end
     * @param caption The text to attach to the file
     */
    global void file(String fileUrl, String caption) {
        file(fileUrl, new ViberSendFileOptions(caption, null, null));
    }

    /**
     * @description Sends a file
     * @param fileUrl The file URL. Should include file name with extension in the end
     * @param options The instance of <<ViberSendFileOptions>> with other optional parameters
     */
    global void file(String fileUrl, ViberSendFileOptions options) {
        // Capturing the file name from the url if not provided in options: "https://example.com/static/file.pdf"
        String fileName = String.isBlank(options.fileName) ? fileUrl.substringAfterLast('/') : options.fileName;
        ValueMap payload = prepareMessagePayload('file')
            .set('media', fileUrl)
            .set('file_name', fileName)
            .set('size', options.size);

        ValueMap callbackParams = new ValueMap()
            .set('type', BotMessageType.File.name())
            .set('mediaUrl', fileUrl)
            .set('parameters', new ValueMap().set('size', options.size).set('fileName', fileName));

        send(payload, callbackParams);

        // Viber doesn't support captions for file messages, so send caption text separately
        if (String.isNotBlank(options.caption?.trim())) {
            text(options.caption);
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

    /**
     * @description Sends a carousel message with the custom layout
     * @param carousel The instance of the <<ViberCustomMessageKeyboard>> class for customizing message layout
     */
    global void carousel(ViberCustomMessageKeyboard carousel) {
        carousel.setType('rich_media');

        ValueMap payload = prepareMessagePayload('rich_media')
            .set('min_api_version', REACH_MEDIA_MESSAGE_API_VERSION)
            .set('rich_media', carousel);
        ValueMap callbackParams = new ValueMap().set('type', BotMessageType.Custom.name()).set('parameters', carousel);

        send(payload, callbackParams);
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
