@IsTest
public class TelegramBotHandlerMock extends TelegramBotHandler {
    public static BotPayload lastEvent;

    public override void onMessageReceived(TelegramBotContext context, TelegramMessageEvent event) {
        lastEvent = event;
    }

    public override void onMessageEdited(TelegramBotContext context, TelegramMessageEvent event) {
        super.onMessageEdited(context, event);
        lastEvent = event;
    }

    public override void onChannelPostReceived(TelegramBotContext context, TelegramMessageEvent event) {
        super.onChannelPostReceived(context, event);
        lastEvent = event;
    }

    public override void onChannelPostEdited(TelegramBotContext context, TelegramMessageEvent event) {
        super.onChannelPostEdited(context, event);
        lastEvent = event;
    }

    public override void onInlineQuery(TelegramBotContext context, TelegramInlineQueryEvent event) {
        super.onInlineQuery(context, event);
        lastEvent = event;
    }

    public override void onChosenInlineResult(TelegramBotContext context, TelegramChosenInlineResultEvent event) {
        super.onChosenInlineResult(context, event);
        lastEvent = event;
    }

    public override void onCallbackQuery(TelegramBotContext context, TelegramCallbackQueryEvent event) {
        super.onCallbackQuery(context, event);
        lastEvent = event;
    }

    public override void onPollUpdated(TelegramBotContext context, TelegramPollEvent event) {
        super.onPollUpdated(context, event);
        lastEvent = event;
    }

    public override void onPollAnswer(TelegramBotContext context, TelegramPollAnswerEvent event) {
        super.onPollAnswer(context, event);
        lastEvent = event;
    }

    public override void onMyChatMemberUpdated(TelegramBotContext context, TelegramChatMemberUpdatedEvent event) {
        super.onMyChatMemberUpdated(context, event);
        lastEvent = event;
    }

    public override void onChatMemberUpdated(TelegramBotContext context, TelegramChatMemberUpdatedEvent event) {
        super.onChatMemberUpdated(context, event);
        lastEvent = event;
    }

    public override void onChatJoinRequest(TelegramBotContext context, TelegramChatJoinRequestEvent event) {
        super.onChatJoinRequest(context, event);
        lastEvent = event;
    }
}
