/**
 * @description Describes the account payload received as result of `Viber` `getAccount` method
 */
global class ViberAccount extends BotPayload {
    /**
     * @description The unique numeric id of the account
     */
    global String id { get { return payload.getString('id'); } }

    /**
     * @description The account name
     */
    global String name { get { return payload.getString('name'); } }

    /**
     * @description The unique URL of the account
     */
    global String uri { get { return payload.getString('uri'); } }

    /**
     * @description The conversation background URL
     */
    global String background { get { return payload.getString('background'); } }

    /**
     * @description The account category
     */
    global String category { get { return payload.getString('category'); } }

    /**
     * @description The account sub-category
     */
    global String subcategory { get { return payload.getString('subcategory'); } }

    /**
     * @description The account location
     */
    global ViberLocation location { get { return new ViberLocation(payload.getJsonPayload('location')); } }

    /**
     * @description The account country
     */
    global String country { get { return payload.getString('country'); } }

    /**
     * @description The account registered webhook
     */
    global String webhook { get { return payload.getString('webhook'); } }

    /**
     * @description The account registered webhook event types
     */
    global List<String> eventTypes { get { return payload.getStringList('event_types'); } }

    /**
     * @description The number of subscribers
     */
    global Integer subscribersCount { get { return payload.getInteger('subscribers_count'); } }

    public ViberAccount(BotJsonPayload payload) {
        super(payload);
    }
}
