/**
 * @description Service class that provides access to all `Viber` `send` methods
 */
global class ViberBotSenderService implements IBotSenderService {
    private static final Integer VIBER_MIN_API_VERSION = 7;

    private final String senderName;
    private final List<String> chatIds;
    private final BotCalloutService calloutService;
    private final IBotCallback callback;

    private ViberReplyKeyboardOptions replyKeyboard;
    private final ViberBotMethod sendMethod {
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
            new BotJsonPayload().set('type', BotMessageType.Text.name()).set('text', text)
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
        BotJsonPayload payload = prepareMessagePayload('picture')
            .set('media', imageUrl)
            .set('text', options.caption, true)
            .set('thumbnail', options.thumbnail, true);

        BotJsonPayload callbackParams = new BotJsonPayload()
            .set('type', BotMessageType.Image.name())
            .set('mediaUrl', imageUrl)
            .set('text', options.caption, true)
            .set('parameters', new BotJsonPayload().set('thumbnail', options.thumbnail, true));

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
        BotJsonPayload payload = prepareMessagePayload('video')
            .set('text', options.caption, true)
            .set('media', videoUrl)
            .set('size', options.size)
            .set('duration', options.duration, true)
            .set('thumbnail', options.thumbnail, true);

        BotJsonPayload callbackParams = new BotJsonPayload()
            .set('type', BotMessageType.Video.name())
            .set('mediaUrl', videoUrl)
            .set('text', options.caption, true)
            .set(
                'parameters',
                new BotJsonPayload()
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
        BotJsonPayload payload = prepareMessagePayload('file')
            .set('media', fileUrl)
            .set('file_name', fileName)
            .set('size', options.size);

        BotJsonPayload callbackParams = new BotJsonPayload()
            .set('type', BotMessageType.File.name())
            .set('mediaUrl', fileUrl)
            .set('parameters', new BotJsonPayload().set('size', options.size).set('fileName', fileName));

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
                .set('contact', new BotJsonPayload().set('name', name).set('phone_number', phone)),
            new BotJsonPayload()
                .set('type', BotMessageType.Contact.name())
                .set('parameters', new BotJsonPayload().set('name', name).set('phone', phone))
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
                .set('location', new BotJsonPayload().set('lat', latitude).set('lon', longitude)),
            new BotJsonPayload()
                .set('type', BotMessageType.Location.name())
                .set('parameters', new BotJsonPayload().set('lat', latitude).set('lon', longitude))
        );
    }

    /**
     * @description Sends a sticker
     * @param stickerId The unique identifier of the sticker
     */
    global void sticker(Integer stickerId) {
        send(
            prepareMessagePayload('sticker').set('sticker_id', stickerId),
            new BotJsonPayload()
                .set('type', BotMessageType.Sticker.name())
                .set('parameters', new BotJsonPayload().set('stickerId', String.valueOf(stickerId)))
        );
    }

    /**
     * @description Sends a URL
     * @param link The URL link
     */
    global void url(String link) {
        send(
            prepareMessagePayload('url').set('media', link),
            new BotJsonPayload().set('type', BotMessageType.Url.name()).set('mediaUrl', link)
        );
    }

    /**
     * @description Sends a carousel message with the custom layout
     * @param carousel The instance of the <<ViberReplyKeyboardOptions>> class for customizing the carousel layout
     */
    global void carousel(ViberReplyKeyboardOptions carousel) {
        BotJsonPayload payload = prepareMessagePayload('rich_media').set('rich_media', carousel.setType('rich_media'));
        BotJsonPayload callbackParams = new BotJsonPayload()
            .set('type', BotMessageType.Custom.name())
            .set('parameters', carousel);

        send(payload, callbackParams);
    }

    /**
     * @description Sets a simple custom keyboard for the message that the receiver will have instead of the standard input keyboard
     * @param buttons The list of buttons to be shown to the receiver
     * @return The current instance of `Viber` sender service
     */
    global ViberBotSenderService withReplyKeyboard(BotReplyKeyboardButton[] buttons) {
        ViberReplyKeyboardOptions keyboard = new ViberReplyKeyboardOptions();
        for (BotReplyKeyboardButton button : buttons) {
            ViberReplyKeyboardOptions.Button keyboardButton = new ViberReplyKeyboardOptions.Button();
            if (button.sharesContact) {
                keyboardButton.asPhoneSharing(button.text);
            } else if (button.sharesLocation) {
                keyboardButton.asLocationSharing(button.text);
            } else {
                keyboardButton.asReply(button.text, button.text);
            }
            keyboard.addButton(keyboardButton);
        }
        return withReplyKeyboard(keyboard);
    }

    /**
     * @description Sets a custom keyboard with more options for the message that the receiver will have instead of the standard input keyboard
     * @param keyboard The instance of the <<ViberReplyKeyboardOptions>> class for customizing the keyboard layout
     * @return The current instance of `Viber` sender service
     */
    global ViberBotSenderService withReplyKeyboard(ViberReplyKeyboardOptions keyboard) {
        keyboard.setType('keyboard');
        this.replyKeyboard = keyboard;
        return this;
    }

    private BotJsonPayload prepareMessagePayload(String type) {
        BotJsonPayload payload = new BotJsonPayload()
            .set('sender', new BotJsonPayload().set('name', senderName))
            .set('type', type)
            .set('min_api_version', VIBER_MIN_API_VERSION);

        if (sendMethod == ViberBotMethod.SendMessage) {
            payload.set('receiver', chatIds.get(0));
        } else {
            payload.set('broadcast_list', chatIds);
        }

        if (replyKeyboard != null) {
            payload.set('keyboard', replyKeyboard);
        }

        return payload;
    }

    private void send(BotJsonPayload payload, BotJsonPayload callbackParams) {
        BotJsonPayload response = calloutService.call(sendMethod, payload);
        callback.execute(
            callbackParams.set('messageId', response.getString('message_token')).set('keyboard', replyKeyboard, true)
        );
    }
}
