# Type Definitions

## Classes

### [BotContext](/types/Classes/BotContext.md)

Represents the context with all necessary variables and entities for properly handling the incoming updates for bot

### [BotJsonPayload](/types/Classes/BotJsonPayload.md)

Provides a convenient interface on top of the JSON payload via such methods as `getString()`, `getInteger()`, `toJson()`, etc.

### [BotModel](/types/Classes/BotModel.md)

The `Bot__c` sObject model

### [BotReplyKeyboardButton](/types/Classes/BotReplyKeyboardButton.md)

The builder-like class for building custom keyboard buttons, used as reply by the user

### [BotService](/types/Classes/BotService.md)

The base class that contains features common for all bots

### [BotServiceFactory](/types/Classes/BotServiceFactory.md)

Factory for creating bot services

### [IBotChat](/types/Classes/IBotChat.md)

Describes the chat payload received as an update from a bot

### [IBotContext](/types/Classes/IBotContext.md)

Describes the context methods that are common for all bot types

### [IBotMessage](/types/Classes/IBotMessage.md)

Describes the message payload received as an update from a bot

### [IBotUpdateEvent](/types/Classes/IBotUpdateEvent.md)

Describes the payload received as an update from a bot

### [IBotUser](/types/Classes/IBotUser.md)

Describes the sender payload received as an update from a bot

### [TelegramAnimation](/types/Classes/TelegramAnimation.md)

Describes the animation payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#animation

### [TelegramAnswerInlineQueryOptions](/types/Classes/TelegramAnswerInlineQueryOptions.md)

Represents the optional parameters for inline mode `answer` method.
Source: https://core.telegram.org/bots/api#inlinequeryresult

### [TelegramAudio](/types/Classes/TelegramAudio.md)

Describes the audio payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#audio

### [TelegramBotChatInviteLinkService](/types/Classes/TelegramBotChatInviteLinkService.md)

Service class that provides access to all `Telegram` `chatInviteLink` methods

### [TelegramBotChatJoinRequestService](/types/Classes/TelegramBotChatJoinRequestService.md)

Service class that provides access to all `Telegram` `chatJoinRequest` methods

### [TelegramBotChatMemberService](/types/Classes/TelegramBotChatMemberService.md)

Service class that provides access to all `Telegram` `chatMember` methods

### [TelegramBotChatService](/types/Classes/TelegramBotChatService.md)

### [TelegramBotContext](/types/Classes/TelegramBotContext.md)

Represents the context with variables and methods for handling the incoming updates for `Telegram` bots

### [TelegramBotEditorService](/types/Classes/TelegramBotEditorService.md)

Service class that provides access to all `Telegram` `edit` methods

### [TelegramBotHandler](/types/Classes/TelegramBotHandler.md)

The class designed for handling webhook events specifically for `Telegram` bots

### [TelegramBotInlineQueryService](/types/Classes/TelegramBotInlineQueryService.md)

Service class that provides access to all `Telegram` `inline` mode methods

### [TelegramBotMeService](/types/Classes/TelegramBotMeService.md)

Service class that provides access to all `Telegram` `me` and `my` methods

### [TelegramBotSenderService](/types/Classes/TelegramBotSenderService.md)

Service class that provides access to all `Telegram` `send` methods

### [TelegramBotService](/types/Classes/TelegramBotService.md)

The concrete service for the `Telegram` messenger bots. Extends [BotService](/types/Classes/BotService.md) but also contains features related to `Telegram` only

### [TelegramBotStickerService](/types/Classes/TelegramBotStickerService.md)

Service class that provides access to all `Telegram` `sticker` methods

### [TelegramBotStickerSetService](/types/Classes/TelegramBotStickerSetService.md)

Service class that provides access to all `Telegram` `sticker` methods

### [TelegramCallbackQueryEvent](/types/Classes/TelegramCallbackQueryEvent.md)

Describes the common payload properties for the `Telegram` bot callback query events.
Source: https://core.telegram.org/bots/api#callbackquery

### [TelegramChat](/types/Classes/TelegramChat.md)

Describes the chat payload received as an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#chat

### [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md)

Describes the default administrator chat permissions payload for a `Telegram` bot.
Source: https://core.telegram.org/bots/api#chatadministratorrights

### [TelegramChatInviteLink](/types/Classes/TelegramChatInviteLink.md)

