/**
 * @description !This class is not part of the package and is being used specifically for testing the functionality!
 */
public class TestTelegramBotHandler extends TelegramBotHandler {
    public override void onMessageReceived(TelegramBotContext context, TelegramMessageEvent event) {
        String replyText = event.text == null ? event.caption : event.text;
        context.reply().withForceReply().text('Echo: ' + replyText);
        logEvent(context.getBot().id, 'onMessageReceived', event);
    }

    public override void onMessageEdited(TelegramBotContext context, TelegramMessageEvent event) {
        context.reply()
            .text('Hey! Stop editing this message!', new TelegramSendTextOptions().asReplyToMessage(event.getId()));

        logEvent(context.getBot().id, 'onMessageEdited', event);
    }

    public override void onInlineQuery(TelegramBotContext context, TelegramInlineQueryEvent event) {
        context.reply()
            .text('I see you\'re trying to make some inline query right there: ' + event.getJsonPayload().toJson());
        logEvent(context.getBot().id, 'onInlineQuery', event);
    }

    public override void onChosenInlineResult(TelegramBotContext context, TelegramChosenInlineResultEvent event) {
        logEvent(context.getBot().id, 'onChosenInlineResult', event);
    }

    public override void onCallbackQuery(TelegramBotContext context, TelegramCallbackQueryEvent event) {
        context.reply().text('Reporting on your callback query: ' + event.data);
        logEvent(context.getBot().id, 'onCallbackQuery', event);
    }

    public override void onPollUpdated(TelegramBotContext context, TelegramPollEvent event) {
        context.reply().text('Poll got updated' + event.totalVoterCount);
        logEvent(context.getBot().id, 'onPollUpdated', event);
    }

    public override void onPollAnswer(TelegramBotContext context, TelegramPollAnswerEvent event) {
        context.reply().text('New answers: ' + event.optionIds);
        logEvent(context.getBot().id, 'onPollAnswer', event);
    }

    public override void onMyChatMemberUpdated(TelegramBotContext context, TelegramChatMemberUpdatedEvent event) {
        logEvent(context.getBot().id, 'onMyChatMemberUpdated', event);
    }

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
