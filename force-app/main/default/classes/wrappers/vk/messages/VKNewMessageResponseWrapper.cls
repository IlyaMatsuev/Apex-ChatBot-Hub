/**
 * Created by Ilya Matsuev on 8/28/2020.
 */

public with sharing class VKNewMessageResponseWrapper {

    public String type {get;set;}
    public VKNewMessageWrapper v_object {get;set;}
    public Integer group_id {get;set;}
}