Describes the chat invite link payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#chatinvitelink

### [TelegramChatJoinRequestEvent](/types/Classes/TelegramChatJoinRequestEvent.md)

Describes the common payload properties for the `Telegram` bot chat join request events.
Source: https://core.telegram.org/bots/api#chatjoinrequest

### [TelegramChatMember](/types/Classes/TelegramChatMember.md)

Describes the information about a basic `Telegram` chat member.
Source: https://core.telegram.org/bots/api#chatmembermember

### [TelegramChatMemberAdmin](/types/Classes/TelegramChatMemberAdmin.md)

Describes the information about an administrator `Telegram` chat member.
Source: https://core.telegram.org/bots/api#chatmemberadministrator

### [TelegramChatMemberBanned](/types/Classes/TelegramChatMemberBanned.md)

Describes the information about a banned `Telegram` chat member.
Source: https://core.telegram.org/bots/api#chatmemberbanned

### [TelegramChatMemberLeft](/types/Classes/TelegramChatMemberLeft.md)

Describes the information about a left `Telegram` chat member.
Source: https://core.telegram.org/bots/api#chatmemberleft

### [TelegramChatMemberOwner](/types/Classes/TelegramChatMemberOwner.md)

Describes the information about an owner `Telegram` chat member.
Source: https://core.telegram.org/bots/api#chatmemberowner

### [TelegramChatMemberRestricted](/types/Classes/TelegramChatMemberRestricted.md)

Describes the information about a restricted `Telegram` chat member.
Source: https://core.telegram.org/bots/api#chatmemberrestricted

### [TelegramChatMemberUpdatedEvent](/types/Classes/TelegramChatMemberUpdatedEvent.md)

Describes the common payload properties for the `Telegram` bot chat member updated events.
Source: https://core.telegram.org/bots/api#chatmemberupdated

### [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md)

Describes the chat permissions payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#chatpermissions

### [TelegramChosenInlineResultEvent](/types/Classes/TelegramChosenInlineResultEvent.md)

Describes the common payload properties for the `Telegram` bot chosen inline result events.
Source: https://core.telegram.org/bots/api#choseninlineresult

### [TelegramContact](/types/Classes/TelegramContact.md)

Describes the contact payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#contact

### [TelegramCopyOptions](/types/Classes/TelegramCopyOptions.md)

Represents the optional parameters for the `Telegram` `copy` method.
Source: https://core.telegram.org/bots/api#copymessage

### [TelegramDice](/types/Classes/TelegramDice.md)

Describes the dice payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#dice

### [TelegramDocument](/types/Classes/TelegramDocument.md)

Describes the general file payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#document

### [TelegramEditCaptionOptions](/types/Classes/TelegramEditCaptionOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `editMessageCaption` method.
Source: https://core.telegram.org/bots/api#editmessagecaption

### [TelegramEditLiveLocationOptions](/types/Classes/TelegramEditLiveLocationOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `editMessageLiveLocation` method.
Source: https://core.telegram.org/bots/api#editmessagelivelocation

### [TelegramEditTextOptions](/types/Classes/TelegramEditTextOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `editMessageText` method.
Source: https://core.telegram.org/bots/api#editmessagetext

### [TelegramFile](/types/Classes/TelegramFile.md)

Describes the file payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#file

### [TelegramForceReplyOptions](/types/Classes/TelegramForceReplyOptions.md)

Represents parameters wrapper for sending a force reply to the user via the `Telegram` bot service.
Source: https://core.telegram.org/bots/api#forcereply

### [TelegramForwardOptions](/types/Classes/TelegramForwardOptions.md)

Represents the optional parameters for the `Telegram` `forward` method.
Source: https://core.telegram.org/bots/api#forwardmessage

### [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md)

Represents parameters wrapper for sending inline keyboard to the user via the `Telegram` bot service.
Source: https://core.telegram.org/bots/api#inlinekeyboardmarkup

### [TelegramInlineQueryEvent](/types/Classes/TelegramInlineQueryEvent.md)

Describes the common payload properties for the `Telegram` bot inline query events.
Source: https://core.telegram.org/bots/api#inlinequery

### [TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md)

Describes the basic result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresult

### [TelegramInlineQueryResultArticle](/types/Classes/TelegramInlineQueryResultArticle.md)

