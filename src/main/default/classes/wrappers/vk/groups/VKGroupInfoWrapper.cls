/**
 * Created by Ilya Matsuev on 8/28/2020.
 */

public with sharing class VKGroupInfoWrapper {
    public Integer id { get; set; }
    public String name { get; set; }
    public String screen_name { get; set; }
    public Integer is_closed { get; set; }
    public String type { get; set; }
    public String photo_50 { get; set; }
    public String photo_100 { get; set; }
    public String photo_200 { get; set; }
}
