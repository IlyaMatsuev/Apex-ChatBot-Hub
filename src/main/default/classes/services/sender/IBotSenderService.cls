/**
 * @description The interface with all common methods for sending messages to the bot users
 * @group Interfaces
 */
global interface IBotSenderService {
    /**
     * @description Sends a text message
     * @param text The message text to send
     */
    void text(String text);

    /**
     * @description Sends an image
     * @param imageUrl The image URL
     */
    void image(String imageUrl);

    /**
     * @description Sends an image with a caption
     * @param imageUrl The image URL
     * @param caption The text to attach to the image
     */
    void image(String imageUrl, String caption);

    /**
     * @description Sends a video
     * @param videoUrl The video URL
     */
    void video(String videoUrl);

    /**
     * @description Sends a video with a caption
     * @param videoUrl The video URL
     * @param caption The text to attach to the video
     */
    void video(String videoUrl, String caption);

    /**
     * @description Sends a file
     * @param fileUrl The file URL. Should include file name with extension in the end
     */
    void file(String fileUrl);

    /**
     * @description Sends a file
     * @param fileUrl The file URL. Should include file name with extension in the end
     * @param caption The text to attach to the file
     */
    void file(String fileUrl, String caption);

    /**
     * @description Sends a contact reference
     * @param name The contact first name or full name (via spaces)
     * @param phone The contact phone number
     */
    void contact(String name, String phone);

    /**
     * @description Sends a location. Latitude and longitude values are not validated
     * @param latitude The location latitude
     * @param longitude The location longitude
     */
    void location(Decimal latitude, Decimal longitude);

    /**
     * @description Sets a custom keyboard for the message that the receiver will have instead of the standard input keyboard
     * @param buttons The list of buttons to be shown to the receiver
     * @return The current <<IBotSenderService>> instance
     */
    IBotSenderService withReplyKeyboard(BotReplyKeyboardButton[] buttons);
}