Describes the article result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultarticle

### [TelegramInlineQueryResultAudio](/types/Classes/TelegramInlineQueryResultAudio.md)

Describes the audio result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultaudio

### [TelegramInlineQueryResultContact](/types/Classes/TelegramInlineQueryResultContact.md)

Describes the contact result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultcontact

### [TelegramInlineQueryResultDocument](/types/Classes/TelegramInlineQueryResultDocument.md)

Describes the document result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultdocument

### [TelegramInlineQueryResultGif](/types/Classes/TelegramInlineQueryResultGif.md)

Describes the gif result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultgif, https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif

### [TelegramInlineQueryResultLocation](/types/Classes/TelegramInlineQueryResultLocation.md)

Describes the location result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultlocation

### [TelegramInlineQueryResultPhoto](/types/Classes/TelegramInlineQueryResultPhoto.md)

Describes the photo result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultphoto

### [TelegramInlineQueryResultSticker](/types/Classes/TelegramInlineQueryResultSticker.md)

Describes the article result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultarticle

### [TelegramInlineQueryResultVenue](/types/Classes/TelegramInlineQueryResultVenue.md)

Describes the venue result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultvenue

### [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md)

Describes the video result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultvideo

### [TelegramInlineQueryResultVoice](/types/Classes/TelegramInlineQueryResultVoice.md)

Describes the voice result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultvoice

### [TelegramInputContactMessageContent](/types/Classes/TelegramInputContactMessageContent.md)

Describes the input contact message payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inputcontactmessagecontent

### [TelegramInputLocationMessageContent](/types/Classes/TelegramInputLocationMessageContent.md)

Describes the input location message payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inputlocationmessagecontent

### [TelegramInputMedia](/types/Classes/TelegramInputMedia.md)

Describes the input media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
Source: https://core.telegram.org/bots/api#inputmedia

### [TelegramInputMediaAnimation](/types/Classes/TelegramInputMediaAnimation.md)

Describes the input animation media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
Source: https://core.telegram.org/bots/api#inputmediaanimation

### [TelegramInputMediaAudio](/types/Classes/TelegramInputMediaAudio.md)

Describes the input audio media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
Source: https://core.telegram.org/bots/api#inputmediaaudio

### [TelegramInputMediaDocument](/types/Classes/TelegramInputMediaDocument.md)

Describes the input document media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
Source: https://core.telegram.org/bots/api#inputmediadocument

### [TelegramInputMediaPhoto](/types/Classes/TelegramInputMediaPhoto.md)

Describes the input photo media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
Source: https://core.telegram.org/bots/api#inputmediaphoto

### [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md)

Describes the input video media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
Source: https://core.telegram.org/bots/api#inputmediavideo

### [TelegramInputMessageContent](/types/Classes/TelegramInputMessageContent.md)

Describes the basic input message payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inputmessagecontent

### [TelegramInputSticker](/types/Classes/TelegramInputSticker.md)

Describes the `Telegram` input sticker payload.
Source: https://core.telegram.org/bots/api#inputsticker

### [TelegramInputTextMessageContent](/types/Classes/TelegramInputTextMessageContent.md)

Describes the input text message payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inputtextmessagecontent

### [TelegramInputVenueMessageContent](/types/Classes/TelegramInputVenueMessageContent.md)

Describes the input venue message payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inputvenuemessagecontent

### [TelegramLocation](/types/Classes/TelegramLocation.md)

Describes the location payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#location

### [TelegramMaskPosition](/types/Classes/TelegramMaskPosition.md)

Describes the mask position payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#maskposition

### [TelegramMessage](/types/Classes/TelegramMessage.md)

Describes the message payload received as an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#message

### [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md)

The builder-like class representing a special entity in a message text. For example, hashtags, usernames, etc.
Source: https://core.telegram.org/bots/api#messageentity

### [TelegramMessageEvent](/types/Classes/TelegramMessageEvent.md)

Describes the common payload properties for the `Telegram` bot message events.
Source: https://core.telegram.org/bots/api#message

### [TelegramPhotoSize](/types/Classes/TelegramPhotoSize.md)

Describes the photo size payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#photosize

### [TelegramPoll](/types/Classes/TelegramPoll.md)

Describes the poll payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#poll

