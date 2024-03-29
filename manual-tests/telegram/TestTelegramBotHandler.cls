/**
 * @description !This class is not part of the package and is being used specifically for testing the functionality!
 */
public class TestTelegramBotHandler extends TelegramBotHandler {
    // Send any message to the bot
    public override void onMessageReceived(TelegramBotContext context, TelegramMessageEvent event) {
        String replyText = event.text == null ? event.caption : event.text;
        context.reply().text('Echo: ' + replyText);
        logEvent(context.getBot().id, 'onMessageReceived', event);
    }

    // Edit any message known to the bot
    public override void onMessageEdited(TelegramBotContext context, TelegramMessageEvent event) {
        context.reply()
            .text('Hey! Stop editing this message!', new TelegramSendTextOptions().asReplyToMessage(event.getId()));

        logEvent(context.getBot().id, 'onMessageEdited', event);
    }

    // Make sure the inline mode is enabled for the bot: https://core.telegram.org/bots/inline
    // Activate inline mode for the bot via BotFather. Use inline mode with the bot
    public override void onInlineQuery(TelegramBotContext context, TelegramInlineQueryEvent event) {
        TelegramInlineKeyboardMarkupOptions inlineKeyboard = new TelegramInlineKeyboardMarkupOptions()
            .addButton(new TelegramInlineKeyboardMarkupOptions.Button('Share me...').asSwitchInlineQuery(''));

        List<TelegramInlineQueryResultArticle> results = new List<TelegramInlineQueryResultArticle> {
            new TelegramInlineQueryResultArticle('1')
                .withTitle('How gay are you?')
                .withDescription('Send your current gayness to the chat.')
                .withInputMessage(new TelegramInputTextMessageContent('I am 15% gay!').disableWebPagePreview())
                .withInlineKeyboard(inlineKeyboard)
                .withThumbnail('https://img.kieran.de/8N3nfe4.png'),
            new TelegramInlineQueryResultArticle('2')
                .withTitle('Help')
                .withDescription('Show the instructions.')
                .withInputMessage(
                    new TelegramInputTextMessageContent('Some ass-long description here...').disableWebPagePreview()
                )
                .withInlineKeyboard(inlineKeyboard)
                .withThumbnail('https://img.kieran.de/8N3nfe4.png')
        };

        context.getService().inlineQuery(event.id).answer(results);
        logEvent(context.getBot().id, 'onInlineQuery', event);
    }

    // Make sure the collecting feedback is enabled for the bot: https://core.telegram.org/bots/inline#collecting-feedback.
    // Choose any inline result
    public override void onChosenInlineResult(TelegramBotContext context, TelegramChosenInlineResultEvent event) {
        logEvent(context.getBot().id, 'onChosenInlineResult', event);
    }

    // Send a message from bot with attached inline keyboard with included callback query button. Click that button in the chat
    public override void onCallbackQuery(TelegramBotContext context, TelegramCallbackQueryEvent event) {
        context.reply().text('Reporting on your callback query: ' + event.data);
        logEvent(context.getBot().id, 'onCallbackQuery', event);
    }

    // Send a new poll to the bot. Close the poll
    // Or, send a new anonymous poll message from bot. Answer any option
    public override void onPollUpdated(TelegramBotContext context, TelegramPollEvent event) {
        logEvent(context.getBot().id, 'onPollUpdated', event);
    }

    // Send a new poll message from bot. Answer any option
    public override void onPollAnswer(TelegramBotContext context, TelegramPollAnswerEvent event) {
        logEvent(context.getBot().id, 'onPollAnswer', event);
    }

    // Block the bot. Unblock it after
    public override void onMyChatMemberUpdated(TelegramBotContext context, TelegramChatMemberUpdatedEvent event) {
        if (event.newChatMember.status == 'member') {
            context.reply().text('Glad that you unblocked me back');
        }
        logEvent(context.getBot().id, 'onMyChatMemberUpdated', event);
    }

    // Not possible to test yet
    public override void onChatMemberUpdated(TelegramBotContext context, TelegramChatMemberUpdatedEvent event) {
        logEvent(context.getBot().id, 'onChatMemberUpdated', event);
    }

    private void logEvent(Id botId, String methodName, BotPayload eventPayload) {
        BotJsonPayload payload = new BotJsonPayload();
        payload.set('event', eventPayload.getJsonPayload());

        BotErrorLogger.log(botId, new TelegramBotLogEntryException(methodName + ': Success', payload));
    }

    public class TelegramBotLogEntryException extends BotCustomException {
        public TelegramBotLogEntryException(String message, BotJsonPayload payload) {
            super(message, payload);
        }
    }
}
