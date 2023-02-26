/**
 * @description The BotService interface containing all main methods for every bot service
 */
global interface IBotService {
    IBotSenderService send(String chatId);
}