### [TelegramPollAnswerEvent](/types/Classes/TelegramPollAnswerEvent.md)

Describes the common payload properties for the `Telegram` bot poll answer events.
Source: https://core.telegram.org/bots/api#pollanswer

### [TelegramPollEvent](/types/Classes/TelegramPollEvent.md)

Describes the common payload properties for the `Telegram` bot poll events.
Source: https://core.telegram.org/bots/api#poll

### [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md)

The builder-like class that describes optional parameters for promoting a `Telegram` chat member.
Source: https://core.telegram.org/bots/api#promotechatmember

### [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md)

The builder-like class that represents parameters for sending a custom reply keyboard to the user via the `Telegram` bot service.
Source: https://core.telegram.org/bots/api#replykeyboardmarkup

### [TelegramReplyKeyboardRemoveOptions](/types/Classes/TelegramReplyKeyboardRemoveOptions.md)

Represents parameters wrapper for sending a remove reply keyboard signal to the user via the `Telegram` bot service.
Source: https://core.telegram.org/bots/api#replykeyboardremove

### [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendAudio` and `sendVoice` methods.
Source: https://core.telegram.org/bots/api#sendaudio, https://core.telegram.org/bots/api#sendvoice

### [TelegramSendContactOptions](/types/Classes/TelegramSendContactOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendContact` method.
Source: https://core.telegram.org/bots/api#sendcontact

### [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendDice` method.
Source: https://core.telegram.org/bots/api#senddice

### [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendDocument` method.
Source: https://core.telegram.org/bots/api#senddocument

### [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendPhoto` method.
Source: https://core.telegram.org/bots/api#sendphoto

### [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendLocation` method.
Source: https://core.telegram.org/bots/api#sendlocation

### [TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)

The builder-like class that describes common optional parameters of the `Telegram` for sending messages

### [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendPoll` method.
Source: https://core.telegram.org/bots/api#sendpoll

### [TelegramSendStickerOptions](/types/Classes/TelegramSendStickerOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendSticker` method.
Source: https://core.telegram.org/bots/api#sendsticker

### [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendMessage` method.
Source: https://core.telegram.org/bots/api#sendmessage

### [TelegramSendVenueOptions](/types/Classes/TelegramSendVenueOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendVenue` method.
Source: https://core.telegram.org/bots/api#sendvenue

### [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendVideoNote` method.
Source: https://core.telegram.org/bots/api#sendvideonote

### [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md)

The builder-like class that describes all optional parameters of the `Telegram` `sendVideo` and `sendAnimation` methods.
Source: https://core.telegram.org/bots/api#sendvideo

### [TelegramSticker](/types/Classes/TelegramSticker.md)

Describes the sticker payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#sticker

### [TelegramStickerSet](/types/Classes/TelegramStickerSet.md)

Describes the `Telegram` sticker set payload.
Source: https://core.telegram.org/bots/api#stickerset

### [TelegramStickerSetCreateOptions](/types/Classes/TelegramStickerSetCreateOptions.md)

Describes the `Telegram` optional parameters for creation of a sticker set.
Source: https://core.telegram.org/bots/api#createnewstickerset

### [TelegramUpdateEvent](/types/Classes/TelegramUpdateEvent.md)

Describes the payload received as an update from a `Telegram` bot.

### [TelegramUser](/types/Classes/TelegramUser.md)

Describes the sender payload received as an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#user

### [TelegramVenue](/types/Classes/TelegramVenue.md)

Describes the venue payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#venue

### [TelegramVideo](/types/Classes/TelegramVideo.md)

Describes the video payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#video

### [TelegramVideoNote](/types/Classes/TelegramVideoNote.md)

Describes the video note payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#videonote

### [TelegramVoice](/types/Classes/TelegramVoice.md)

Describes the voice payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#voice

### [TelegramWebAppInfo](/types/Classes/TelegramWebAppInfo.md)

Describes the web app info payload received as an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#webappinfo

### [ViberAccount](/types/Classes/ViberAccount.md)

Describes the account payload received as result of `Viber` `getAccount` method

### [ViberBotContext](/types/Classes/ViberBotContext.md)

Represents the context with variables and methods for handling the incoming updates for `Viber` bots

### [ViberBotHandler](/types/Classes/ViberBotHandler.md)

The class designed for handling webhook events specifically for `Viber` bots

