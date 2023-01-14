public class ViberBotUserEntity extends ValueMap implements IBotUserEntity {
    private static UserName fullName;

    public String getId() {
        return getString('id');
    }

    public String getFirstName() {
        return getFullName().firstName;
    }

    public String getLastName() {
        return getFullName().lastName;
    }

    // Viber doesn't have usernames so use Id's instead
    public String getUsername() {
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
