/**
 * @description Represents the coordinates for a location message
 */
global class ViberLocation extends BotPayload {
    /**
     * @description The location latitude
     */
    global Decimal latitude { get { return payload.getDecimal('lat'); } }

    /**
     * @description The location longitude
     */
    global Decimal longitude { get { return payload.getDecimal('lon'); } }

    public ViberLocation(BotJsonPayload payload) {
        super(payload);
    }
}
