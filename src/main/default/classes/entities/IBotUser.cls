/**
 * @description Describes the sender payload received as an update from a bot
 */
global interface IBotUser {
    /**
     * @description Returns the sender external id
     * @return The sender external id
     */
    String getId();

    /**
     * @description Returns the sender first name
     * @return The sender first name
     */
    String getFirstName();

    /**
     * @description Returns the sender last name
     * @return The sender last name
     */
    String getLastName();

    /**
     * @description Returns the sender username. Returns the sender external id if not applicable
     * @return The sender username of external id
     */
    String getUsername();
}
