@IsTest(isParallel = true)
private class TelegramBotHandlerTest {
    private static final BotType BOT_TYPE = BotType.Telegram;

    @TestSetup
    private static void init() {
        BotSettingsProvider.mock();
    }

    @IsTest
    private static void onMessageReceived_shouldPopulateMessageEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.Message);
        Assert.isInstanceOfType(event, TelegramMessageEvent.class);
        assertMessageEvent((TelegramMessageEvent) event);
    }

    @IsTest
    private static void onMessageEdited_shouldPopulateMessageEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.EditedMessage);
        Assert.isInstanceOfType(event, TelegramMessageEvent.class);
        assertMessageEvent((TelegramMessageEvent) event);
    }

    @IsTest
    private static void onChannelPostReceived_shouldPopulateMessageEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.ChannelPost);
        Assert.isInstanceOfType(event, TelegramMessageEvent.class);
        assertMessageEvent((TelegramMessageEvent) event);
    }

    @IsTest
    private static void onChannelPostEdited_shouldPopulateMessageEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.EditedChannelPost);
        Assert.isInstanceOfType(event, TelegramMessageEvent.class);
        assertMessageEvent((TelegramMessageEvent) event);
    }

    @IsTest
    private static void onInlineQuery_shouldPopulateInlineQueryEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.InlineQuery);
        Assert.isInstanceOfType(event, TelegramInlineQueryEvent.class);
        assertInlineQueryEvent((TelegramInlineQueryEvent) event);
    }

    @IsTest
    private static void onChosenInlineResult_shouldPopulateChosenInlineResultEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.ChosenInlineResult);
        Assert.isInstanceOfType(event, TelegramChosenInlineResultEvent.class);
        assertChosenInlineResultEvent((TelegramChosenInlineResultEvent) event);
    }

    @IsTest
    private static void onCallbackQuery_shouldPopulateCallbackQueryEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.CallbackQuery);
        Assert.isInstanceOfType(event, TelegramCallbackQueryEvent.class);
        assertCallbackQueryEvent((TelegramCallbackQueryEvent) event);
    }

    @IsTest
    private static void onPollUpdated_shouldPopulatePollEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.Poll);
        Assert.isInstanceOfType(event, TelegramPollEvent.class);
        assertPollUpdatedEvent((TelegramPollEvent) event);
    }

    @IsTest
    private static void onPollAnswer_shouldPopulatePollAnswerEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.PollAnswer);
        Assert.isInstanceOfType(event, TelegramPollAnswerEvent.class);
        assertPollAnswerEvent((TelegramPollAnswerEvent) event);
    }

    @IsTest
    private static void onMyChatMemberUpdated_shouldPopulateChatMemberEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.MyChatMember);
        Assert.isInstanceOfType(event, TelegramChatMemberUpdatedEvent.class);
        assertChatMemberUpdatedEvent((TelegramChatMemberUpdatedEvent) event);
    }

    @IsTest
    private static void onChatMemberUpdated_shouldPopulateChatMemberEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.ChatMember);
        Assert.isInstanceOfType(event, TelegramChatMemberUpdatedEvent.class);
        assertChatMemberUpdatedEvent((TelegramChatMemberUpdatedEvent) event);
    }

    @IsTest
    private static void onChatJoinRequest_shouldPopulateChatJoinRequestEventFields() {
        BotPayload event = runTest(TelegramUpdateEventType.ChatJoinRequest);
        Assert.isInstanceOfType(event, TelegramChatJoinRequestEvent.class);
        assertChatJoinRequestEvent((TelegramChatJoinRequestEvent) event);
    }

    private static BotPayload runTest(TelegramUpdateEventType eventType) {
        Test.setMock(HttpCalloutMock.class, new TelegramBotCalloutMock());

        BotModel bot = createBot();
        Test.startTest();
        EventBus.publish(new BotUpdateEvent__e(Bot__c = bot.toJson(), Payload__c = createPayload(eventType).toJson()));
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.isNotNull(TelegramBotHandlerMock.lastEvent);
        return TelegramBotHandlerMock.lastEvent;
    }

    private static BotModel createBot() {
        insert new Bot__c(
            Name = 'Test Bot',
            Type__c = BOT_TYPE.name(),
            WebhookEvents__c = 'message',
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'TelegramBotHandlerMock'
        );
        return new BotModel(
            [
                SELECT Name, Type__c, WebhookEvents__c, Handler__c, TokenHash__c
                FROM Bot__c
                WHERE Type__c = :BOT_TYPE.name()
                LIMIT 1
            ]
        );
    }

    private static BotJsonPayload createPayload(TelegramUpdateEventType eventType) {
        BotJsonPayload eventPayload = new BotJsonPayload();
        if (TelegramUpdateEventType.isMessageEventType(eventType)) {
            eventPayload = createMessagePayload();
        } else if (eventType == TelegramUpdateEventType.InlineQuery) {
            eventPayload = createInlineQueryPayload();
        } else if (eventType == TelegramUpdateEventType.ChosenInlineResult) {
            eventPayload = createChosenInlineResultPayload();
        } else if (eventType == TelegramUpdateEventType.CallbackQuery) {
            eventPayload = createCallbackQueryPayload();
        } else if (eventType == TelegramUpdateEventType.Poll) {
            eventPayload = createPollPayload();
        } else if (eventType == TelegramUpdateEventType.PollAnswer) {
            eventPayload = createPollAnswerPayload();
        } else if (
            eventType == TelegramUpdateEventType.MyChatMember ||
            eventType == TelegramUpdateEventType.ChatMember
        ) {
            eventPayload = createChatMemberPayload();
        } else if (eventType == TelegramUpdateEventType.ChatJoinRequest) {
            eventPayload = createChatJoinRequestPayload();
        }
        return new BotJsonPayload().set('update_id', 12312311L).set(eventType.name(), eventPayload);
    }

    private static BotJsonPayload createMessagePayload() {
        return new BotJsonPayload()
            .set('message_id', 223123123L)
            .set(
                'from',
                new BotJsonPayload()
                    .set('id', 876541222L)
                    .set('first_name', null)
                    .set('last_name', 'matsuev')
                    .set('username', 'ilyamatsuev')
            )
            .set('date', DateTime.newInstance(2022, 1, 1).getTime())
            .set(
                'chat',
                new BotJsonPayload()
                    .set('id', 876541222L)
                    .set('type', 'private')
                    .set('title', 'Awesome chat')
                    .set('first_name', null)
                    .set('last_name', 'matsuev')
                    .set('username', 'ilyamatsuev')
                    .set('description', null)
            )
            .set(
                'new_chat_members',
                new List<Object> {
                    new BotJsonPayload()
                        .set('id', 876541222L)
                        .set('first_name', null)
                        .set('last_name', 'matsuev')
                        .set('username', 'ilyamatsuev')
                }
            )
            .set(
                'new_chat_photo',
                new List<Object> {
                    new BotJsonPayload()
                        .set('file_id', 'some_file_id')
                        .set('file_unique_id', 'some_unique_file_id')
                        .set('width', 200)
                        .set('height', 400)
                        .set('file_size', 40055)
                }
            )
            .set(
                'entities',
                new List<Object> {
                    new BotJsonPayload()
                        .set('type', 'url')
                        .set('url', 'http://example.com')
                        .set('offset', 0)
                        .set('length', 4)
                }
            )
            .set(
                'caption_entities',
                new List<Object> { new BotJsonPayload().set('type', 'mention').set('offset', 0).set('length', 4) }
            )
            .set(
                'photo',
                new List<Object> {
                    new BotJsonPayload()
                        .set('file_id', 'some_file_id')
                        .set('file_unique_id', 'some_unique_file_id')
                        .set('width', 200)
                        .set('height', 400)
                        .set('file_size', 40055)
                }
            )
            .set(
                'reply_markup',
                new BotJsonPayload()
                    .set(
                        'inline_keyboard',
                        new List<Object> {
                            new List<Object> {
                                new BotJsonPayload()
                                    .set('text', 'Button')
                                    .set('url', 'http://example.com')
                                    .set('callback_data', 'data')
                            }
                        }
                    )
            )
            .set('text', 'Hello world!');
    }

    private static BotJsonPayload createInlineQueryPayload() {
        return new BotJsonPayload()
            .set('id', 'some_query_id')
            .set(
                'from',
                new BotJsonPayload()
                    .set('id', 876541222L)
                    .set('first_name', null)
                    .set('last_name', 'matsuev')
                    .set('username', 'ilyamatsuev')
            )
            .set('query', 'abra bla bla')
            .set('chat_type', 'private');
    }

    private static BotJsonPayload createChosenInlineResultPayload() {
        return new BotJsonPayload()
            .set('result_id', 'some_result_id')
            .set(
                'from',
                new BotJsonPayload()
                    .set('id', 876541222L)
                    .set('first_name', null)
                    .set('last_name', 'matsuev')
                    .set('username', 'ilyamatsuev')
            )
            .set('inline_message_id', 'some_id')
            .set('query', 'abra bla bla');
    }

    private static BotJsonPayload createCallbackQueryPayload() {
        return new BotJsonPayload()
            .set('id', 'some_id')
            .set(
                'from',
                new BotJsonPayload()
                    .set('id', 876541222L)
                    .set('first_name', null)
                    .set('last_name', 'matsuev')
                    .set('username', 'ilyamatsuev')
            )
            .set('inline_message_id', 'some_id')
            .set('chat_instance', 'some_chat_instance')
            .set('data', 'abra bla bla');
    }

    private static BotJsonPayload createPollPayload() {
        return new BotJsonPayload()
            .set('id', 'some_id')
            .set('question', 'How is the weather?')
            .set(
                'options',
                new List<Object> {
                    new BotJsonPayload().set('text', 'Good').set('voter_count', 2),
                    new BotJsonPayload().set('text', 'Bad').set('voter_count', 0)
                }
            )
            .set('total_voter_count', 2)
            .set('is_closed', false)
            .set('is_anonymous', false)
            .set('type', 'quiz')
            .set('correct_option_id', 0)
            .set('explanation', 'Explanation!')
            .set(
                'explanation_entities',
                new List<Object> {
                    new BotJsonPayload()
                        .set('type', 'mention')
                        .set(
                            'user',
                            new BotJsonPayload()
                                .set('id', 876541222L)
                                .set('first_name', null)
                                .set('last_name', 'matsuev')
                                .set('username', 'ilyamatsuev')
                        )
                        .set('offset', 0)
                        .set('length', 1)
                }
            )
            .set('open_period', 1000000);
    }

    private static BotJsonPayload createPollAnswerPayload() {
        return new BotJsonPayload().set('poll_id', 'some_id').set('option_ids', new List<Object> { 0, 2 });
    }

    private static BotJsonPayload createChatMemberPayload() {
        return new BotJsonPayload()
            .set(
                'old_chat_member',
                new BotJsonPayload()
                    .set('status', 'administrator')
                    .set(
                        'user',
                        new BotJsonPayload()
                            .set('id', 876541222L)
                            .set('first_name', null)
                            .set('last_name', 'matsuev')
                            .set('username', 'ilyamatsuev')
                    )
                    .set('custom_title', 'Cool guy')
                    .set('is_anonymous', false)
            )
            .set(
                'new_chat_member',
                new BotJsonPayload()
                    .set('status', 'restricted')
                    .set(
                        'user',
                        new BotJsonPayload()
                            .set('id', 876541222L)
                            .set('first_name', null)
                            .set('last_name', 'matsuev')
                            .set('username', 'ilyamatsuev')
                    )
            )
            .set(
                'invite_link',
                new BotJsonPayload()
                    .set('invite_link', 'tg://invite-link')
                    .set('name', 'Invite!')
                    .set('creates_join_request', false)
                    .set('is_primary', false)
                    .set('is_revoked', false)
            )
            .set('via_chat_folder_invite_link', false);
    }

    private static BotJsonPayload createChatJoinRequestPayload() {
        return new BotJsonPayload()
            .set('user_chat_id', 876541222)
            .set('bio', 'Some bio')
            .set(
                'from',
                new BotJsonPayload()
                    .set('id', 876541222L)
                    .set('first_name', null)
                    .set('last_name', 'matsuev')
                    .set('username', 'ilyamatsuev')
            )
            .set(
                'invite_link',
                new BotJsonPayload()
                    .set('invite_link', 'tg://invite-link')
                    .set('name', 'Invite!')
                    .set('creates_join_request', false)
                    .set('is_primary', false)
                    .set('is_revoked', false)
            );
    }

    private static void assertMessageEvent(TelegramMessage message) {
        // There is no other way to get the code coverage for all entities that I have.
        // Serializing to JSON is not possible because of Infinite references (e.g. `TelegramMessage` has instance of `TelegramMessage`)
        Assert.areEqual(223123123, message.messageId);
        Assert.areEqual(Date.newInstance(2022, 1, 1), message.sendDate.date());
        Assert.isNull(message.messageThreadId);
        Assert.isNull(message.forwardFromMessageId);
        Assert.isNull(message.forwardSignature);
        Assert.isNull(message.forwardSenderName);
        Assert.isNull(message.forwardSendDate);
        Assert.isNull(message.isTopicMessage);
        Assert.isNull(message.isAutomaticForward);
        Assert.isNull(message.editDate);
        Assert.isNull(message.hasProtectedContent);
        Assert.isNull(message.mediaGroupId);
        Assert.isNull(message.authorSignature);
        Assert.isNull(message.caption);
        Assert.isNull(message.hasMediaSpoiler);
        Assert.isNull(message.newChatTitle);
        Assert.isNotNull(message.senderChat);
        Assert.isNotNull(message.forwardFrom);
        Assert.isNotNull(message.forwardFromChat);
        Assert.isNotNull(message.replyToMessage);
        Assert.isNotNull(message.viaBot);
        Assert.isNotNull(message.leftChatMember);
        Assert.isNotNull(message.pinnedMessage);
        Assert.isNotNull(message.captionEntities);
        Assert.isNotNull(message.newChatMembers);
        Assert.isNotNull(message.newChatPhoto);
        assertUser(message.sender);
        assertChat(message.chat);
        assertAnimation(message.animation);
        assertAudio(message.audio);
        assertDocument(message.document);
        assertPhoto(message.photo);
        assertSticker(message.sticker);
        assertVideo(message.video);
        assertVideoNote(message.videoNote);
        assertVoice(message.voice);
        assertContact(message.contact);
        assertDice(message.dice);
        assertPoll(message.poll);
        assertVenue(message.venue);
        assertLocation(message.location);
        assertInlineKeyboard(message.replyMarkup);
        assertMessageEntities(message.entities);
    }

    private static void assertInlineQueryEvent(TelegramInlineQueryEvent inlineQuery) {
        Assert.areEqual('some_query_id', inlineQuery.id);
        Assert.areEqual('abra bla bla', inlineQuery.query);
        Assert.areEqual('private', inlineQuery.chatType);
        Assert.isNull(inlineQuery.offset);
        Assert.isNotNull(inlineQuery.sender);
        Assert.isNotNull(inlineQuery.location);
    }

    private static void assertChosenInlineResultEvent(TelegramChosenInlineResultEvent chosenInlineResult) {
        Assert.areEqual('some_result_id', chosenInlineResult.resultId);
        Assert.areEqual('some_id', chosenInlineResult.inlineMessageId);
        Assert.areEqual('abra bla bla', chosenInlineResult.query);
        Assert.isNotNull(chosenInlineResult.sender);
        Assert.isNotNull(chosenInlineResult.location);
    }

    private static void assertCallbackQueryEvent(TelegramCallbackQueryEvent callbackQuery) {
        Assert.areEqual('some_id', callbackQuery.id);
        Assert.areEqual('some_id', callbackQuery.inlineMessageId);
        Assert.areEqual('some_chat_instance', callbackQuery.chatInstance);
        Assert.areEqual('abra bla bla', callbackQuery.data);
        Assert.isNotNull(callbackQuery.sender);
        Assert.isNotNull(callbackQuery.message);
    }

    private static void assertPollUpdatedEvent(TelegramPollEvent poll) {
        Assert.areEqual('some_id', poll.id);
        Assert.areEqual('How is the weather?', poll.question);
        Assert.areEqual(2, poll.totalVoterCount);
        Assert.isFalse(poll.isClosed);
        Assert.isFalse(poll.isAnonymous);
        Assert.areEqual('quiz', poll.type);
        Assert.areEqual(0, poll.correctOptionId);
        Assert.areEqual(1000000, poll.openPeriod);
        Assert.areEqual('Explanation!', poll.explanation);
        Assert.areEqual(1, poll.explanationEntities.size());
        Assert.isNull(poll.allowsMultipleAnswers);
        Assert.isNull(poll.closeDate);

        List<TelegramPoll.Option> options = poll.options;
        Assert.areEqual(2, options.size());
        Assert.areEqual('Good', options.get(0).text);
        Assert.areEqual(2, options.get(0).voterCount);
    }

    private static void assertPollAnswerEvent(TelegramPollAnswerEvent answer) {
        Assert.areEqual('some_id', answer.pollId);
        Assert.areEqual(new List<Integer> { 0, 2 }, answer.optionIds);
        Assert.isNotNull(answer.voterChat);
        Assert.isNotNull(answer.user);
    }

    private static void assertChatMemberUpdatedEvent(TelegramChatMemberUpdatedEvent chatMember) {
        Assert.isNull(chatMember.changeDate);
        Assert.isFalse(chatMember.viaChatFolderInviteLink);
        Assert.isNotNull(chatMember.chat);
        Assert.isNotNull(chatMember.sender);

        TelegramChatMemberUpdatedEvent.Member oldMember = chatMember.oldChatMember;
        Assert.isInstanceOfType(oldMember, TelegramChatMemberUpdatedEvent.AdministratorMember.class);
        TelegramChatMemberUpdatedEvent.AdministratorMember oldMemberAdmin = (TelegramChatMemberUpdatedEvent.AdministratorMember) oldMember;
        Assert.areEqual('administrator', oldMemberAdmin.status);
        Assert.areEqual('Cool guy', oldMemberAdmin.customTitle);
        Assert.isFalse(oldMemberAdmin.isAnonymous);
        Assert.isNotNull(oldMemberAdmin.user);
        Assert.isNull(oldMemberAdmin.canBeEdited);
        Assert.isNull(oldMemberAdmin.canManageChat);
        Assert.isNull(oldMemberAdmin.canDeleteMessages);
        Assert.isNull(oldMemberAdmin.canManageVideoChats);
        Assert.isNull(oldMemberAdmin.canRestrictMembers);
        Assert.isNull(oldMemberAdmin.canPromoteMembers);
        Assert.isNull(oldMemberAdmin.canChangeInfo);
        Assert.isNull(oldMemberAdmin.canInviteUsers);
        Assert.isNull(oldMemberAdmin.canPostMessages);
        Assert.isNull(oldMemberAdmin.canEditMessages);
        Assert.isNull(oldMemberAdmin.canPinMessages);
        Assert.isNull(oldMemberAdmin.canManageTopics);

        TelegramChatMemberUpdatedEvent.Member newMember = chatMember.newChatMember;
        Assert.isInstanceOfType(newMember, TelegramChatMemberUpdatedEvent.RestrictedMember.class);
        TelegramChatMemberUpdatedEvent.RestrictedMember newMemberRestricted = (TelegramChatMemberUpdatedEvent.RestrictedMember) newMember;
        Assert.areEqual('restricted', newMemberRestricted.status);
        Assert.isNotNull(newMemberRestricted.user);
        Assert.isNull(newMemberRestricted.isMember);
        Assert.isNull(newMemberRestricted.canSendMessages);
        Assert.isNull(newMemberRestricted.canSendAudios);
        Assert.isNull(newMemberRestricted.canSendDocuments);
        Assert.isNull(newMemberRestricted.canSendPhotos);
        Assert.isNull(newMemberRestricted.canSendVideos);
        Assert.isNull(newMemberRestricted.canSendVideoNotes);
        Assert.isNull(newMemberRestricted.canSendVoiceNotes);
        Assert.isNull(newMemberRestricted.canSendPolls);
        Assert.isNull(newMemberRestricted.canSendOtherMessages);
        Assert.isNull(newMemberRestricted.canAddWebPagePreviews);
        Assert.isNull(newMemberRestricted.canChangeInfo);
        Assert.isNull(newMemberRestricted.canInviteUsers);
        Assert.isNull(newMemberRestricted.canPinMessages);
        Assert.isNull(newMemberRestricted.canManageTopics);
        Assert.isNull(newMemberRestricted.untilDate);

        TelegramChatInviteLink inviteLink = chatMember.inviteLink;
        Assert.areEqual('tg://invite-link', inviteLink.inviteLink);
        Assert.areEqual('Invite!', inviteLink.name);
        Assert.isFalse(inviteLink.createsJoinRequest);
        Assert.isFalse(inviteLink.isPrimary);
        Assert.isFalse(inviteLink.isRevoked);
        Assert.isNull(inviteLink.expireDate);
        Assert.isNull(inviteLink.memberLimit);
        Assert.isNull(inviteLink.pendingJoinRequestCount);
        Assert.isNotNull(inviteLink.creator);
    }

    private static void assertChatJoinRequestEvent(TelegramChatJoinRequestEvent joinRequest) {
        Assert.areEqual(876541222, joinRequest.userChatId);
        Assert.areEqual('Some bio', joinRequest.bio);
        Assert.isNull(joinRequest.requestDate);
        Assert.isNotNull(joinRequest.chat);
        Assert.isNotNull(joinRequest.sender);
        Assert.isNotNull(joinRequest.inviteLink);
    }

    private static void assertUser(TelegramUser user) {
        Assert.areEqual(876541222, user.id);
        Assert.areEqual('matsuev', user.lastName);
        Assert.areEqual('ilyamatsuev', user.username);
        Assert.isNull(user.isBot);
        Assert.isNull(user.firstName);
        Assert.isNull(user.languageCode);
        Assert.isNull(user.isPremium);
        Assert.isNull(user.isAddedToAttachmentMenu);
        Assert.isNull(user.canJoinGroups);
        Assert.isNull(user.canReadAllGroupMessages);
        Assert.isNull(user.supportsInlineQueries);
    }

    private static void assertChat(TelegramChat chat) {
        Assert.areEqual(876541222, chat.id);
        Assert.areEqual('private', chat.type);
        Assert.areEqual('Awesome chat', chat.title);
        Assert.areEqual('matsuev', chat.lastName);
        Assert.areEqual('ilyamatsuev', chat.username);
        Assert.isNull(chat.firstName);
        Assert.isNull(chat.description);
        Assert.isNull(chat.isForum);
        Assert.isNull(chat.activeUsernames);
        Assert.isNull(chat.emojiStatusCustomEmojiId);
        Assert.isNull(chat.emojiStatusExpirationDate);
        Assert.isNull(chat.bio);
        Assert.isNull(chat.hasPrivateForwards);
        Assert.isNull(chat.hasRestrictedVoiceAndVideoMessages);
        Assert.isNull(chat.joinToSendMessages);
        Assert.isNull(chat.joinByRequest);
        Assert.isNull(chat.inviteLink);
        Assert.isNull(chat.slowModeDelay);
        Assert.isNull(chat.messageAutoDeleteTime);
        Assert.isNull(chat.hasAggressiveAntiSpamEnabled);
        Assert.isNull(chat.hasHiddenMembers);
        Assert.isNull(chat.hasProtectedContent);
        Assert.isNull(chat.stickerSetName);
        Assert.isNull(chat.canSetStickerSet);
        Assert.isNull(chat.linkedChatId);
        Assert.isNotNull(chat.pinnedMessage);
        Assert.isNotNull(chat.location);

        TelegramChatPermissions permissions = chat.permissions;
        Assert.isNull(permissions.canSendMessages);
        Assert.isNull(permissions.canSendAudios);
        Assert.isNull(permissions.canSendDocuments);
        Assert.isNull(permissions.canSendPhotos);
        Assert.isNull(permissions.canSendVideos);
        Assert.isNull(permissions.canSendVideoNotes);
        Assert.isNull(permissions.canSendVoiceNotes);
        Assert.isNull(permissions.canSendPolls);
        Assert.isNull(permissions.canSendOtherMessages);
        Assert.isNull(permissions.canAddWebPagePreviews);
        Assert.isNull(permissions.canChangeInfo);
        Assert.isNull(permissions.canInviteUsers);
        Assert.isNull(permissions.canPinMessages);
        Assert.isNull(permissions.canManageTopics);

        TelegramChat.Photo chatPhoto = chat.photo;
        Assert.isNull(chatPhoto.smallFileId);
        Assert.isNull(chatPhoto.smallFileUniqueId);
        Assert.isNull(chatPhoto.bigFileId);
        Assert.isNull(chatPhoto.bigFileUniqueId);

        TelegramChat.Location chatLocation = chat.location;
        Assert.isNotNull(chatLocation.location);
        Assert.isNull(chatLocation.address);
    }

    private static void assertAnimation(TelegramAnimation animation) {
        Assert.isNull(animation.fileId);
        Assert.isNull(animation.fileUniqueId);
        Assert.isNull(animation.width);
        Assert.isNull(animation.height);
        Assert.isNull(animation.duration);
        Assert.isNull(animation.fileName);
        Assert.isNull(animation.mimeType);
        Assert.isNull(animation.fileSize);
        Assert.isNotNull(animation.thumbnail);
    }

    private static void assertAudio(TelegramAudio audio) {
        Assert.isNull(audio.fileId);
        Assert.isNull(audio.fileUniqueId);
        Assert.isNull(audio.duration);
        Assert.isNull(audio.performer);
        Assert.isNull(audio.title);
        Assert.isNull(audio.fileName);
        Assert.isNull(audio.mimeType);
        Assert.isNull(audio.fileSize);
        Assert.isNotNull(audio.thumbnail);
    }

    private static void assertDocument(TelegramDocument document) {
        Assert.isNull(document.fileId);
        Assert.isNull(document.fileUniqueId);
        Assert.isNull(document.fileName);
        Assert.isNull(document.mimeType);
        Assert.isNull(document.fileSize);
        Assert.isNotNull(document.thumbnail);
    }

    private static void assertPhoto(List<TelegramPhotoSize> photoSizes) {
        TelegramPhotoSize photo = photoSizes.get(0);
        Assert.isNotNull(photo.fileId);
        Assert.isNotNull(photo.fileUniqueId);
        Assert.isNotNull(photo.width);
        Assert.isNotNull(photo.height);
        Assert.isNotNull(photo.fileSize);
    }

    private static void assertSticker(TelegramSticker sticker) {
        Assert.isNull(sticker.fileId);
        Assert.isNull(sticker.fileUniqueId);
        Assert.isNull(sticker.type);
        Assert.isNull(sticker.width);
        Assert.isNull(sticker.height);
        Assert.isNull(sticker.isAnimated);
        Assert.isNull(sticker.isVideo);
        Assert.isNull(sticker.emoji);
        Assert.isNull(sticker.setName);
        Assert.isNull(sticker.customEmojiId);
        Assert.isNull(sticker.needsRepainting);
        Assert.isNull(sticker.fileSize);
        Assert.isNotNull(sticker.thumbnail);
        Assert.isNotNull(sticker.premiumAnimation);
        Assert.isNotNull(sticker.maskPosition);
        TelegramFile stickerFile = sticker.premiumAnimation;
        Assert.isNull(stickerFile.fileId);
        Assert.isNull(stickerFile.fileUniqueId);
        Assert.isNull(stickerFile.fileSize);
        Assert.isNull(stickerFile.filePath);
        TelegramMaskPosition stickerMask = sticker.maskPosition;
        Assert.isNull(stickerMask.point);
        Assert.isNull(stickerMask.xShift);
        Assert.isNull(stickerMask.yShift);
        Assert.isNull(stickerMask.scale);
    }

    private static void assertVideo(TelegramVideo video) {
        Assert.isNull(video.fileId);
        Assert.isNull(video.fileUniqueId);
        Assert.isNull(video.width);
        Assert.isNull(video.height);
        Assert.isNull(video.duration);
        Assert.isNull(video.fileName);
        Assert.isNull(video.mimeType);
        Assert.isNull(video.fileSize);
        Assert.isNotNull(video.thumbnail);
    }

    private static void assertVideoNote(TelegramVideoNote videoNote) {
        Assert.isNull(videoNote.fileId);
        Assert.isNull(videoNote.fileUniqueId);
        Assert.isNull(videoNote.length);
        Assert.isNull(videoNote.duration);
        Assert.isNull(videoNote.fileSize);
        Assert.isNotNull(videoNote.thumbnail);
    }

    private static void assertVoice(TelegramVoice voice) {
        Assert.isNull(voice.fileId);
        Assert.isNull(voice.fileUniqueId);
        Assert.isNull(voice.duration);
        Assert.isNull(voice.mimeType);
        Assert.isNull(voice.fileSize);
    }

    private static void assertContact(TelegramContact contact) {
        Assert.isNull(contact.phoneNumber);
        Assert.isNull(contact.firstName);
        Assert.isNull(contact.lastName);
        Assert.isNull(contact.userId);
        Assert.isNull(contact.vCard);
    }

    private static void assertDice(TelegramDice dice) {
        Assert.isNull(dice.emoji);
        Assert.isNull(dice.value);
    }

    private static void assertPoll(TelegramPoll poll) {
        Assert.isNull(poll.id);
        Assert.isNull(poll.question);
        Assert.isNull(poll.totalVoterCount);
        Assert.isNull(poll.isClosed);
        Assert.isNull(poll.isAnonymous);
        Assert.isNull(poll.type);
        Assert.isNull(poll.allowsMultipleAnswers);
        Assert.isNull(poll.correctOptionId);
        Assert.isNull(poll.explanation);
        Assert.isNull(poll.openPeriod);
        Assert.isNull(poll.closeDate);
        Assert.isNotNull(poll.options);
        Assert.isNotNull(poll.explanationEntities);
    }

    private static void assertVenue(TelegramVenue venue) {
        Assert.isNull(venue.title);
        Assert.isNull(venue.address);
        Assert.isNull(venue.foursquareId);
        Assert.isNull(venue.foursquareType);
        Assert.isNull(venue.googlePlaceId);
        Assert.isNull(venue.googlePlaceType);
        Assert.isNotNull(venue.location);
    }

    private static void assertLocation(TelegramLocation location) {
        Assert.isNull(location.longitude);
        Assert.isNull(location.latitude);
        Assert.isNull(location.horizontalAccuracy);
        Assert.isNull(location.livePeriod);
        Assert.isNull(location.heading);
        Assert.isNull(location.proximityAlertRadius);
    }

    private static void assertInlineKeyboard(TelegramInlineKeyboardMarkupOptions inlineKeyboard) {
        TelegramInlineKeyboardMarkupOptions.Button button = inlineKeyboard.buttons.get(0).get(0);
        Assert.isNotNull(button.text);
        Assert.isNotNull(button.url);
        Assert.isNotNull(button.callbackData);
        Assert.isNull(button.switchInlineQuery);
        Assert.isNull(button.switchInlineQueryCurrentChat);

        TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs chatConfigs = button.switchInlineQueryChosenChat;
        Assert.isNull(chatConfigs.query);
        Assert.isNull(chatConfigs.allowBotChats);
        Assert.isNull(chatConfigs.allowChannelChats);
        Assert.isNull(chatConfigs.allowUserChats);
        Assert.isNull(chatConfigs.allowGroupChats);
        TelegramWebAppInfo webApp = button.webApp;
        Assert.isNull(webApp.url);
        TelegramInlineKeyboardMarkupOptions.LoginConfigs loginConfigs = button.loginUrl;
        Assert.isNull(loginConfigs.url);
        Assert.isNull(loginConfigs.botUsername);
        Assert.isNull(loginConfigs.forwardText);
        Assert.isNull(loginConfigs.requestWriteAccess);
    }

    private static void assertMessageEntities(List<TelegramMessageEntity> entities) {
        TelegramMessageEntity entity = entities.get(0);
        Assert.isNotNull(entity.type);
        Assert.isNotNull(entity.offset);
        Assert.isNotNull(entity.length);
        Assert.isNotNull(entity.url);
        Assert.isNotNull(entity.user);
        Assert.isNull(entity.language);
        Assert.isNull(entity.customEmojiId);
    }
}
