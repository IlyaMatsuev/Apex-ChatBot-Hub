/**
 * @description Describes the sender payload received as an update from a `Viber` bot
 */
global class ViberUser extends BotPayload implements IBotUser {
    /**
     * @description The unique `Viber` user id
     */
    global String id { get { return payload.getString('id'); } }

    /**
     * @description The user’s `Viber` name
     */
    global String name { get { return payload.getString('name'); } }

    /**
     * @description The URL of user’s avatar
     */
    global String avatar { get { return payload.getString('avatar'); } }

    /**
     * @description The user’s 2 letter country code
     */
    global String country { get { return payload.getString('country'); } }

    /**
     * @description The user’s phone language
     */
    global String language { get { return payload.getString('language'); } }

    /**
     * @description The max API version, matching the most updated user’s device
     */
    global Integer apiVersion { get { return payload.getInteger('api_version'); } }

    private UserName fullName {
        get {
            if (fullName == null) {
                fullName = new UserName(name);
            }
            return fullName;
        }
        set;
    }

    public ViberUser(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Returns the `Viber` user id
     * @return The `Viber` user id
     */
    global String getId() {
        return id;
    }

    /**
     * @description Returns the `Viber` user first name
     * @return The `Viber` user first name
     */
    global String getFirstName() {
        return fullName.firstName;
    }

    /**
     * @description Returns the `Viber` user last name
     * @return The `Viber` user last name
     */
    global String getLastName() {
        return fullName.lastName;
    }

    /**
     * @description Returns the `Viber` user id since there are no usernames
     * @return The `Viber` user id
     */
    global String getUsername() {
        return getId();
    }

    private class UserName {
        private final String firstName;
        private final String lastName;

        private UserName(String name) {
            List<String> parts = name.split(' ');
            if (parts.size() > 1) {
                this.firstName = parts.remove(0);
                this.lastName = String.join(parts, ' ');
            } else {
                this.lastName = parts.get(0);
            }
        }
    }
}