### [ViberBotSenderService](/types/Classes/ViberBotSenderService.md)

Service class that provides access to all `Viber` `send` methods

### [ViberBotService](/types/Classes/ViberBotService.md)

The concrete service for the `Viber` messenger bots. Extends [BotService](/types/Classes/BotService.md) but also contains features related to `Viber` only

### [ViberChat](/types/Classes/ViberChat.md)

Describes the chat payload received as an update from a `Viber` bot

### [ViberLocation](/types/Classes/ViberLocation.md)

Represents the coordinates for a location message

### [ViberMessage](/types/Classes/ViberMessage.md)

Describes the message payload received as an update from a `Viber` bot

### [ViberMessageEvent](/types/Classes/ViberMessageEvent.md)

Describes the common payload properties for the `Viber` bot update events.
Sources:

-   https://developers.viber.com/docs/api/rest-bot-api/#message-receipts-callbacks
-   https://developers.viber.com/docs/api/rest-bot-api/#unsubscribed

### [ViberMessageFailedEvent](/types/Classes/ViberMessageFailedEvent.md)

Describes the `Viber` bot payload for a failed message send attempt.
Source: https://developers.viber.com/docs/api/rest-bot-api/#failed-callback

### [ViberMessageReceivedEvent](/types/Classes/ViberMessageReceivedEvent.md)

Describes the `Viber` bot payload received when the new message is received from a user.
Source: https://developers.viber.com/docs/api/rest-bot-api/#receive-message-from-user

### [ViberOnlineStatus](/types/Classes/ViberOnlineStatus.md)

Describes the online status payload received as result of `Viber` `getOnline` method

### [ViberReplyKeyboardOptions](/types/Classes/ViberReplyKeyboardOptions.md)

The builder-like class that represents parameters for sending a custom carousel/keyboard to the user via the `Viber` bot service.
Source: https://developers.viber.com/docs/tools/keyboards/#general-keyboard-parameters

### [ViberSendFileOptions](/types/Classes/ViberSendFileOptions.md)

The wrapper class that represents optional parameters for sending a file via the `Viber` bot service

### [ViberSendImageOptions](/types/Classes/ViberSendImageOptions.md)

The wrapper class that represents optional parameters for sending an image via the `Viber` bot service

### [ViberSendVideoOptions](/types/Classes/ViberSendVideoOptions.md)

The wrapper class that represents optional parameters for sending a video via the `Viber` bot service

### [ViberSubscribedEvent](/types/Classes/ViberSubscribedEvent.md)

Describes the `Viber` bot payload when a new user subscribes to the bot.
Source: https://developers.viber.com/docs/api/rest-bot-api/#subscribed

### [ViberUpdateEvent](/types/Classes/ViberUpdateEvent.md)

Describes the payload received as an update from a `Viber` bot

### [ViberUser](/types/Classes/ViberUser.md)

Describes the sender payload received as an update from a `Viber` bot

## Enums

### [BotEnumType](/types/Enums/BotEnumType.md)

Custom enum type that provides more flexibility comparing to the native Apex enums

### [BotMessageType](/types/Enums/BotMessageType.md)

The enum with all available message types for sending and receiving messages

### [BotType](/types/Enums/BotType.md)

Custom enum that contains all available bot types for the package. The same values are presented in the `Bot__c.Type__c` picklist

### [BotUpdateEventType](/types/Enums/BotUpdateEventType.md)

Custom enum base class that is extended by `Telegram` and `Viber` enums which contain all available event types

### [TelegramUpdateEventType](/types/Enums/TelegramUpdateEventType.md)

Custom enum class that contains all available event types for `Telegram` bots.
Source: https://core.telegram.org/bots/api#update.

### [ViberUpdateEventType](/types/Enums/ViberUpdateEventType.md)

Custom enum class that contains all available event types for `Viber` bots.
Source: https://developers.viber.com/docs/api/rest-bot-api/#setting-a-webhook

## Interfaces

### [IBotHandler](/types/Interfaces/IBotHandler.md)

The interface that is required to implement to handle chat bot updates

### [IBotSenderService](/types/Interfaces/IBotSenderService.md)

The interface with all common methods for sending messages to the bot users

### [IBotService](/types/Interfaces/IBotService.md)

The BotService interface containing all main methods for every bot service
