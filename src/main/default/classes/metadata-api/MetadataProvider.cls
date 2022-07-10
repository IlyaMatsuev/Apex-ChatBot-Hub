public class MetadataProvider {
    public static final MetadataService.MetadataPort service { get; private set; }

    static {
        service = createService();
    }

    public static MetadataService.MetadataPort createService() {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        service.AllOrNoneHeader = new MetadataService.AllOrNoneHeader_element();
        service.AllOrNoneHeader.allOrNone = true;
        return service;
    }

    public static MetadataService.Metadata getMetadata(String type, String[] names) {
        MetadataService.Metadata[] metadata = service.readMetadata(type, names).getRecords();
        MetadataService.Metadata targetMetadata = null;
        if (!metadata.isEmpty()) {
            targetMetadata = metadata.get(0);
        }
        return targetMetadata;
    }

    public static MetadataService.SaveResult updateMetadata(MetadataService.Metadata targetMetadata) {
        return service.updateMetadata(new List<MetadataService.Metadata>{ targetMetadata }).get(0);
    }

    public static MetadataService.SaveResult renameMetadata(String type, String oldName, String newName) {
        return service.renameMetadata(type, oldName, newName);
    }
}
