/**
 * @description Describes the mask position payload that can be received as part of an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#maskposition
 */
global class TelegramMaskPosition extends BotPayload {
    /**
     * @description The part of the face relative to which the mask should be placed. One of `forehead`, `eyes`, `mouth`, or `chin`
     */
    global String point { get { return payload.getString('point'); } }

    /**
     * @description The shift by X-axis measured in widths of the mask scaled to the face size, from left to right
     */
    global Decimal xShift { get { return payload.getDecimal('x_shift'); } }

    /**
     * @description The shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom
     */
    global Decimal yShift { get { return payload.getDecimal('y_shift'); } }

    /**
     * @description The mask scaling coefficient. For example, `2.0` means double size
     */
    global Decimal scale { get { return payload.getDecimal('scale'); } }

    public TelegramMaskPosition(BotJsonPayload payload) {
        super(payload);
    }
}
