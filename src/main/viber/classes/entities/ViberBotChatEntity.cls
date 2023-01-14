public class ViberBotChatEntity extends ValueMap implements IBotChatEntity {
    public String getId() {
        return getString('id');
    }

    public String getTitle() {
        return getString('name');
    }

    public IBotUserEntity getSender() {
        return (IBotUserEntity) ValueMap.fromJson(toJson(), ViberBotUserEntity.class);
    }
}
