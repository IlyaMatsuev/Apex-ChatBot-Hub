/**
 * Created by Ilya Matsuev on 8/25/2020.
 */

public with sharing class TelegramUserWrapper {

    public Integer id {get;set;}
    public Boolean is_bot {get;set;}
    public String first_name {get;set;}
    public String last_name {get;set;}
    public String username {get;set;}
    public String language_code {get;set;}
    public Boolean can_join_groups {get;set;}
    public Boolean can_read_all_group_messages {get;set;}
    public Boolean supports_inline_queries {get;set;}
}
