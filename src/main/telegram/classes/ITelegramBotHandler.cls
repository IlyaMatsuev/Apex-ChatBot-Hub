// TODO: Have single interface with the context object as a parameter which will have getService() method
public interface ITelegramBotHandler {
    void handle(TelegramBotService service);
}
