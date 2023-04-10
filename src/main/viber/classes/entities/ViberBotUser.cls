/**
 * @description Describes the sender payload received as an update from a `Viber` bot
 */
global class ViberBotUser extends ValueMap implements IBotUser {
    private static UserName fullName;

    /**
     * @description Returns the `Viber` user id
     * @return The `Viber` user id
     */
    global String getId() {
        return getString('id');
    }

    /**
     * @description Returns the `Viber` user first name
     * @return The `Viber` user first name
     */
    global String getFirstName() {
        return getFullName().firstName;
    }

    /**
     * @description Returns the `Viber` user last name
     * @return The `Viber` user last name
     */
    global String getLastName() {
        return getFullName().lastName;
    }

    /**
     * @description Returns the `Viber` user id since there are no usernames
     * @return The `Viber` user id
     */
    global String getUsername() {
        return getId();
    }

    private UserName getFullName() {
        if (fullName == null) {
            fullName = new UserName(getString('name'));
        }
        return fullName;
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
