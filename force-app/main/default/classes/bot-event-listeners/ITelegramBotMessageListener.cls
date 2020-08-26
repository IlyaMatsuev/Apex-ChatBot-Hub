/**
 * Created by Ilya Matsuev on 8/25/2020.
 */

global interface ITelegramBotMessageListener extends IBotMessageListener {

    void onMessage(TelegramBotService botService);
}
