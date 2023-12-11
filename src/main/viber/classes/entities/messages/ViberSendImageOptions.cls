/**
 * @description The wrapper class that represents optional parameters for sending an image via the `Viber` bot service
 */
global class ViberSendImageOptions {
    /**
     * @description The text to attach to the image
     */
    global String caption;
    /**
     * @description The URL of a reduced size image (JPEG, PNG, GIF)
     */
    global String thumbnail;

    /**
     * @description Creates an instance of <<ViberSendImageOptions>> without initializing options
     */
    global ViberSendImageOptions() {}

    /**
     * @description Creates an instance of <<ViberSendImageOptions>> with the provided caption and thumbnail
     * @param caption The text to attach to the image
     * @param thumbnail The URL of a reduced size image (JPEG, PNG, GIF)
     */
    global ViberSendImageOptions(String caption, String thumbnail) {
        this.caption = caption;
        this.thumbnail = thumbnail;
    }
}
