/**
 * @description Service class that provides access to all `Telegram` `send` methods
 */
global class TelegramBotSenderService implements IBotSenderService {
    private final String chatId;
    private final BotCalloutService calloutService;
    private final IBotCallback callback;

    private BotPayload replyMarkup;

    public TelegramBotSenderService(String chatId, BotCalloutService calloutService, IBotCallback callback) {
        this.chatId = chatId;
        this.calloutService = calloutService;
        this.callback = callback;
    }

    // TODO:
    // - forwardMessage
    // - copyMessage

    /**
     * @description Sends a text message
     * @param text The message text to send
     */
    global void text(String text) {
        text(text, new TelegramSendTextOptions());
    }

    /**
     * @description Sends a text message with the provided optional parameters
     * @param text The message text to send
     * @param options The instance of <<TelegramSendTextOptions>> with other optional parameters
     */
    global void text(String text, TelegramSendTextOptions options) {
        BotJsonPayload callbackParams = new BotJsonPayload().set('parameters', options);
        if (BotUtils.isUrl(text)) {
            callbackParams.set('type', BotMessageType.Url.name()).set('mediaUrl', text);
        } else {
            callbackParams.set('type', BotMessageType.Text.name()).set('text', text);
        }
        send(
            TelegramBotMethod.SendMessage,
            new BotJsonPayload(options).set('chat_id', chatId).set('text', text),
            callbackParams
        );
    }

    /**
     * @description Sends an image
     * @param imageUrl The image URL
     */
    global void image(String imageUrl) {
        image(imageUrl, new TelegramSendImageOptions());
    }

    /**
     * @description Sends an image with a caption
     * @param imageUrl The image URL
     * @param caption The text to attach to the image
     */
    global void image(String imageUrl, String caption) {
        image(imageUrl, new TelegramSendImageOptions().withCaption(caption));
    }

    /**
     * @description Sends an image with the provided optional parameters
     * @param imageUrl The image URL
     * @param options The instance of <<TelegramSendImageOptions>> with other optional parameters
     */
    global void image(String imageUrl, TelegramSendImageOptions options) {
        send(
            TelegramBotMethod.SendPhoto,
            new BotJsonPayload(options).set('chat_id', chatId).set('photo', imageUrl),
            new BotJsonPayload()
                .set('type', BotMessageType.Image.name())
                .set('text', options.getJsonPayload().getString('caption'))
                .set('mediaUrl', imageUrl)
                .set('parameters', options)
        );
    }

    /**
     * @description Sends a video
     * @param videoUrl The video URL
     */
    global void video(String videoUrl) {
        video(videoUrl, new TelegramSendVideoOptions());
    }

    /**
     * @description Sends a video with a caption
     * @param videoUrl The video URL
     * @param caption The text to attach to the video
     */
    global void video(String videoUrl, String caption) {
        video(videoUrl, new TelegramSendVideoOptions().withCaption(caption));
    }

    /**
     * @description Sends a video with the provided optional parameters
     * @param videoUrl The video URL
     * @param options The instance of <<TelegramSendVideoOptions>> with other optional parameters
     */
    global void video(String videoUrl, TelegramSendVideoOptions options) {
        send(
            TelegramBotMethod.SendVideo,
            new BotJsonPayload(options).set('chat_id', chatId).set('video', videoUrl),
            new BotJsonPayload()
                .set('type', BotMessageType.Video.name())
                .set('text', options.getJsonPayload().getString('caption'))
                .set('mediaUrl', videoUrl)
                .set('parameters', options)
        );
    }

    /**
     * @description Sends a video note
     * @param videoNoteId The video file id that was uploaded to `Telegram`. URLs are not supported
     */
    global void videoNote(String videoNoteId) {
        videoNote(videoNoteId, new TelegramSendVideoNoteOptions());
    }

    /**
     * @description Sends a video note with the provided optional parameters
     * @param videoNoteId The video file id that was uploaded to `Telegram`. URLs are not supported
     * @param options The instance of <<TelegramSendVideoNoteOptions>> with other optional parameters
     */
    global void videoNote(String videoNoteId, TelegramSendVideoNoteOptions options) {
        send(
            TelegramBotMethod.SendVideoNote,
            new BotJsonPayload(options).set('chat_id', chatId).set('video_note', videoNoteId),
            new BotJsonPayload()
                .set('type', BotMessageType.Video.name())
                .set('parameters', new BotJsonPayload(options).set('videoNoteId', videoNoteId))
        );
    }

    /**
     * @description Sends an animation, e.g. `gif` or a video without sound
     * @param animationUrl The animation URL
     */
    global void animation(String animationUrl) {
        animation(animationUrl, new TelegramSendVideoOptions());
    }

    /**
     * @description Sends an animation, e.g. `gif` or a video without sound with a caption
     * @param animationUrl The animation URL
     * @param caption The text to attach to the animation
     */
    global void animation(String animationUrl, String caption) {
        animation(animationUrl, new TelegramSendVideoOptions().withCaption(caption));
    }

    /**
     * @description Sends an animation, e.g. `gif` or a video without sound with the provided optional parameters
     * @param animationUrl The video URL
     * @param options The instance of <<TelegramSendVideoOptions>> with other optional parameters
     */
    global void animation(String animationUrl, TelegramSendVideoOptions options) {
        send(
            TelegramBotMethod.SendAnimation,
            new BotJsonPayload(options).set('chat_id', chatId).set('animation', animationUrl),
            new BotJsonPayload()
                .set('type', BotMessageType.Animation.name())
                .set('text', options.getJsonPayload().getString('caption'))
                .set('mediaUrl', animationUrl)
                .set('parameters', options)
        );
    }

    /**
     * @description Sends an audio
     * @param audioUrl The audio URL
     */
    global void audio(String audioUrl) {
        audio(audioUrl, new TelegramSendAudioOptions());
    }

    /**
     * @description Sends an audio with a caption
     * @param audioUrl The audio URL
     * @param caption The text to attach to the audio
     */
    global void audio(String audioUrl, String caption) {
        audio(audioUrl, new TelegramSendAudioOptions().withCaption(caption));
    }

    /**
     * @description Sends an audio with the provided optional parameters
     * @param audioUrl The audio URL
     * @param options The instance of <<TelegramSendAudioOptions>> with other optional parameters
     */
    global void audio(String audioUrl, TelegramSendAudioOptions options) {
        send(
            TelegramBotMethod.SendAudio,
            new BotJsonPayload(options).set('chat_id', chatId).set('audio', audioUrl),
            new BotJsonPayload()
                .set('type', BotMessageType.Audio.name())
                .set('text', options.getJsonPayload().getString('caption'))
                .set('mediaUrl', audioUrl)
                .set('parameters', options)
        );
    }

    /**
     * @description Sends an audio as a voice message
     * @param voiceUrl The voice URL. Accepts only `.OGG` files encoded with `OPUS`, otherwise will be sent as `audio` message
     */
    global void voice(String voiceUrl) {
        voice(voiceUrl, new TelegramSendAudioOptions());
    }

    /**
     * @description Sends an audio as a voice message with a caption
     * @param voiceUrl The voice URL. Accepts only `.OGG` files encoded with `OPUS`, otherwise will be sent as `audio` message
     * @param caption The text to attach to the audio
     */
    global void voice(String voiceUrl, String caption) {
        voice(voiceUrl, new TelegramSendAudioOptions().withCaption(caption));
    }

    /**
     * @description Sends an audio as a voice message with the provided optional parameters
     * @param voiceUrl The voice URL. Accepts only `.OGG` files encoded with `OPUS`, otherwise will be sent as `audio` message
     * @param options The instance of <<TelegramSendAudioOptions>> with other optional parameters
     */
    global void voice(String voiceUrl, TelegramSendAudioOptions options) {
        send(
            TelegramBotMethod.SendVoice,
            new BotJsonPayload(options).set('chat_id', chatId).set('voice', voiceUrl),
            new BotJsonPayload()
                .set('type', BotMessageType.Audio.name())
                .set('text', options.getJsonPayload().getString('caption'))
                .set('mediaUrl', voiceUrl)
                .set('parameters', options)
        );
    }

    /**
     * @description Sends a file
     * @param fileUrl The file URL. Should include file name with extension in the end
     */
    global void file(String fileUrl) {
        file(fileUrl, new TelegramSendFileOptions());
    }

    /**
     * @description Sends a file with a caption
     * @param fileUrl The file URL
     * @param caption The text to attach to the file
     */
    global void file(String fileUrl, String caption) {
        file(fileUrl, new TelegramSendFileOptions().withCaption(caption));
    }

    /**
     * @description Sends a file with the provided optional parameters
     * @param fileUrl The file URL
     * @param options The instance of <<TelegramSendFileOptions>> with other optional parameters
     */
    global void file(String fileUrl, TelegramSendFileOptions options) {
        send(
            TelegramBotMethod.SendDocument,
            new BotJsonPayload(options).set('chat_id', chatId).set('document', fileUrl),
            new BotJsonPayload()
                .set('type', BotMessageType.File.name())
                .set('text', options.getJsonPayload().getString('caption'))
                .set('mediaUrl', fileUrl)
                .set('parameters', options)
        );
    }

    /**
     * @description Sends a contact reference
     * @param name The contact first name or full name (via spaces)
     * @param phone The contact phone number
     */
    global void contact(String name, String phone) {
        contact(name, phone, new TelegramSendContactOptions());
    }

    /**
     * @description Sends a contact reference with the provided optional parameters
     * @param name The contact first name or full name (via spaces)
     * @param phone The contact phone number
     * @param options The instance of <<TelegramSendContactOptions>> with other optional parameters
     */
    global void contact(String name, String phone, TelegramSendContactOptions options) {
        String firstName = name.substringBefore(' ');
        String lastName = name.contains(' ') ? name.substringAfter(' ') : null;

        send(
            TelegramBotMethod.SendContact,
            new BotJsonPayload(options)
                .set('chat_id', chatId)
                .set('first_name', firstName)
                .set('last_name', lastName, true)
                .set('phone_number', phone),
            new BotJsonPayload()
                .set('type', BotMessageType.Contact.name())
                .set('parameters', new BotJsonPayload(options).set('name', name).set('phone', phone))
        );
    }

    /**
     * @description Sends a location
     * @param latitude The location latitude
     * @param longitude The location longitude
     */
    global void location(Decimal latitude, Decimal longitude) {
        location(latitude, longitude, new TelegramSendLocationOptions());
    }

    /**
     * @description Sends a location with the provided optional parameters
     * @param latitude The location latitude
     * @param longitude The location longitude
     * @param options The instance of <<TelegramSendLocationOptions>> with other optional parameters
     */
    global void location(Decimal latitude, Decimal longitude, TelegramSendLocationOptions options) {
        send(
            TelegramBotMethod.SendLocation,
            new BotJsonPayload(options).set('chat_id', chatId).set('latitude', latitude).set('longitude', longitude),
            new BotJsonPayload()
                .set('type', BotMessageType.Location.name())
                .set('parameters', new BotJsonPayload(options).set('lat', latitude).set('lon', longitude))
        );
    }

    /**
     * @description Sends a venue
     * @param title The venue title
     * @param address The venue address
     * @param latitude The venue latitude
     * @param longitude The venue longitude
     */
    global void venue(String title, String address, Decimal latitude, Decimal longitude) {
        venue(title, address, latitude, longitude, new TelegramSendVenueOptions());
    }

    /**
     * @description Sends a venue with the provided optional parameters
     * @param title The venue title
     * @param address The venue address
     * @param latitude The venue latitude
     * @param longitude The venue longitude
     * @param options The instance of <<TelegramSendVenueOptions>> with other optional parameters
     */
    global void venue(
        String title,
        String address,
        Decimal latitude,
        Decimal longitude,
        TelegramSendVenueOptions options
    ) {
        BotJsonPayload payload = new BotJsonPayload(options)
            .set('chat_id', chatId)
            .set('title', title)
            .set('address', address)
            .set('latitude', latitude)
            .set('longitude', longitude);

        BotJsonPayload callbackParams = new BotJsonPayload()
            .set('type', BotMessageType.Venue.name())
            .set('text', title)
            .set(
                'parameters',
                new BotJsonPayload(options)
                    .set('title', title)
                    .set('address', address)
                    .set('lat', latitude)
                    .set('lon', longitude)
            );

        send(TelegramBotMethod.SendVenue, payload, callbackParams);
    }

    /**
     * @description Sends a sticker
     * @param stickerIdOrUrl The unique identifier of the sticker or the URL to `.WEBP` file
     */
    global void sticker(String stickerIdOrUrl) {
        sticker(stickerIdOrUrl, new TelegramSendStickerOptions());
    }

    /**
     * @description Sends a sticker with the provided optional parameters
     * @param stickerIdOrUrl The unique identifier of the sticker or the URL to `.WEBP` file
     * @param options The instance of <<TelegramSendLocationOptions>> with other optional parameters
     */
    global void sticker(String stickerIdOrUrl, TelegramSendStickerOptions options) {
        String stickerId = stickerIdOrUrl;
        String stickerUrl;
        if (BotUtils.isUrl(stickerIdOrUrl)) {
            stickerId = null;
            stickerUrl = stickerIdOrUrl;
        }
        send(
            TelegramBotMethod.SendSticker,
            new BotJsonPayload(options).set('chat_id', chatId).set('sticker', stickerIdOrUrl),
            new BotJsonPayload()
                .set('type', BotMessageType.Sticker.name())
                .set('mediaUrl', stickerUrl, true)
                .set('parameters', new BotJsonPayload(options).set('stickerId', stickerId, true))
        );
    }

    /**
     * @description Sends a poll
     * @param question The poll question. Up to `300` characters
     * @param answers The list of answers to the poll question. Should have at from `2` to `10` answers, up to `100` characters each
     */
    global void poll(String question, String[] answers) {
        poll(question, new TelegramSendPollOptions().withAnswers(answers));
    }

    /**
     * @description Sends a poll
     * @param question The poll question. Up to `300` characters
     * @param options The instance of <<TelegramSendPollOptions>> with other optional parameters
     */
    global void poll(String question, TelegramSendPollOptions options) {
        send(
            TelegramBotMethod.SendPoll,
            new BotJsonPayload(options).set('chat_id', chatId).set('question', question),
            new BotJsonPayload()
                .set('type', BotMessageType.Poll.name())
                .set('text', question)
                .set('parameters', options)
        );
    }

    /**
     * @description Sends an animated emoji displaying a random value
     */
    global void dice() {
        dice(new TelegramSendDiceOptions());
    }

    /**
     * @description Sends an animated emoji displaying a random value with the provided options
     * @param options The instance of <<TelegramSendDiceOptions>> with other optional parameters
     */
    global void dice(TelegramSendDiceOptions options) {
        send(
            TelegramBotMethod.SendDice,
            new BotJsonPayload(options).set('chat_id', chatId),
            new BotJsonPayload().set('type', BotMessageType.Other.name()).set('parameters', options)
        );
    }

    /**
     * @description Sends the bot's status for 5 seconds or until the next message. E.g. `typing...`
     * @param action The action to show to the user. Possible values: `typing`, `upload_photo`, `record_video`, `upload_video`, `record_voice`, `upload_voice`, `upload_document`, `choose_sticker`, `find_location`, `record_video_note`, `upload_video_note`
     */
    global void chatAction(String action) {
        chatAction(action, null);
    }

    /**
     * @description Sends the bot's status for 5 seconds or until the next message. E.g. `typing...`
     * @param action The action to show to the user. Possible values: `typing`, `upload_photo`, `record_video`, `upload_video`, `record_voice`, `upload_voice`, `upload_document`, `choose_sticker`, `find_location`, `record_video_note`, `upload_video_note`
     * @param threadId The id of the channel thread (topic) to where the message should be sent
     */
    global void chatAction(String action, String threadId) {
        send(
            TelegramBotMethod.SendChatAction,
            new BotJsonPayload().set('chat_id', chatId).set('action', action).set('message_thread_id', threadId, true),
            null
        );
    }

    /**
     * @description Sets a simple custom keyboard for the message that the receiver will have instead of the standard input keyboard
     * @param buttons The list of buttons to be shown to the receiver
     * @return The current instance of `Telegram` sender service
     */
    global TelegramBotSenderService withReplyKeyboard(BotReplyKeyboardButton[] buttons) {
        TelegramReplyKeyboardMarkupOptions keyboard = new TelegramReplyKeyboardMarkupOptions();
        for (Integer i = 0; i < buttons.size(); i++) {
            BotReplyKeyboardButton button = buttons.get(i);
            TelegramReplyKeyboardMarkupOptions.Button keyboardButton = new TelegramReplyKeyboardMarkupOptions.Button(
                button.text
            );
            if (button.sharesContact) {
                keyboardButton.asContactRequest();
            } else if (button.sharesLocation) {
                keyboardButton.asLocationRequest();
            }
            keyboard.addButton(i, keyboardButton);
        }
        return withReplyKeyboard(keyboard);
    }

    /**
     * @description Sets a reply keyboard for the message that the receiver will have instead of the standard input keyboard
     * @param keyboard The instance of <<TelegramReplyKeyboardMarkupOptions>> class, custom reply keyboard to be shown
     * @return The current instance of `Telegram` sender service
     */
    global TelegramBotSenderService withReplyKeyboard(TelegramReplyKeyboardMarkupOptions keyboard) {
        this.replyMarkup = keyboard;
        return this;
    }

    /**
     * @description Sets a signal that the reply keyboard has to be deleted for the receiver
     * @return The current instance of `Telegram` sender service
     */
    global TelegramBotSenderService withReplyKeyboardRemoved() {
        return withReplyKeyboardRemoved(new TelegramReplyKeyboardRemoveOptions());
    }

    /**
     * @description Sets a signal that the reply keyboard has to be deleted for the receiver
     * @param removeOptions Additional options for removing the reply keyboard
     * @return The current instance of `Telegram` sender service
     */
    global TelegramBotSenderService withReplyKeyboardRemoved(TelegramReplyKeyboardRemoveOptions removeOptions) {
        this.replyMarkup = removeOptions;
        return this;
    }

    /**
     * @description Sets an inline keyboard for the message that will be shown next to the message
     * @param keyboard The instance of <<TelegramInlineKeyboardMarkupOptions>> class, custom inline keyboard to be shown
     * @return The current instance of `Telegram` sender service
     */
    global TelegramBotSenderService withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        this.replyMarkup = keyboard;
        return this;
    }

    /**
     * @description Will force `Telegram` client to display a reply interface to the user to the current bot's message
     * @return The current instance of `Telegram` sender service
     */
    global TelegramBotSenderService withForceReply() {
        return withForceReply(new TelegramForceReplyOptions());
    }

    /**
     * @description Will force `Telegram` client to display a reply interface to the user to the current bot's message
     * @param forceReplyOptions The instance of <<TelegramForceReplyOptions>> class with additional reply options
     * @return The current instance of `Telegram` sender service
     */
    global TelegramBotSenderService withForceReply(TelegramForceReplyOptions forceReplyOptions) {
        this.replyMarkup = forceReplyOptions;
        return this;
    }

    private void send(TelegramBotMethod method, BotJsonPayload payload, BotJsonPayload callbackParams) {
        if (replyMarkup != null) {
            payload.set('reply_markup', replyMarkup);
        }

        BotJsonPayload response = calloutService.call(method, payload);
        TelegramMessage message = new TelegramMessage(response.getJsonPayload('result'));

        if (callbackParams != null) {
            callback.execute(callbackParams.set('messageId', message.getId()).set('keyboard', replyMarkup, true));
        }
    }
}
