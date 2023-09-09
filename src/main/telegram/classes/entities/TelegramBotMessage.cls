/**
 * @description Describes the message payload received as an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#message
 */
global virtual class TelegramBotMessage extends BotPayload implements IBotMessage {
    /**
     * @description The unique message identifier inside this chat
     */
    global Integer messageId { get { return payload.getInteger('message_id'); } }

    /**
     * @description The unique identifier of a message thread to which the message belongs; for supergroups only
     */
    global Integer messageThreadId { get { return payload.getInteger('message_thread_id'); } }

    /**
     * @description The sender of the message; empty for messages sent to channels
     */
    global TelegramBotUser sender { get { return new TelegramBotUser(payload.getJsonPayload('from')); } }

    /**
     * @description The sender of the message, sent on behalf of a chat. For example, the channel itself for channel posts, the supergroup itself for messages from anonymous group administrators, the linked channel for messages automatically forwarded to the discussion group
     */
    global TelegramBotChat senderChat { get { return new TelegramBotChat(payload.getJsonPayload('sender_chat')); } }

    /**
     * @description The date the message was sent
     */
    global DateTime sendDate { get { return payload.getDateTime('date'); } }

    /**
     * @description The conversation the message belongs to
     */
    global TelegramBotChat chat { get { return new TelegramBotChat(payload.getJsonPayload('chat')); } }

    /**
     * @description For forwarded messages, sender of the original message
     */
    global TelegramBotUser forwardFrom { get { return new TelegramBotUser(payload.getJsonPayload('forward_from')); } }

    /**
     * @description For messages forwarded from channels or from anonymous administrators, information about the original sender chat
     */
    global TelegramBotChat forwardFromChat {
        get { return new TelegramBotChat(payload.getJsonPayload('forward_from_chat')); }
    }

    /**
     * @description For messages forwarded from channels, identifier of the original message in the channel
     */
    global Integer forwardFromMessageId { get { return payload.getInteger('forward_from_message_id'); } }

    /**
     * @description For messages forwarded from channels, identifier of the original message in the channel
     */
    global String forwardSignature { get { return payload.getString('forward_signature'); } }

    /**
     * @description The sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages
     */
    global String forwardSenderName { get { return payload.getString('forward_sender_name'); } }

    /**
     * @description For forwarded messages, date the original message was sent
     */
    global DateTime forwardSendDate { get { return payload.getDateTime('forward_date'); } }

    /**
     * @description `True` if the message is sent to a forum topic
     */
    global Boolean isTopicMessage { get { return payload.getBoolean('is_topic_message'); } }

    /**
     * @description `True` if the message is a channel post that was automatically forwarded to the connected discussion group
     */
    global Boolean isAutomaticForward { get { return payload.getBoolean('is_automatic_forward'); } }

    /**
     * @description For replies, the original message. Note that the <<TelegramBotMessage>> object in this field will not contain further reply_to_message fields even if it itself is a reply
     */
    global TelegramBotMessage replyToMessage {
        get { return new TelegramBotMessage(payload.getJsonPayload('reply_to_message')); }
    }

    /**
     * @description The bot through which the message was sent
     */
    global TelegramBotUser viaBot { get { return new TelegramBotUser(payload.getJsonPayload('via_bot')); } }

    /**
     * @description Date the message was last edited
     */
    global DateTime editDate { get { return payload.getDateTime('edit_date'); } }

    /**
     * @description `True` if the message can't be forwarded
     */
    global Boolean hasProtectedContent { get { return payload.getBoolean('has_protected_content'); } }

    /**
     * @description The unique identifier of a media message group this message belongs to
     */
    global String mediaGroupId { get { return payload.getString('media_group_id'); } }

    /**
     * @description The signature of the post author for messages in channels, or the custom title of an anonymous group administrator
     */
    global String authorSignature { get { return payload.getString('author_signature'); } }

    /**
     * @description For text messages, the actual UTF-8 text of the message
     */
    global String text { get { return payload.getString('text'); } }

    /**
     * @description For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
     */
    global List<TelegramBotMessageEntity> entities {
        get {
            List<TelegramBotMessageEntity> entityList = new List<TelegramBotMessageEntity>();
            List<BotJsonPayload> payloadList = payload.getJsonPayloadList('entities');
            if (payloadList != null) {
                for (BotJsonPayload payload : payloadList) {
                    entityList.add(new TelegramBotMessageEntity(payload));
                }
            }
            return entityList;
        }
    }

    /**
     * @description If the message is an animation, information about the animation
     */
    global TelegramBotAnimation animation {
        get { return new TelegramBotAnimation(payload.getJsonPayload('animation')); }
    }

    /**
     * @description If the message is an audio file, information about the file
     */
    global TelegramBotAudio audio { get { return new TelegramBotAudio(payload.getJsonPayload('audio')); } }

    /**
     * @description If the message is a general file, information about the file
     */
    global TelegramBotDocument document { get { return new TelegramBotDocument(payload.getJsonPayload('document')); } }

    /**
     * @description If the message is a photo, available sizes of the photo
     */
    global List<TelegramBotPhotoSize> photo {
        get {
            List<TelegramBotPhotoSize> photoSizes = new List<TelegramBotPhotoSize>();
            List<BotJsonPayload> payloadList = payload.getJsonPayloadList('photo');
            if (payloadList != null) {
                for (BotJsonPayload payload : payloadList) {
                    photoSizes.add(new TelegramBotPhotoSize(payload));
                }
            }
            return photoSizes;
        }
    }

    // TODO: Implement all commented out properties below

    /**
     * @description If the message is a sticker, information about the sticker
     */
    global TelegramBotSticker sticker { get { return new TelegramBotSticker(payload.getJsonPayload('sticker')); } }

    //    /**
    //     * @description If the message is a video, information about the video
    //     */
    //    global TelegramBotVideo video {
    //        get { return new TelegramBotVideo(payload.getJsonPayload('video')); }
    //    }

    //    /**
    //     * @description If the message is a video note, information about the video message
    //     */
    //    global TelegramBotVideoNote videoNote {
    //        get { return new TelegramBotVideoNote(payload.getJsonPayload('video_note')); }
    //    }

    //    /**
    //     * @description If the message is a voice message, information about the file
    //     */
    //    global TelegramBotVoice voice {
    //        get { return new TelegramBotVoice(payload.getJsonPayload('voice')); }
    //    }

    /**
     * @description The caption for the animation, audio, document, photo, video or voice
     */
    global String caption { get { return payload.getString('caption'); } }

    /**
     * @description For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption
     */
    global List<TelegramBotMessageEntity> captionEntities {
        get {
            List<TelegramBotMessageEntity> entityList = new List<TelegramBotMessageEntity>();
            List<BotJsonPayload> payloadList = payload.getJsonPayloadList('caption_entities');
            if (payloadList != null) {
                for (BotJsonPayload payload : payloadList) {
                    entityList.add(new TelegramBotMessageEntity(payload));
                }
            }
            return entityList;
        }
    }

    /**
     * @description `True` if the message media is covered by a spoiler animation
     */
    global Boolean hasMediaSpoiler { get { return payload.getBoolean('has_media_spoiler'); } }

    //    /**
    //     * @description If the message is a shared contact, information about the contact
    //     */
    //    global TelegramBotContact contact {
    //        get { return new TelegramBotContact(payload.getJsonPayload('contact')); }
    //    }

    //    /**
    //     * @description If the message is a dice with random value
    //     */
    //    global TelegramBotDice dice {
    //        get { return new TelegramBotDice(payload.getJsonPayload('dice')); }
    //    }

    //    /**
    //     * @description If the message is a native poll, information about the poll
    //     */
    //    global TelegramBotPoll poll {
    //        get { return new TelegramBotPoll(payload.getJsonPayload('poll')); }
    //    }

    //    /**
    //     * @description If the message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set
    //     */
    //    global TelegramBotVenue venue {
    //        get { return new TelegramBotVenue(payload.getJsonPayload('venue')); }
    //    }

    /**
     * @description If the message is a shared location, information about the location
     */
    global TelegramBotLocation location { get { return new TelegramBotLocation(payload.getJsonPayload('location')); } }

    /**
     * @description New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
     */
    global List<TelegramBotUser> newChatMembers {
        get {
            List<TelegramBotUser> members = new List<TelegramBotUser>();
            List<BotJsonPayload> payloadList = payload.getJsonPayloadList('new_chat_members');
            if (payloadList != null) {
                for (BotJsonPayload payload : payloadList) {
                    members.add(new TelegramBotUser(payload));
                }
            }
            return members;
        }
    }

    /**
     * @description A member was removed from the group, information about them (this member may be the bot itself)
     */
    global TelegramBotUser leftChatMember {
        get { return new TelegramBotUser(payload.getJsonPayload('left_chat_member')); }
    }

    /**
     * @description A chat title was changed to this value
     */
    global String newChatTitle { get { return payload.getString('new_chat_title'); } }

    /**
     * @description A chat photo was change to this value
     */
    global List<TelegramBotPhotoSize> newChatPhoto {
        get {
            List<TelegramBotPhotoSize> photoSizes = new List<TelegramBotPhotoSize>();
            List<BotJsonPayload> payloadList = payload.getJsonPayloadList('new_chat_photo');
            if (payloadList != null) {
                for (BotJsonPayload payload : payloadList) {
                    photoSizes.add(new TelegramBotPhotoSize(payload));
                }
            }
            return photoSizes;
        }
    }

    /**
     * @description The specified message was pinned
     */
    global TelegramBotMessage pinnedMessage {
        get { return new TelegramBotMessage(payload.getJsonPayload('pinned_message')); }
    }

    //    /**
    //     * @description The inline keyboard attached to the message
    //     */
    //    global TelegramBotInlineKeyboardMarkup replyMarkup {
    //        get { return new TelegramBotInlineKeyboardMarkup(payload.getJsonPayload('reply_markup')); }
    //    }

    public TelegramBotMessage(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Returns the `Telegram` message id as a `String`
     * @return The `Telegram` message id
     */
    global String getId() {
        return String.valueOf(messageId);
    }

    /**
     * @description Returns the message type
     * @return The instance of the <<BotMessageType>> enum
     */
    global BotMessageType getType() {
        if (payload.has('text')) {
            return BotUtils.isUrl(text) ? BotMessageType.Url : BotMessageType.Text;
        } else if (payload.has('photo')) {
            return BotMessageType.Image;
        } else if (payload.has('video') || payload.has('video_note')) {
            return BotMessageType.Video;
        } else if (payload.has('animation')) {
            return BotMessageType.Animation;
        } else if (payload.has('audio') || payload.has('voice')) {
            return BotMessageType.Audio;
        } else if (payload.has('document')) {
            return BotMessageType.File;
        } else if (payload.has('contact')) {
            return BotMessageType.Contact;
        } else if (payload.has('sticker')) {
            return BotMessageType.Sticker;
        } else if (payload.has('location')) {
            return BotMessageType.Location;
        } else if (payload.has('venue')) {
            return BotMessageType.Venue;
        } else if (payload.has('poll')) {
            return BotMessageType.Poll;
        }
        return BotMessageType.Other;
    }

    /**
     * @description Returns the message text
     * @return The message text
     */
    global String getText() {
        return text;
    }

    /**
     * @description Returns the media URL if it was attached to the message
     * @return The message media URL
     */
    global String getMediaUrl() {
        for (TelegramBotMessageEntity entity : entities) {
            if (entity.type == 'url') {
                return entity.url;
            }
        }
        return null;
    }

    /**
     * @description Returns the message send date
     * @return The message send date
     */
    global DateTime getSendDate() {
        return sendDate;
    }

    /**
     * @description Returns the additional message parameters
     * @return The instance of the <<BotJsonPayload>> class
     */
    global BotJsonPayload getParameters() {
        if (payload.has('photo')) {
            return payload.getJsonPayload('photo');
        } else if (payload.has('video')) {
            return payload.getJsonPayload('video');
        } else if (payload.has('video_note')) {
            return payload.getJsonPayload('video_note');
        } else if (payload.has('animation')) {
            return payload.getJsonPayload('animation');
        } else if (payload.has('audio')) {
            return payload.getJsonPayload('audio');
        } else if (payload.has('voice')) {
            return payload.getJsonPayload('voice');
        } else if (payload.has('document')) {
            return payload.getJsonPayload('document');
        } else if (payload.has('contact')) {
            return payload.getJsonPayload('contact');
        } else if (payload.has('sticker')) {
            return payload.getJsonPayload('sticker');
        } else if (payload.has('location')) {
            return payload.getJsonPayload('location');
        } else if (payload.has('venue')) {
            return payload.getJsonPayload('venue');
        } else if (payload.has('poll')) {
            return payload.getJsonPayload('poll');
        }
        return new BotJsonPayload();
    }
}
