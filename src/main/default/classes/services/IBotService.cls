/**
 * @description The BotService interface containing all main methods for every bot service
 * @group Interfaces
 */
global interface IBotService {
    /**
     * @description Creates an instance of the sender service, giving access to all bot methods for sending information
     * @param chatId The id of the chat where the information has to be sent
     * @return The implementation of the <<IBotSenderService>>
     */
    IBotSenderService send(String chatId);
}
