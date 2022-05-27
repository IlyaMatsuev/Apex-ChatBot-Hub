/**
 * Created by Ilya Matsuev on 8/28/2020.
 */

public with sharing class VKNewMessageWrapper {
    public Integer id { get; set; }
    public Integer user_id { get; set; }
    public Integer from_id { get; set; }
    public Integer v_date { get; set; }
    public Integer read_state { get; set; }
    public String ref { get; set; }
    public String ref_source { get; set; }
    public Integer out { get; set; }
    public String title { get; set; }
    public String body { get; set; }
    // geo
    // attachments
    // fwd_messages
    public Integer emoji { get; set; }
    public Integer important { get; set; }
    public Integer deleted { get; set; }
    public Integer random_id { get; set; }
    public Integer chat_id { get; set; }
    // chat_active
    // push_settings
    public Integer users_count { get; set; }
    public Integer admin_id { get; set; }
    public String action { get; set; }
    public Integer action_mid { get; set; }
    public String action_email { get; set; }
    public String action_text { get; set; }
    public String photo_50 { get; set; }
    public String photo_100 { get; set; }
    public String photo_200 { get; set; }
}
