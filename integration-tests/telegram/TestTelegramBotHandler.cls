/**
 * @description !This class is not part of the package and is being used specifically for testing the functionality!
 */
public class TestTelegramBotHandler extends TelegramBotHandler {
    public override void onMessageReceived(TelegramBotContext context, TelegramBotMessageEvent event) {
        BotJsonPayload payload = new BotJsonPayload();
        payload.set('message', event.getJsonPayload());

        context.reply().text('Echo: ' + event.text);

        BotErrorLogger.log(
            context.getBot().id,
            new TelegramBotLogEntryException('onMessageReceived: Success', payload)
        );
    }

    public override void onMessageEdited(TelegramBotContext context, TelegramBotMessageEvent event) {
        BotJsonPayload payload = new BotJsonPayload();
        payload.set('message', event.getJsonPayload());

        context.reply()
            .text('Hey! Stop editing this message!', new TelegramSendTextOptions().asReplyToMessage(event.getId()));

        BotErrorLogger.log(context.getBot().id, new TelegramBotLogEntryException('onMessageEdited: Success', payload));
    }

    public class TelegramBotLogEntryException extends BotCustomException {
        public TelegramBotLogEntryException(String message, BotJsonPayload payload) {
            super(message, payload);
        }
    }
}
