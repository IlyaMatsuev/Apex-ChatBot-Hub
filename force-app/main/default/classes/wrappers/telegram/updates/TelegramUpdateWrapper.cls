/**
 * Created by Ilya Matsuev on 8/24/2020.
 */

public with sharing class TelegramUpdateWrapper {

    public Integer update_id {get;set;}
    public TelegramMessageWrapper message {get;set;}
    public TelegramMessageWrapper edited_message {get;set;}
    public TelegramMessageWrapper channel_post {get;set;}
    public TelegramMessageWrapper edited_channel_post {get;set;}
    // inline_query
    // chosen_inline_result
    // callback_query
    // shipping_query
    // pre_checkout_query
    // poll
    // poll_answer
}
