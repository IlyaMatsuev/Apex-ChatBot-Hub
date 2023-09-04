/**
 * @description Describes the sender payload received as an update from a `Viber` bot
 */
global class ViberBotUser extends BotPayload implements IBotUser {
    private UserName fullName {
        get {
            if (fullName == null) {
                fullName = new UserName(payload.getString('name'));
            }
            return fullName;
        }
        set;
    }

    public ViberBotUser(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Returns the `Viber` user id
     * @return The `Viber` user id
     */
    global String getId() {
        return payload.getString('id');
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