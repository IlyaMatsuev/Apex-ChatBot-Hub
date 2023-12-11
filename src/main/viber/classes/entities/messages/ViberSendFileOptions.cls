/**
 * @description The wrapper class that represents optional parameters for sending a file via the `Viber` bot service
 */
global class ViberSendFileOptions {
    private static final Integer DEFAULT_FILE_SIZE = 10000;

    /**
     * @description The text to attach to the file
     */
    global String caption;
    /**
     * @description The name of the file to be shown to the receiver. Should include extension
     */
    global String fileName;
    /**
     * @description The size of the file in bytes. Default is 10000
     */
    global Integer size;

    /**
     * @description Creates an instance of <<ViberSendFileOptions>> without initializing options
     */
    global ViberSendFileOptions() {
        this(null, null, null);
    }

    /**
     * @description Creates an instance of <<ViberSendFileOptions>> with the provided options
     * @param caption The text to attach to the file
     * @param fileName The name of the file to be shown to the receiver. Should include extension
     * @param size The size of the file in bytes. Default is 10000
     */
    global ViberSendFileOptions(String caption, String fileName, Integer size) {
        this.caption = caption;
        this.fileName = fileName;
        this.size = size == null ? DEFAULT_FILE_SIZE : size;
    }
}
