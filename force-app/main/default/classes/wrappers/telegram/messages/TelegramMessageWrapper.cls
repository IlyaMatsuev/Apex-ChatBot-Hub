/**
 * Created by Ilya Matsuev on 8/24/2020.
 */

global with sharing class TelegramMessageWrapper {

    public Integer message_id {get;set;}
    public TelegramUserWrapper v_from {get;set;}
    public Integer v_date {get;set;}
    public TelegramChatWrapper chat {get;set;}
    public TelegramUserWrapper forward_from {get;set;}
    public TelegramChatWrapper forward_from_chat {get;set;}
    public Integer forward_from_message_id {get;set;}
    public String forward_signature {get;set;}
    public String forward_sender_name {get;set;}
    public Integer forward_date {get;set;}
    public TelegramMessageWrapper reply_to_message {get;set;}
    public TelegramUserWrapper via_bot {get;set;}
    public Integer edit_date {get;set;}
    public String media_group_id {get;set;}
    public String author_signature {get;set;}
    public String text {get;set;}
    // entities
    // animation
    // audio
    // document
    // photo
    // sticker
    // video
    // video_note
    // voice
    public String caption {get;set;}
    // caption_entities
    // contact
    // dice
    // game
    // poll
    // venue
    // location
    // new_chat_members
    public TelegramUserWrapper left_chat_member {get;set;}
    public String new_chat_title {get;set;}
    // new_chat_photo
    public Boolean delete_chat_photo {get;set;}
    public Boolean group_chat_created {get;set;}
    public Boolean supergroup_chat_created {get;set;}
    public Boolean channel_chat_created {get;set;}
    public Integer migrate_to_chat_id {get;set;}
    public Integer migrate_from_chat_id {get;set;}
    public TelegramMessageWrapper pinned_message {get;set;}
    // invoice
    // successful_payment
    public String connected_website {get;set;}
    // passport_data
    // reply_markup
}
