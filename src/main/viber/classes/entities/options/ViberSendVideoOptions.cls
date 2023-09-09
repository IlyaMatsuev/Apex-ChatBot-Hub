/**
 * @description The wrapper class that represents optional parameters for sending a video via the `Viber` bot service
 */
global class ViberSendVideoOptions {
    private static final Integer DEFAULT_VIDEO_SIZE = 10000;

    /**
     * @description The text to attach to the video
     */
    global String caption;
    /**
     * @description The size of the video in bytes. Default is 10000
     */
    global Integer size;
    /**
     * @description The video duration in seconds, which will be displayed to the receiver
     */
    global Integer duration;
    /**
     * @description The URL of a reduced size image (JPEG)
     */
    global String thumbnail;

    /**
     * @description Creates an instance of <<ViberSendVideoOptions>> without initializing options
     */
    global ViberSendVideoOptions() {
        this(null, null, null, null);
    }

    /**
     * @description Creates an instance of <<ViberSendVideoOptions>> with the provided options
     * @param caption The text to attach to the video
     * @param size The size of the video in bytes. Default is 10000
     * @param duration The video duration in seconds
     * @param thumbnail The URL of a reduced size image (JPEG)
     */
    global ViberSendVideoOptions(String caption, Integer size, Integer duration, String thumbnail) {
        this.caption = caption;
        this.size = size == null ? DEFAULT_VIDEO_SIZE : size;
        this.duration = duration;
        this.thumbnail = thumbnail;
    }
}
