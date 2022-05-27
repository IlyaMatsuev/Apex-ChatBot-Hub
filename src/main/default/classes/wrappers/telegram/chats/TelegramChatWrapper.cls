/**
 * Created by Ilya Matsuev on 8/25/2020.
 */

global with sharing class TelegramChatWrapper {
    public Integer id { get; set; }
    public String type { get; set; }
    public String title { get; set; }
    public String username { get; set; }
    public String first_name { get; set; }
    public String last_name { get; set; }
    // photo
    public String description { get; set; }
    public String invite_link { get; set; }
    public TelegramMessageWrapper pinned_message { get; set; }
    // permissions
    public Integer slow_mode_delay { get; set; }
    public String sticker_set_name { get; set; }
    public Boolean can_set_sticker_set { get; set; }
}
