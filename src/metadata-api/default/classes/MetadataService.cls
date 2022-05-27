/**
 * Created by Ilya Matsuev on 8/21/2020.
 */

public class MetadataService {
    public static String SOAP_M_URI = 'http://soap.sforce.com/2006/04/metadata';

    public class SaveResult {
        public MetadataService.Error[] errors;
        public String fullName;
        public Boolean success;
        private String[] errors_type_info = new List<String>{ 'errors', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] success_type_info = new List<String>{ 'success', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'errors', 'fullName', 'success' };
    }
    public class ExtendedErrorDetails {
        public String extendedErrorCode;
        private String[] extendedErrorCode_type_info = new List<String>{
            'extendedErrorCode',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'extendedErrorCode' };
    }
    public class SessionSettings {
        public Boolean disableTimeoutWarning;
        public Boolean enableCSPOnEmail;
        public Boolean enableCSRFOnGet;
        public Boolean enableCSRFOnPost;
        public Boolean enableCacheAndAutocomplete;
        public Boolean enableClickjackNonsetupSFDC;
        public Boolean enableClickjackNonsetupUser;
        public Boolean enableClickjackNonsetupUserHeaderless;
        public Boolean enableClickjackSetup;
        public Boolean enableContentSniffingProtection;
        public Boolean enablePostForSessions;
        public Boolean enableSMSIdentity;
        public Boolean enableUpgradeInsecureRequests;
        public Boolean enableXssProtection;
        public Boolean enforceIpRangesEveryRequest;
        public Boolean forceLogoutOnSessionTimeout;
        public Boolean forceRelogin;
        public Boolean hstsOnForcecomSites;
        public Boolean identityConfirmationOnEmailChange;
        public Boolean identityConfirmationOnTwoFactorRegistrationEnabled;
        public Boolean lockSessionsToDomain;
        public Boolean lockSessionsToIp;
        public String logoutURL;
        public Boolean redirectionWarning;
        public Boolean referrerPolicy;
        public Boolean requireHttpOnly;
        public Boolean requireHttps;
        public Boolean securityCentralKillSession;
        public String sessionTimeout;
        private String[] disableTimeoutWarning_type_info = new List<String>{
            'disableTimeoutWarning',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableCSPOnEmail_type_info = new List<String>{
            'enableCSPOnEmail',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableCSRFOnGet_type_info = new List<String>{
            'enableCSRFOnGet',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableCSRFOnPost_type_info = new List<String>{
            'enableCSRFOnPost',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableCacheAndAutocomplete_type_info = new List<String>{
            'enableCacheAndAutocomplete',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableClickjackNonsetupSFDC_type_info = new List<String>{
            'enableClickjackNonsetupSFDC',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableClickjackNonsetupUser_type_info = new List<String>{
            'enableClickjackNonsetupUser',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableClickjackNonsetupUserHeaderless_type_info = new List<String>{
            'enableClickjackNonsetupUserHeaderless',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableClickjackSetup_type_info = new List<String>{
            'enableClickjackSetup',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableContentSniffingProtection_type_info = new List<String>{
            'enableContentSniffingProtection',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enablePostForSessions_type_info = new List<String>{
            'enablePostForSessions',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableSMSIdentity_type_info = new List<String>{
            'enableSMSIdentity',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableUpgradeInsecureRequests_type_info = new List<String>{
            'enableUpgradeInsecureRequests',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableXssProtection_type_info = new List<String>{
            'enableXssProtection',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enforceIpRangesEveryRequest_type_info = new List<String>{
            'enforceIpRangesEveryRequest',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] forceLogoutOnSessionTimeout_type_info = new List<String>{
            'forceLogoutOnSessionTimeout',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] forceRelogin_type_info = new List<String>{
            'forceRelogin',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] hstsOnForcecomSites_type_info = new List<String>{
            'hstsOnForcecomSites',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] identityConfirmationOnEmailChange_type_info = new List<String>{
            'identityConfirmationOnEmailChange',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] identityConfirmationOnTwoFactorRegistrationEnabled_type_info = new List<String>{
            'identityConfirmationOnTwoFactorRegistrationEnabled',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] lockSessionsToDomain_type_info = new List<String>{
            'lockSessionsToDomain',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] lockSessionsToIp_type_info = new List<String>{
            'lockSessionsToIp',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] logoutURL_type_info = new List<String>{ 'logoutURL', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] redirectionWarning_type_info = new List<String>{
            'redirectionWarning',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] referrerPolicy_type_info = new List<String>{
            'referrerPolicy',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] requireHttpOnly_type_info = new List<String>{
            'requireHttpOnly',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] requireHttps_type_info = new List<String>{
            'requireHttps',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] securityCentralKillSession_type_info = new List<String>{
            'securityCentralKillSession',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] sessionTimeout_type_info = new List<String>{
            'sessionTimeout',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'disableTimeoutWarning',
            'enableCSPOnEmail',
            'enableCSRFOnGet',
            'enableCSRFOnPost',
            'enableCacheAndAutocomplete',
            'enableClickjackNonsetupSFDC',
            'enableClickjackNonsetupUser',
            'enableClickjackNonsetupUserHeaderless',
            'enableClickjackSetup',
            'enableContentSniffingProtection',
            'enablePostForSessions',
            'enableSMSIdentity',
            'enableUpgradeInsecureRequests',
            'enableXssProtection',
            'enforceIpRangesEveryRequest',
            'forceLogoutOnSessionTimeout',
            'forceRelogin',
            'hstsOnForcecomSites',
            'identityConfirmationOnEmailChange',
            'identityConfirmationOnTwoFactorRegistrationEnabled',
            'lockSessionsToDomain',
            'lockSessionsToIp',
            'logoutURL',
            'redirectionWarning',
            'referrerPolicy',
            'requireHttpOnly',
            'requireHttps',
            'securityCentralKillSession',
            'sessionTimeout'
        };
    }
    public class FieldMappingField {
        public String dataServiceField;
        public String dataServiceObjectName;
        public Integer priority;
        private String[] dataServiceField_type_info = new List<String>{
            'dataServiceField',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] dataServiceObjectName_type_info = new List<String>{
            'dataServiceObjectName',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] priority_type_info = new List<String>{ 'priority', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'dataServiceField',
            'dataServiceObjectName',
            'priority'
        };
    }
    public class readMetadataResponse_element {
        public MetadataService.ReadResult result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class FieldValue {
        public String name;
        public String value;
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] value_type_info = new List<String>{ 'value', SOAP_M_URI, null, '1', '1', 'true' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'name', 'value' };
    }
    public class UpsertResult {
        public Boolean created;
        public MetadataService.Error[] errors;
        public String fullName;
        public Boolean success;
        private String[] created_type_info = new List<String>{ 'created', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] errors_type_info = new List<String>{ 'errors', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] success_type_info = new List<String>{ 'success', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'created', 'errors', 'fullName', 'success' };
    }
    public class ValueSettings {
        public String[] controllingFieldValue;
        public String valueName;
        private String[] controllingFieldValue_type_info = new List<String>{
            'controllingFieldValue',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] valueName_type_info = new List<String>{ 'valueName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'controllingFieldValue', 'valueName' };
    }
    public class CustomDataTypeComponent {
        public String developerSuffix;
        public Boolean enforceFieldRequiredness;
        public String label;
        public Integer length;
        public Integer precision;
        public Integer scale;
        public String sortOrder;
        public Integer sortPriority;
        public String type_x;
        private String[] developerSuffix_type_info = new List<String>{
            'developerSuffix',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] enforceFieldRequiredness_type_info = new List<String>{
            'enforceFieldRequiredness',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] length_type_info = new List<String>{ 'length', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] precision_type_info = new List<String>{ 'precision', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] scale_type_info = new List<String>{ 'scale', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] sortOrder_type_info = new List<String>{ 'sortOrder', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] sortPriority_type_info = new List<String>{
            'sortPriority',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] type_x_type_info = new List<String>{ 'type', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'developerSuffix',
            'enforceFieldRequiredness',
            'label',
            'length',
            'precision',
            'scale',
            'sortOrder',
            'sortPriority',
            'type_x'
        };
    }
    public class RetrieveRequest {
        public Double apiVersion;
        public String[] packageNames;
        public Boolean singlePackage;
        public String[] specificFiles;
        public MetadataService.Package_x unpackaged;
        private String[] apiVersion_type_info = new List<String>{ 'apiVersion', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] packageNames_type_info = new List<String>{
            'packageNames',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] singlePackage_type_info = new List<String>{
            'singlePackage',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] specificFiles_type_info = new List<String>{
            'specificFiles',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] unpackaged_type_info = new List<String>{ 'unpackaged', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'apiVersion',
            'packageNames',
            'singlePackage',
            'specificFiles',
            'unpackaged'
        };
    }
    public class retrieve_element {
        public MetadataService.RetrieveRequest retrieveRequest;
        private String[] retrieveRequest_type_info = new List<String>{
            'retrieveRequest',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'retrieveRequest' };
    }
    public class DeleteResult {
        public MetadataService.Error[] errors;
        public String fullName;
        public Boolean success;
        private String[] errors_type_info = new List<String>{ 'errors', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] success_type_info = new List<String>{ 'success', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'errors', 'fullName', 'success' };
    }
    public class ProfileApplicationVisibility {
        public String application;
        public Boolean default_x;
        public Boolean visible;
        private String[] application_type_info = new List<String>{ 'application', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] default_x_type_info = new List<String>{ 'default', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] visible_type_info = new List<String>{ 'visible', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'application', 'default_x', 'visible' };
    }
    public class ProfileCategoryGroupVisibility {
        public String[] dataCategories;
        public String dataCategoryGroup;
        public String visibility;
        private String[] dataCategories_type_info = new List<String>{
            'dataCategories',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] dataCategoryGroup_type_info = new List<String>{
            'dataCategoryGroup',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] visibility_type_info = new List<String>{ 'visibility', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'dataCategories',
            'dataCategoryGroup',
            'visibility'
        };
    }
    public class DescribeMetadataObject {
        public String[] childXmlNames;
        public String directoryName;
        public Boolean inFolder;
        public Boolean metaFile;
        public String suffix;
        public String xmlName;
        private String[] childXmlNames_type_info = new List<String>{
            'childXmlNames',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] directoryName_type_info = new List<String>{
            'directoryName',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] inFolder_type_info = new List<String>{ 'inFolder', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] metaFile_type_info = new List<String>{ 'metaFile', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] suffix_type_info = new List<String>{ 'suffix', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] xmlName_type_info = new List<String>{ 'xmlName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'childXmlNames',
            'directoryName',
            'inFolder',
            'metaFile',
            'suffix',
            'xmlName'
        };
    }
    public class AllOrNoneHeader_element {
        public Boolean allOrNone;
        private String[] allOrNone_type_info = new List<String>{ 'allOrNone', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'allOrNone' };
    }
    public class ListMetadataQuery {
        public String folder;
        public String type_x;
        private String[] folder_type_info = new List<String>{ 'folder', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] type_x_type_info = new List<String>{ 'type', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'folder', 'type_x' };
    }
    public class listMetadata_element {
        public MetadataService.ListMetadataQuery[] queries;
        public Double asOfVersion;
        private String[] queries_type_info = new List<String>{ 'queries', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] asOfVersion_type_info = new List<String>{ 'asOfVersion', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'queries', 'asOfVersion' };
    }
    public virtual class CustomValue extends Metadata {
        public String color;
        public Boolean default_x;
        public String description;
        public Boolean isActive;
        public String label;
    }
    public class ObjectNameCaseValue {
        public String article;
        public String caseType;
        public Boolean plural;
        public String possessive;
        public String value;
        private String[] article_type_info = new List<String>{ 'article', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] caseType_type_info = new List<String>{ 'caseType', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] plural_type_info = new List<String>{ 'plural', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] possessive_type_info = new List<String>{ 'possessive', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] value_type_info = new List<String>{ 'value', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'article',
            'caseType',
            'plural',
            'possessive',
            'value'
        };
    }
    public class CustomMetadata extends Metadata {
        public String type = 'CustomMetadata';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String description;
        public String label;
        public Boolean protected_x;
        public MetadataService.CustomMetadataValue[] values;
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] protected_x_type_info = new List<String>{ 'protected', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] values_type_info = new List<String>{ 'values', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'description',
            'label',
            'protected_x',
            'values'
        };
    }
    public class StandardValue extends CustomValue {
        public String type = 'StandardValue';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String color;
        public Boolean default_x;
        public String description;
        public Boolean isActive;
        public String label;
        private String[] color_type_info = new List<String>{ 'color', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] default_x_type_info = new List<String>{ 'default', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] isActive_type_info = new List<String>{ 'isActive', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '0', '1', 'false' };
        public Boolean allowEmail;
        public Boolean closed;
        public Boolean converted;
        public Boolean cssExposed;
        public String forecastCategory;
        public String groupingString;
        public Boolean highPriority;
        public Integer probability;
        public String reverseRole;
        public Boolean reviewed;
        public Boolean won;
        private String[] allowEmail_type_info = new List<String>{ 'allowEmail', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] closed_type_info = new List<String>{ 'closed', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] converted_type_info = new List<String>{ 'converted', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] cssExposed_type_info = new List<String>{ 'cssExposed', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] forecastCategory_type_info = new List<String>{
            'forecastCategory',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] groupingString_type_info = new List<String>{
            'groupingString',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] highPriority_type_info = new List<String>{
            'highPriority',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] probability_type_info = new List<String>{ 'probability', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] reverseRole_type_info = new List<String>{ 'reverseRole', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] reviewed_type_info = new List<String>{ 'reviewed', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] won_type_info = new List<String>{ 'won', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'color',
            'default_x',
            'description',
            'isActive',
            'label',
            'allowEmail',
            'closed',
            'converted',
            'cssExposed',
            'forecastCategory',
            'groupingString',
            'highPriority',
            'probability',
            'reverseRole',
            'reviewed',
            'won'
        };
    }
    public class deployResponse_element {
        public MetadataService.AsyncResult result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class StaticResource extends MetadataWithContent {
        public String type = 'StaticResource';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String content;
        private String[] content_type_info = new List<String>{ 'content', SOAP_M_URI, null, '0', '1', 'false' };
        public String cacheControl;
        public String contentType;
        public String description;
        private String[] cacheControl_type_info = new List<String>{
            'cacheControl',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] contentType_type_info = new List<String>{ 'contentType', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'content',
            'cacheControl',
            'contentType',
            'description'
        };
    }
    public class PermissionSetTabSetting {
        public String tab;
        public String visibility;
        private String[] tab_type_info = new List<String>{ 'tab', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] visibility_type_info = new List<String>{ 'visibility', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'tab', 'visibility' };
    }
    public class Users {
        public String[] user_x;
        private String[] user_x_type_info = new List<String>{ 'user', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'user_x' };
    }
    public class SiteWebAddress {
        public String certificate;
        public String domainName;
        public Boolean primary;
        private String[] certificate_type_info = new List<String>{ 'certificate', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] domainName_type_info = new List<String>{ 'domainName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] primary_type_info = new List<String>{ 'primary', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'certificate', 'domainName', 'primary' };
    }
    public class SiteRedirectMapping {
        public String action;
        public Boolean isActive;
        public String source;
        public String target;
        private String[] action_type_info = new List<String>{ 'action', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] isActive_type_info = new List<String>{ 'isActive', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] source_type_info = new List<String>{ 'source', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] target_type_info = new List<String>{ 'target', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'action', 'isActive', 'source', 'target' };
    }
    public class ReadCustomSiteResult implements IReadResult {
        public MetadataService.CustomSite[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readCustomSiteResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomSiteResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class CustomSite extends Metadata {
        public String type = 'CustomSite';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public Boolean active;
        public Boolean allowHomePage;
        public Boolean allowStandardAnswersPages;
        public Boolean allowStandardIdeasPages;
        public Boolean allowStandardLookups;
        public Boolean allowStandardPortalPages;
        public Boolean allowStandardSearch;
        public String analyticsTrackingCode;
        public String authorizationRequiredPage;
        public String bandwidthExceededPage;
        public Boolean browserXssProtection;
        public String changePasswordPage;
        public String chatterAnswersForgotPasswordConfirmPage;
        public String chatterAnswersForgotPasswordPage;
        public String chatterAnswersHelpPage;
        public String chatterAnswersLoginPage;
        public String chatterAnswersRegistrationPage;
        public String clickjackProtectionLevel;
        public Boolean contentSniffingProtection;
        public Boolean cspUpgradeInsecureRequests;
        public MetadataService.SiteWebAddress[] customWebAddresses;
        public String description;
        public String favoriteIcon;
        public String fileNotFoundPage;
        public String forgotPasswordPage;
        public String genericErrorPage;
        public String guestProfile;
        public String inMaintenancePage;
        public String inactiveIndexPage;
        public String indexPage;
        public String masterLabel;
        public String myProfilePage;
        public String portal;
        public Boolean referrerPolicyOriginWhenCrossOrigin;
        public Boolean requireHttps;
        public Boolean requireInsecurePortalAccess;
        public String robotsTxtPage;
        public String rootComponent;
        public String selfRegPage;
        public String serverIsDown;
        public String siteAdmin;
        public MetadataService.SiteRedirectMapping[] siteRedirectMappings;
        public String siteTemplate;
        public String siteType;
        public String subdomain;
        public String urlPathPrefix;
        private String[] active_type_info = new List<String>{ 'active', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] allowHomePage_type_info = new List<String>{
            'allowHomePage',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] allowStandardAnswersPages_type_info = new List<String>{
            'allowStandardAnswersPages',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] allowStandardIdeasPages_type_info = new List<String>{
            'allowStandardIdeasPages',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] allowStandardLookups_type_info = new List<String>{
            'allowStandardLookups',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] allowStandardPortalPages_type_info = new List<String>{
            'allowStandardPortalPages',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] allowStandardSearch_type_info = new List<String>{
            'allowStandardSearch',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] analyticsTrackingCode_type_info = new List<String>{
            'analyticsTrackingCode',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] authorizationRequiredPage_type_info = new List<String>{
            'authorizationRequiredPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] bandwidthExceededPage_type_info = new List<String>{
            'bandwidthExceededPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] browserXssProtection_type_info = new List<String>{
            'browserXssProtection',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] changePasswordPage_type_info = new List<String>{
            'changePasswordPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] chatterAnswersForgotPasswordConfirmPage_type_info = new List<String>{
            'chatterAnswersForgotPasswordConfirmPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] chatterAnswersForgotPasswordPage_type_info = new List<String>{
            'chatterAnswersForgotPasswordPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] chatterAnswersHelpPage_type_info = new List<String>{
            'chatterAnswersHelpPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] chatterAnswersLoginPage_type_info = new List<String>{
            'chatterAnswersLoginPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] chatterAnswersRegistrationPage_type_info = new List<String>{
            'chatterAnswersRegistrationPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] clickjackProtectionLevel_type_info = new List<String>{
            'clickjackProtectionLevel',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] contentSniffingProtection_type_info = new List<String>{
            'contentSniffingProtection',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] cspUpgradeInsecureRequests_type_info = new List<String>{
            'cspUpgradeInsecureRequests',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] customWebAddresses_type_info = new List<String>{
            'customWebAddresses',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] favoriteIcon_type_info = new List<String>{
            'favoriteIcon',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] fileNotFoundPage_type_info = new List<String>{
            'fileNotFoundPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] forgotPasswordPage_type_info = new List<String>{
            'forgotPasswordPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] genericErrorPage_type_info = new List<String>{
            'genericErrorPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] guestProfile_type_info = new List<String>{
            'guestProfile',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] inMaintenancePage_type_info = new List<String>{
            'inMaintenancePage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] inactiveIndexPage_type_info = new List<String>{
            'inactiveIndexPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] indexPage_type_info = new List<String>{ 'indexPage', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] masterLabel_type_info = new List<String>{ 'masterLabel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] myProfilePage_type_info = new List<String>{
            'myProfilePage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] portal_type_info = new List<String>{ 'portal', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] referrerPolicyOriginWhenCrossOrigin_type_info = new List<String>{
            'referrerPolicyOriginWhenCrossOrigin',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] requireHttps_type_info = new List<String>{
            'requireHttps',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] requireInsecurePortalAccess_type_info = new List<String>{
            'requireInsecurePortalAccess',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] robotsTxtPage_type_info = new List<String>{
            'robotsTxtPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] rootComponent_type_info = new List<String>{
            'rootComponent',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] selfRegPage_type_info = new List<String>{ 'selfRegPage', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] serverIsDown_type_info = new List<String>{
            'serverIsDown',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] siteAdmin_type_info = new List<String>{ 'siteAdmin', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] siteRedirectMappings_type_info = new List<String>{
            'siteRedirectMappings',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] siteTemplate_type_info = new List<String>{
            'siteTemplate',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] siteType_type_info = new List<String>{ 'siteType', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] subdomain_type_info = new List<String>{ 'subdomain', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] urlPathPrefix_type_info = new List<String>{
            'urlPathPrefix',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'active',
            'allowHomePage',
            'allowStandardAnswersPages',
            'allowStandardIdeasPages',
            'allowStandardLookups',
            'allowStandardPortalPages',
            'allowStandardSearch',
            'analyticsTrackingCode',
            'authorizationRequiredPage',
            'bandwidthExceededPage',
            'browserXssProtection',
            'changePasswordPage',
            'chatterAnswersForgotPasswordConfirmPage',
            'chatterAnswersForgotPasswordPage',
            'chatterAnswersHelpPage',
            'chatterAnswersLoginPage',
            'chatterAnswersRegistrationPage',
            'clickjackProtectionLevel',
            'contentSniffingProtection',
            'cspUpgradeInsecureRequests',
            'customWebAddresses',
            'description',
            'favoriteIcon',
            'fileNotFoundPage',
            'forgotPasswordPage',
            'genericErrorPage',
            'guestProfile',
            'inMaintenancePage',
            'inactiveIndexPage',
            'indexPage',
            'masterLabel',
            'myProfilePage',
            'portal',
            'referrerPolicyOriginWhenCrossOrigin',
            'requireHttps',
            'requireInsecurePortalAccess',
            'robotsTxtPage',
            'rootComponent',
            'selfRegPage',
            'serverIsDown',
            'siteAdmin',
            'siteRedirectMappings',
            'siteTemplate',
            'siteType',
            'subdomain',
            'urlPathPrefix'
        };
    }
    public class PermissionSetUserPermission {
        public Boolean enabled;
        public String name;
        private String[] enabled_type_info = new List<String>{ 'enabled', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'enabled', 'name' };
    }
    public class SharingRecalculation {
        public String className;
        private String[] className_type_info = new List<String>{ 'className', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'className' };
    }
    public class CustomLabels extends Metadata {
        public String type = 'CustomLabels';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public MetadataService.CustomLabel[] labels;
        private String[] labels_type_info = new List<String>{ 'labels', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{ 'fullName', 'labels' };
    }
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new List<String>{ 'sessionId', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'sessionId' };
    }
    public class deployRecentValidationResponse_element {
        public String result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class deployRecentValidation_element {
        public String validationId;
        private String[] validationId_type_info = new List<String>{
            'validationId',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'validationId' };
    }
    public class ProfileCustomPermissions {
        public Boolean enabled;
        public String name;
        private String[] enabled_type_info = new List<String>{ 'enabled', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'enabled', 'name' };
    }
    public class ProfileLayoutAssignment {
        public String layout;
        public String recordType;
        private String[] layout_type_info = new List<String>{ 'layout', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] recordType_type_info = new List<String>{ 'recordType', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'layout', 'recordType' };
    }
    public class ProfileRecordTypeVisibility {
        public Boolean default_x;
        public Boolean personAccountDefault;
        public String recordType;
        public Boolean visible;
        private String[] default_x_type_info = new List<String>{ 'default', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] personAccountDefault_type_info = new List<String>{
            'personAccountDefault',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] recordType_type_info = new List<String>{ 'recordType', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] visible_type_info = new List<String>{ 'visible', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'default_x',
            'personAccountDefault',
            'recordType',
            'visible'
        };
    }
    public class ProfileTabVisibility {
        public String tab;
        public String visibility;
        private String[] tab_type_info = new List<String>{ 'tab', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] visibility_type_info = new List<String>{ 'visibility', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'tab', 'visibility' };
    }
    public class Profile extends Metadata {
        public String type = 'Profile';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public MetadataService.ProfileApplicationVisibility[] applicationVisibilities;
        public MetadataService.ProfileCategoryGroupVisibility[] categoryGroupVisibilities;
        public MetadataService.ProfileApexClassAccess[] classAccesses;
        public Boolean custom;
        public MetadataService.ProfileCustomPermissions[] customPermissions;
        public String description;
        public MetadataService.ProfileExternalDataSourceAccess[] externalDataSourceAccesses;
        public MetadataService.ProfileFieldLevelSecurity[] fieldPermissions;
        public MetadataService.ProfileLayoutAssignment[] layoutAssignments;
        public MetadataService.ProfileLoginHours loginHours;
        public MetadataService.ProfileLoginIpRange[] loginIpRanges;
        public MetadataService.ProfileObjectPermissions[] objectPermissions;
        public MetadataService.ProfileApexPageAccess[] pageAccesses;
        public MetadataService.ProfileActionOverride[] profileActionOverrides;
        public MetadataService.ProfileRecordTypeVisibility[] recordTypeVisibilities;
        public MetadataService.ProfileTabVisibility[] tabVisibilities;
        public String userLicense;
        public MetadataService.ProfileUserPermission[] userPermissions;
        private String[] applicationVisibilities_type_info = new List<String>{
            'applicationVisibilities',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] categoryGroupVisibilities_type_info = new List<String>{
            'categoryGroupVisibilities',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] classAccesses_type_info = new List<String>{
            'classAccesses',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] custom_type_info = new List<String>{ 'custom', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] customPermissions_type_info = new List<String>{
            'customPermissions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] externalDataSourceAccesses_type_info = new List<String>{
            'externalDataSourceAccesses',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] fieldPermissions_type_info = new List<String>{
            'fieldPermissions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] layoutAssignments_type_info = new List<String>{
            'layoutAssignments',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] loginHours_type_info = new List<String>{ 'loginHours', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] loginIpRanges_type_info = new List<String>{
            'loginIpRanges',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] objectPermissions_type_info = new List<String>{
            'objectPermissions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] pageAccesses_type_info = new List<String>{
            'pageAccesses',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] profileActionOverrides_type_info = new List<String>{
            'profileActionOverrides',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] recordTypeVisibilities_type_info = new List<String>{
            'recordTypeVisibilities',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] tabVisibilities_type_info = new List<String>{
            'tabVisibilities',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] userLicense_type_info = new List<String>{ 'userLicense', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] userPermissions_type_info = new List<String>{
            'userPermissions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'applicationVisibilities',
            'categoryGroupVisibilities',
            'classAccesses',
            'custom',
            'customPermissions',
            'description',
            'externalDataSourceAccesses',
            'fieldPermissions',
            'layoutAssignments',
            'loginHours',
            'loginIpRanges',
            'objectPermissions',
            'pageAccesses',
            'profileActionOverrides',
            'recordTypeVisibilities',
            'tabVisibilities',
            'userLicense',
            'userPermissions'
        };
    }
    public class ProfileLoginHours {
        public String fridayEnd;
        public String fridayStart;
        public String mondayEnd;
        public String mondayStart;
        public String saturdayEnd;
        public String saturdayStart;
        public String sundayEnd;
        public String sundayStart;
        public String thursdayEnd;
        public String thursdayStart;
        public String tuesdayEnd;
        public String tuesdayStart;
        public String wednesdayEnd;
        public String wednesdayStart;
        private String[] fridayEnd_type_info = new List<String>{ 'fridayEnd', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] fridayStart_type_info = new List<String>{ 'fridayStart', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] mondayEnd_type_info = new List<String>{ 'mondayEnd', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] mondayStart_type_info = new List<String>{ 'mondayStart', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] saturdayEnd_type_info = new List<String>{ 'saturdayEnd', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] saturdayStart_type_info = new List<String>{
            'saturdayStart',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] sundayEnd_type_info = new List<String>{ 'sundayEnd', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] sundayStart_type_info = new List<String>{ 'sundayStart', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] thursdayEnd_type_info = new List<String>{ 'thursdayEnd', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] thursdayStart_type_info = new List<String>{
            'thursdayStart',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] tuesdayEnd_type_info = new List<String>{ 'tuesdayEnd', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] tuesdayStart_type_info = new List<String>{
            'tuesdayStart',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] wednesdayEnd_type_info = new List<String>{
            'wednesdayEnd',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] wednesdayStart_type_info = new List<String>{
            'wednesdayStart',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'fridayEnd',
            'fridayStart',
            'mondayEnd',
            'mondayStart',
            'saturdayEnd',
            'saturdayStart',
            'sundayEnd',
            'sundayStart',
            'thursdayEnd',
            'thursdayStart',
            'tuesdayEnd',
            'tuesdayStart',
            'wednesdayEnd',
            'wednesdayStart'
        };
    }
    public class PermissionSetFieldPermissions {
        public Boolean editable;
        public String field;
        public Boolean readable;
        private String[] editable_type_info = new List<String>{ 'editable', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] field_type_info = new List<String>{ 'field', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] readable_type_info = new List<String>{ 'readable', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'editable', 'field', 'readable' };
    }
    public class AccountSharingRuleSettings {
        public String caseAccessLevel;
        public String contactAccessLevel;
        public String opportunityAccessLevel;
        private String[] caseAccessLevel_type_info = new List<String>{
            'caseAccessLevel',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] contactAccessLevel_type_info = new List<String>{
            'contactAccessLevel',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] opportunityAccessLevel_type_info = new List<String>{
            'opportunityAccessLevel',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'caseAccessLevel',
            'contactAccessLevel',
            'opportunityAccessLevel'
        };
    }
    public class CustomMetadataValue {
        public String field;
        public String value;
        private String[] field_type_info = new List<String>{ 'field', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] value_type_info = new List<String>{ 'value', SOAP_M_URI, null, '1', '1', 'true' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'field', 'value' };
    }
    public class AsyncResult {
        public Boolean done;
        public String id;
        public String message;
        public String state;
        public String statusCode;
        private String[] done_type_info = new List<String>{ 'done', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] id_type_info = new List<String>{ 'id', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] message_type_info = new List<String>{ 'message', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] state_type_info = new List<String>{ 'state', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] statusCode_type_info = new List<String>{ 'statusCode', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'done', 'id', 'message', 'state', 'statusCode' };
    }
    public class CustomLabel extends Metadata {
        public String type = 'CustomLabel';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String categories;
        public String language;
        public Boolean protected_x;
        public String shortDescription;
        public String value;
        private String[] categories_type_info = new List<String>{ 'categories', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] language_type_info = new List<String>{ 'language', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] protected_x_type_info = new List<String>{ 'protected', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] shortDescription_type_info = new List<String>{
            'shortDescription',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] value_type_info = new List<String>{ 'value', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'categories',
            'language',
            'protected_x',
            'shortDescription',
            'value'
        };
    }
    public class checkRetrieveStatusResponse_element {
        public MetadataService.RetrieveResult result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class retrieveResponse_element {
        public MetadataService.AsyncResult result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class upsertMetadataResponse_element {
        public MetadataService.UpsertResult[] result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class PermissionSetRecordTypeVisibility {
        public String recordType;
        public Boolean visible;
        private String[] recordType_type_info = new List<String>{ 'recordType', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] visible_type_info = new List<String>{ 'visible', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'recordType', 'visible' };
    }
    public class cancelDeploy_element {
        public String String_x;
        private String[] String_x_type_info = new List<String>{ 'String', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'String_x' };
    }
    public class PermissionSet extends Metadata {
        public String type = 'PermissionSet';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public MetadataService.PermissionSetApplicationVisibility[] applicationVisibilities;
        public MetadataService.PermissionSetApexClassAccess[] classAccesses;
        public MetadataService.PermissionSetCustomPermissions[] customPermissions;
        public String description;
        public MetadataService.PermissionSetExternalDataSourceAccess[] externalDataSourceAccesses;
        public MetadataService.PermissionSetFieldPermissions[] fieldPermissions;
        public Boolean hasActivationRequired;
        public String label;
        public String license;
        public MetadataService.PermissionSetObjectPermissions[] objectPermissions;
        public MetadataService.PermissionSetApexPageAccess[] pageAccesses;
        public MetadataService.PermissionSetRecordTypeVisibility[] recordTypeVisibilities;
        public MetadataService.PermissionSetTabSetting[] tabSettings;
        public MetadataService.PermissionSetUserPermission[] userPermissions;
        private String[] applicationVisibilities_type_info = new List<String>{
            'applicationVisibilities',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] classAccesses_type_info = new List<String>{
            'classAccesses',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] customPermissions_type_info = new List<String>{
            'customPermissions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] externalDataSourceAccesses_type_info = new List<String>{
            'externalDataSourceAccesses',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] fieldPermissions_type_info = new List<String>{
            'fieldPermissions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] hasActivationRequired_type_info = new List<String>{
            'hasActivationRequired',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] license_type_info = new List<String>{ 'license', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] objectPermissions_type_info = new List<String>{
            'objectPermissions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] pageAccesses_type_info = new List<String>{
            'pageAccesses',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] recordTypeVisibilities_type_info = new List<String>{
            'recordTypeVisibilities',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] tabSettings_type_info = new List<String>{
            'tabSettings',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] userPermissions_type_info = new List<String>{
            'userPermissions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'applicationVisibilities',
            'classAccesses',
            'customPermissions',
            'description',
            'externalDataSourceAccesses',
            'fieldPermissions',
            'hasActivationRequired',
            'label',
            'license',
            'objectPermissions',
            'pageAccesses',
            'recordTypeVisibilities',
            'tabSettings',
            'userPermissions'
        };
    }
    public class PermissionSetApexClassAccess {
        public String apexClass;
        public Boolean enabled;
        private String[] apexClass_type_info = new List<String>{ 'apexClass', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] enabled_type_info = new List<String>{ 'enabled', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'apexClass', 'enabled' };
    }
    public class FieldMapping {
        public String SObjectType;
        public String developerName;
        public MetadataService.FieldMappingRow[] fieldMappingRows;
        public String masterLabel;
        private String[] SObjectType_type_info = new List<String>{ 'SObjectType', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] developerName_type_info = new List<String>{
            'developerName',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] fieldMappingRows_type_info = new List<String>{
            'fieldMappingRows',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] masterLabel_type_info = new List<String>{ 'masterLabel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'SObjectType',
            'developerName',
            'fieldMappingRows',
            'masterLabel'
        };
    }
    public class ObjectMapping {
        public String inputObject;
        public MetadataService.ObjectMappingField[] mappingFields;
        public String outputObject;
        private String[] inputObject_type_info = new List<String>{ 'inputObject', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] mappingFields_type_info = new List<String>{
            'mappingFields',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] outputObject_type_info = new List<String>{
            'outputObject',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'inputObject', 'mappingFields', 'outputObject' };
    }
    public class RecordType extends Metadata {
        public String type = 'RecordType';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public Boolean active;
        public String businessProcess;
        public String compactLayoutAssignment;
        public String description;
        public String label;
        private String[] active_type_info = new List<String>{ 'active', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] businessProcess_type_info = new List<String>{
            'businessProcess',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] compactLayoutAssignment_type_info = new List<String>{
            'compactLayoutAssignment',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] picklistValues_type_info = new List<String>{
            'picklistValues',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'active',
            'businessProcess',
            'compactLayoutAssignment',
            'description',
            'label',
            'picklistValues'
        };
    }
    public class FieldOverride {
        public String field;
        public String formula;
        public String literalValue;
        private String[] field_type_info = new List<String>{ 'field', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] formula_type_info = new List<String>{ 'formula', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] literalValue_type_info = new List<String>{
            'literalValue',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'field', 'formula', 'literalValue' };
    }
    public class SharingSet extends Metadata {
        public String type = 'SharingSet';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String description;
        public String name;
        public String[] profiles;
        private String[] accessMappings_type_info = new List<String>{
            'accessMappings',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] profiles_type_info = new List<String>{ 'profiles', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'accessMappings',
            'description',
            'name',
            'profiles'
        };
    }
    public class Error {
        public MetadataService.ExtendedErrorDetails[] extendedErrorDetails;
        public String[] fields;
        public String message;
        public String statusCode;
        private String[] extendedErrorDetails_type_info = new List<String>{
            'extendedErrorDetails',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] fields_type_info = new List<String>{ 'fields', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] message_type_info = new List<String>{ 'message', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] statusCode_type_info = new List<String>{ 'statusCode', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'extendedErrorDetails',
            'fields',
            'message',
            'statusCode'
        };
    }
    public class updateMetadata_element {
        public MetadataService.Metadata[] metadata;
        private String[] metadata_type_info = new List<String>{ 'metadata', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'metadata' };
    }
    public class upsertMetadata_element {
        public MetadataService.Metadata[] metadata;
        private String[] metadata_type_info = new List<String>{ 'metadata', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'metadata' };
    }
    public class ProfileExternalDataSourceAccess {
        public Boolean enabled;
        public String externalDataSource;
        private String[] enabled_type_info = new List<String>{ 'enabled', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] externalDataSource_type_info = new List<String>{
            'externalDataSource',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'enabled', 'externalDataSource' };
    }
    public class ValueTypeField {
        public MetadataService.ValueTypeField[] fields;
        public String[] foreignKeyDomain;
        public Boolean isForeignKey;
        public Boolean isNameField;
        public Integer minOccurs;
        public String name;
        public String soapType;
        public Boolean valueRequired;
        private String[] fields_type_info = new List<String>{ 'fields', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] foreignKeyDomain_type_info = new List<String>{
            'foreignKeyDomain',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] isForeignKey_type_info = new List<String>{
            'isForeignKey',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] isNameField_type_info = new List<String>{ 'isNameField', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] minOccurs_type_info = new List<String>{ 'minOccurs', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] picklistValues_type_info = new List<String>{
            'picklistValues',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] soapType_type_info = new List<String>{ 'soapType', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] valueRequired_type_info = new List<String>{
            'valueRequired',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'fields',
            'foreignKeyDomain',
            'isForeignKey',
            'isNameField',
            'minOccurs',
            'name',
            'picklistValues',
            'soapType',
            'valueRequired'
        };
    }
    public class renameMetadata_element {
        public String type_x;
        public String oldFullName;
        public String newFullName;
        private String[] type_x_type_info = new List<String>{ 'type', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] oldFullName_type_info = new List<String>{ 'oldFullName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] newFullName_type_info = new List<String>{ 'newFullName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'type_x', 'oldFullName', 'newFullName' };
    }
    public class CustomField extends Metadata {
        public String type = 'CustomField';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String businessOwnerGroup;
        public String businessOwnerUser;
        public String businessStatus;
        public Boolean caseSensitive;
        public String customDataType;
        public String defaultValue;
        public String deleteConstraint;
        public String description;
        public String displayFormat;
        public Boolean displayLocationInDecimal;
        public Boolean encrypted;
        public Boolean escapeMarkup;
        public String externalDeveloperName;
        public Boolean externalId;
        public String fieldManageability;
        public String formula;
        public String formulaTreatBlanksAs;
        public String inlineHelpText;
        public Boolean isConvertLeadDisabled;
        public Boolean isFilteringDisabled;
        public Boolean isNameField;
        public Boolean isSortingDisabled;
        public String label;
        public Integer length;
        public String maskChar;
        public String maskType;
        public String metadataRelationshipControllingField;
        public Boolean populateExistingRows;
        public Integer precision;
        public String referenceTargetField;
        public String referenceTo;
        public String relationshipLabel;
        public String relationshipName;
        public Integer relationshipOrder;
        public Boolean reparentableMasterDetail;
        public Boolean required;
        public Boolean restrictedAdminField;
        public Integer scale;
        public String securityClassification;
        public Integer startingNumber;
        public Boolean stripMarkup;
        public String summarizedField;
        public String summaryForeignKey;
        public String summaryOperation;
        public Boolean trackFeedHistory;
        public Boolean trackHistory;
        public Boolean trackTrending;
        public String type_x;
        public Boolean unique;
        public Integer visibleLines;
        public Boolean writeRequiresMasterRead;
        private String[] businessOwnerGroup_type_info = new List<String>{
            'businessOwnerGroup',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] businessOwnerUser_type_info = new List<String>{
            'businessOwnerUser',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] businessStatus_type_info = new List<String>{
            'businessStatus',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] caseSensitive_type_info = new List<String>{
            'caseSensitive',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] customDataType_type_info = new List<String>{
            'customDataType',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] defaultValue_type_info = new List<String>{
            'defaultValue',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] deleteConstraint_type_info = new List<String>{
            'deleteConstraint',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] deprecated_type_info = new List<String>{ 'deprecated', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] displayFormat_type_info = new List<String>{
            'displayFormat',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] displayLocationInDecimal_type_info = new List<String>{
            'displayLocationInDecimal',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] encrypted_type_info = new List<String>{ 'encrypted', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] escapeMarkup_type_info = new List<String>{
            'escapeMarkup',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] externalDeveloperName_type_info = new List<String>{
            'externalDeveloperName',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] externalId_type_info = new List<String>{ 'externalId', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] fieldManageability_type_info = new List<String>{
            'fieldManageability',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] formula_type_info = new List<String>{ 'formula', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] formulaTreatBlanksAs_type_info = new List<String>{
            'formulaTreatBlanksAs',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] inlineHelpText_type_info = new List<String>{
            'inlineHelpText',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] isConvertLeadDisabled_type_info = new List<String>{
            'isConvertLeadDisabled',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] isFilteringDisabled_type_info = new List<String>{
            'isFilteringDisabled',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] isNameField_type_info = new List<String>{ 'isNameField', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] isSortingDisabled_type_info = new List<String>{
            'isSortingDisabled',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] length_type_info = new List<String>{ 'length', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] lookupFilter_type_info = new List<String>{
            'lookupFilter',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] maskChar_type_info = new List<String>{ 'maskChar', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] maskType_type_info = new List<String>{ 'maskType', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] metadataRelationshipControllingField_type_info = new List<String>{
            'metadataRelationshipControllingField',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] populateExistingRows_type_info = new List<String>{
            'populateExistingRows',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] precision_type_info = new List<String>{ 'precision', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] referenceTargetField_type_info = new List<String>{
            'referenceTargetField',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] referenceTo_type_info = new List<String>{ 'referenceTo', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] relationshipLabel_type_info = new List<String>{
            'relationshipLabel',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] relationshipName_type_info = new List<String>{
            'relationshipName',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] relationshipOrder_type_info = new List<String>{
            'relationshipOrder',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] reparentableMasterDetail_type_info = new List<String>{
            'reparentableMasterDetail',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] required_type_info = new List<String>{ 'required', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] restrictedAdminField_type_info = new List<String>{
            'restrictedAdminField',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] scale_type_info = new List<String>{ 'scale', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] securityClassification_type_info = new List<String>{
            'securityClassification',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] startingNumber_type_info = new List<String>{
            'startingNumber',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] stripMarkup_type_info = new List<String>{ 'stripMarkup', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] summarizedField_type_info = new List<String>{
            'summarizedField',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] summaryFilterItems_type_info = new List<String>{
            'summaryFilterItems',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] summaryForeignKey_type_info = new List<String>{
            'summaryForeignKey',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] summaryOperation_type_info = new List<String>{
            'summaryOperation',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] trackFeedHistory_type_info = new List<String>{
            'trackFeedHistory',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] trackHistory_type_info = new List<String>{
            'trackHistory',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] trackTrending_type_info = new List<String>{
            'trackTrending',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] type_x_type_info = new List<String>{ 'type', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] unique_type_info = new List<String>{ 'unique', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] valueSet_type_info = new List<String>{ 'valueSet', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] visibleLines_type_info = new List<String>{
            'visibleLines',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] writeRequiresMasterRead_type_info = new List<String>{
            'writeRequiresMasterRead',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'businessOwnerGroup',
            'businessOwnerUser',
            'businessStatus',
            'caseSensitive',
            'customDataType',
            'defaultValue',
            'deleteConstraint',
            'deprecated',
            'description',
            'displayFormat',
            'displayLocationInDecimal',
            'encrypted',
            'escapeMarkup',
            'externalDeveloperName',
            'externalId',
            'fieldManageability',
            'formula',
            'formulaTreatBlanksAs',
            'inlineHelpText',
            'isConvertLeadDisabled',
            'isFilteringDisabled',
            'isNameField',
            'isSortingDisabled',
            'label',
            'length',
            'lookupFilter',
            'maskChar',
            'maskType',
            'metadataRelationshipControllingField',
            'populateExistingRows',
            'precision',
            'referenceTargetField',
            'referenceTo',
            'relationshipLabel',
            'relationshipName',
            'relationshipOrder',
            'reparentableMasterDetail',
            'required',
            'restrictedAdminField',
            'scale',
            'securityClassification',
            'startingNumber',
            'stripMarkup',
            'summarizedField',
            'summaryFilterItems',
            'summaryForeignKey',
            'summaryOperation',
            'trackFeedHistory',
            'trackHistory',
            'trackTrending',
            'type_x',
            'unique',
            'valueSet',
            'visibleLines',
            'writeRequiresMasterRead'
        };
    }
    public class ApexClass extends MetadataWithContent {
        public String type = 'ApexClass';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String content;
        private String[] content_type_info = new List<String>{ 'content', SOAP_M_URI, null, '0', '1', 'false' };
        public Double apiVersion;
        public MetadataService.PackageVersion[] packageVersions;
        public String status;
        private String[] apiVersion_type_info = new List<String>{ 'apiVersion', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] packageVersions_type_info = new List<String>{
            'packageVersions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] status_type_info = new List<String>{ 'status', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'content',
            'apiVersion',
            'packageVersions',
            'status'
        };
    }
    public class FieldMappingRow {
        public String SObjectType;
        public MetadataService.FieldMappingField[] fieldMappingFields;
        public String fieldName;
        public String mappingOperation;
        private String[] SObjectType_type_info = new List<String>{ 'SObjectType', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] fieldMappingFields_type_info = new List<String>{
            'fieldMappingFields',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] fieldName_type_info = new List<String>{ 'fieldName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] mappingOperation_type_info = new List<String>{
            'mappingOperation',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'SObjectType',
            'fieldMappingFields',
            'fieldName',
            'mappingOperation'
        };
    }
    public virtual class Metadata {
        public String fullName;
    }
    public class PermissionSetApexPageAccess {
        public String apexPage;
        public Boolean enabled;
        private String[] apexPage_type_info = new List<String>{ 'apexPage', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] enabled_type_info = new List<String>{ 'enabled', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'apexPage', 'enabled' };
    }
    public class describeMetadata_element {
        public Double asOfVersion;
        private String[] asOfVersion_type_info = new List<String>{ 'asOfVersion', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'asOfVersion' };
    }
    public class PermissionSetExternalDataSourceAccess {
        public Boolean enabled;
        public String externalDataSource;
        private String[] enabled_type_info = new List<String>{ 'enabled', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] externalDataSource_type_info = new List<String>{
            'externalDataSource',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'enabled', 'externalDataSource' };
    }
    public class CustomDataType extends Metadata {
        public String type = 'CustomDataType';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public MetadataService.CustomDataTypeComponent[] customDataTypeComponents;
        public String description;
        public String displayFormula;
        public Boolean editComponentsOnSeparateLines;
        public String label;
        public Boolean rightAligned;
        public Boolean supportComponentsInReports;
        private String[] customDataTypeComponents_type_info = new List<String>{
            'customDataTypeComponents',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] displayFormula_type_info = new List<String>{
            'displayFormula',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] editComponentsOnSeparateLines_type_info = new List<String>{
            'editComponentsOnSeparateLines',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] rightAligned_type_info = new List<String>{
            'rightAligned',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] supportComponentsInReports_type_info = new List<String>{
            'supportComponentsInReports',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'customDataTypeComponents',
            'description',
            'displayFormula',
            'editComponentsOnSeparateLines',
            'label',
            'rightAligned',
            'supportComponentsInReports'
        };
    }
    public class createMetadataResponse_element {
        public MetadataService.SaveResult[] result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ProfileActionOverride {
        public String actionName;
        public String content;
        public String formFactor;
        public String pageOrSobjectType;
        public String recordType;
        public String type_x;
        private String[] actionName_type_info = new List<String>{ 'actionName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] content_type_info = new List<String>{ 'content', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] formFactor_type_info = new List<String>{ 'formFactor', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] pageOrSobjectType_type_info = new List<String>{
            'pageOrSobjectType',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] recordType_type_info = new List<String>{ 'recordType', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] type_x_type_info = new List<String>{ 'type', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'actionName',
            'content',
            'formFactor',
            'pageOrSobjectType',
            'recordType',
            'type_x'
        };
    }
    public class readMetadata_element {
        public String type_x;
        public String[] fullNames;
        private String[] type_x_type_info = new List<String>{ 'type', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] fullNames_type_info = new List<String>{ 'fullNames', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'type_x', 'fullNames' };
    }
    public class updateMetadataResponse_element {
        public MetadataService.SaveResult[] result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ObjectMappingField {
        public String inputField;
        public String outputField;
        private String[] inputField_type_info = new List<String>{ 'inputField', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] outputField_type_info = new List<String>{ 'outputField', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'inputField', 'outputField' };
    }
    public class PermissionSetCustomPermissions {
        public Boolean enabled;
        public String name;
        private String[] enabled_type_info = new List<String>{ 'enabled', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'enabled', 'name' };
    }
    public class deleteMetadata_element {
        public String type_x;
        public String[] fullNames;
        private String[] type_x_type_info = new List<String>{ 'type', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] fullNames_type_info = new List<String>{ 'fullNames', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'type_x', 'fullNames' };
    }
    public class PackageVersion {
        public Integer majorNumber;
        public Integer minorNumber;
        public String namespace;
        private String[] majorNumber_type_info = new List<String>{ 'majorNumber', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] minorNumber_type_info = new List<String>{ 'minorNumber', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] namespace_type_info = new List<String>{ 'namespace', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'majorNumber', 'minorNumber', 'namespace' };
    }
    public class ApexComponent extends MetadataWithContent {
        public String type = 'ApexComponent';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String content;
        private String[] content_type_info = new List<String>{ 'content', SOAP_M_URI, null, '0', '1', 'false' };
        public Double apiVersion;
        public String description;
        public String label;
        private String[] apiVersion_type_info = new List<String>{ 'apiVersion', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] packageVersions_type_info = new List<String>{
            'packageVersions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'content',
            'apiVersion',
            'description',
            'label',
            'packageVersions'
        };
    }
    public class ApexPage extends MetadataWithContent {
        public String type = 'ApexPage';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String content;
        private String[] content_type_info = new List<String>{ 'content', SOAP_M_URI, null, '0', '1', 'false' };
        public Double apiVersion;
        public Boolean availableInTouch;
        public Boolean confirmationTokenRequired;
        public String description;
        public String label;
        public MetadataService.PackageVersion[] packageVersions;
        private String[] apiVersion_type_info = new List<String>{ 'apiVersion', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] availableInTouch_type_info = new List<String>{
            'availableInTouch',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] confirmationTokenRequired_type_info = new List<String>{
            'confirmationTokenRequired',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] packageVersions_type_info = new List<String>{
            'packageVersions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'content',
            'apiVersion',
            'availableInTouch',
            'confirmationTokenRequired',
            'description',
            'label',
            'packageVersions'
        };
    }
    public class ApexTrigger extends MetadataWithContent {
        public String type = 'ApexTrigger';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String content;
        private String[] content_type_info = new List<String>{ 'content', SOAP_M_URI, null, '0', '1', 'false' };
        public Double apiVersion;
        public String status;
        private String[] apiVersion_type_info = new List<String>{ 'apiVersion', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] packageVersions_type_info = new List<String>{
            'packageVersions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] status_type_info = new List<String>{ 'status', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'content',
            'apiVersion',
            'packageVersions',
            'status'
        };
    }
    public class renameMetadataResponse_element {
        public MetadataService.SaveResult result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public interface IReadResult {
        MetadataService.Metadata[] getRecords();
    }
    public interface IReadResponseElement {
        IReadResult getResult();
    }
    public class ReadCustomFieldResult implements IReadResult {
        public MetadataService.CustomField[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readCustomFieldResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomFieldResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadRecordTypeResult implements IReadResult {
        public MetadataService.RecordType[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class ReadCustomObjectResult implements IReadResult {
        public MetadataService.CustomObject[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readCustomObjectResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomObjectResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadScontrolResult implements IReadResult {
        public MetadataService.Scontrol[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readScontrolResponse_element implements IReadResponseElement {
        public MetadataService.ReadScontrolResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadApexPageResult implements IReadResult {
        public MetadataService.ApexPage[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readApexPageResponse_element implements IReadResponseElement {
        public MetadataService.ReadApexPageResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadApexComponentResult implements IReadResult {
        public MetadataService.ApexComponent[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readApexComponentResponse_element implements IReadResponseElement {
        public MetadataService.ReadApexComponentResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadApexClassResult implements IReadResult {
        public MetadataService.ApexClass[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readApexClassResponse_element implements IReadResponseElement {
        public MetadataService.ReadApexClassResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadApexTriggerResult implements IReadResult {
        public MetadataService.ApexTrigger[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readApexTriggerResponse_element implements IReadResponseElement {
        public MetadataService.ReadApexTriggerResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadStaticResourceResult implements IReadResult {
        public MetadataService.StaticResource[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readStaticResourceResponse_element implements IReadResponseElement {
        public MetadataService.ReadStaticResourceResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadCustomLabelsResult implements IReadResult {
        public MetadataService.CustomLabels[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readCustomLabelsResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomLabelsResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadCustomLabelResult implements IReadResult {
        public MetadataService.CustomLabel[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readCustomLabelResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomLabelResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadCustomDataTypeResult implements IReadResult {
        public MetadataService.CustomDataType[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readCustomDataTypeResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomDataTypeResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadProfileResult implements IReadResult {
        public MetadataService.Profile[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readProfileResponse_element implements IReadResponseElement {
        public MetadataService.ReadProfileResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadPermissionSetResult implements IReadResult {
        public MetadataService.PermissionSet[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readPermissionSetResponse_element implements IReadResponseElement {
        public MetadataService.ReadPermissionSetResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadRemoteSiteSettingResult implements IReadResult {
        public MetadataService.RemoteSiteSetting[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readRemoteSiteSettingResponse_element implements IReadResponseElement {
        public MetadataService.ReadRemoteSiteSettingResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadCustomMetadataResult implements IReadResult {
        public MetadataService.CustomMetadata[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readCustomMetadataResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomMetadataResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadLeadConvertSettingsResult implements IReadResult {
        public MetadataService.LeadConvertSettings[] records;
        public MetadataService.Metadata[] getRecords() {
            return records;
        }
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class readLeadConvertSettingsResponse_element implements IReadResponseElement {
        public MetadataService.ReadLeadConvertSettingsResult result;
        public IReadResult getResult() {
            return result;
        }
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class ReadResult {
        public MetadataService.Metadata[] records;
        private String[] records_type_info = new List<String>{ 'records', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'records' };
    }
    public class ProfileApexPageAccess {
        public String apexPage;
        public Boolean enabled;
        private String[] apexPage_type_info = new List<String>{ 'apexPage', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] enabled_type_info = new List<String>{ 'enabled', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'apexPage', 'enabled' };
    }
    public class Scontrol extends MetadataWithContent {
        public String type = 'Scontrol';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String content;
        private String[] content_type_info = new List<String>{ 'content', SOAP_M_URI, null, '0', '1', 'false' };
        public String contentSource;
        public String description;
        public String encodingKey;
        public String fileContent;
        public String fileName;
        public String name;
        public Boolean supportsCaching;
        private String[] contentSource_type_info = new List<String>{
            'contentSource',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] encodingKey_type_info = new List<String>{ 'encodingKey', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] fileContent_type_info = new List<String>{ 'fileContent', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] fileName_type_info = new List<String>{ 'fileName', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] supportsCaching_type_info = new List<String>{
            'supportsCaching',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'content',
            'contentSource',
            'description',
            'encodingKey',
            'fileContent',
            'fileName',
            'name',
            'supportsCaching'
        };
    }
    public class RetrieveResult {
        public Boolean done;
        public String errorMessage;
        public String errorStatusCode;
        public String id;
        public MetadataService.RetrieveMessage[] messages;
        public String status;
        public Boolean success;
        public String zipFile;
        private String[] done_type_info = new List<String>{ 'done', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] errorMessage_type_info = new List<String>{
            'errorMessage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] errorStatusCode_type_info = new List<String>{
            'errorStatusCode',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] fileProperties_type_info = new List<String>{
            'fileProperties',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] id_type_info = new List<String>{ 'id', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] messages_type_info = new List<String>{ 'messages', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] status_type_info = new List<String>{ 'status', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] success_type_info = new List<String>{ 'success', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] zipFile_type_info = new List<String>{ 'zipFile', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'done',
            'errorMessage',
            'errorStatusCode',
            'fileProperties',
            'id',
            'messages',
            'status',
            'success',
            'zipFile'
        };
    }
    public class Territory2Model extends Metadata {
        public String type = 'Territory2Model';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public MetadataService.FieldValue[] customFields;
        public String description;
        public String name;
        private String[] customFields_type_info = new List<String>{
            'customFields',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{ 'fullName', 'customFields', 'description', 'name' };
    }
    public class SearchSettingsByObject {
        public MetadataService.ObjectSearchSetting[] searchSettingsByObject;
        private String[] searchSettingsByObject_type_info = new List<String>{
            'searchSettingsByObject',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'searchSettingsByObject' };
    }
    public class CustomObject extends Metadata {
        public String type = 'CustomObject';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public Boolean allowInChatterGroups;
        public String compactLayoutAssignment;
        public String customHelp;
        public String customHelpPage;
        public String customSettingsType;
        public String dataStewardGroup;
        public String dataStewardUser;
        public String deploymentStatus;
        public String description;
        public Boolean enableActivities;
        public Boolean enableBulkApi;
        public Boolean enableChangeDataCapture;
        public Boolean enableDivisions;
        public Boolean enableEnhancedLookup;
        public Boolean enableFeeds;
        public Boolean enableHistory;
        public Boolean enableReports;
        public Boolean enableSearch;
        public Boolean enableSharing;
        public Boolean enableStreamingApi;
        public String eventType;
        public String externalDataSource;
        public String externalName;
        public String externalRepository;
        public String externalSharingModel;
        public MetadataService.CustomField[] fields;
        public String gender;
        public MetadataService.HistoryRetentionPolicy historyRetentionPolicy;
        public Boolean household;
        public String label;
        public MetadataService.CustomField nameField;
        public String pluralLabel;
        public Boolean recordTypeTrackFeedHistory;
        public Boolean recordTypeTrackHistory;
        public MetadataService.RecordType[] recordTypes;
        public String sharingModel;
        public MetadataService.SharingRecalculation[] sharingRecalculations;
        public String startsWith;
        public String visibility;
        private String[] actionOverrides_type_info = new List<String>{
            'actionOverrides',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] allowInChatterGroups_type_info = new List<String>{
            'allowInChatterGroups',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] articleTypeChannelDisplay_type_info = new List<String>{
            'articleTypeChannelDisplay',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] businessProcesses_type_info = new List<String>{
            'businessProcesses',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] compactLayoutAssignment_type_info = new List<String>{
            'compactLayoutAssignment',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] compactLayouts_type_info = new List<String>{
            'compactLayouts',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] customHelp_type_info = new List<String>{ 'customHelp', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] customHelpPage_type_info = new List<String>{
            'customHelpPage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] customSettingsType_type_info = new List<String>{
            'customSettingsType',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] dataStewardGroup_type_info = new List<String>{
            'dataStewardGroup',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] dataStewardUser_type_info = new List<String>{
            'dataStewardUser',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] deploymentStatus_type_info = new List<String>{
            'deploymentStatus',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] deprecated_type_info = new List<String>{ 'deprecated', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] enableActivities_type_info = new List<String>{
            'enableActivities',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableBulkApi_type_info = new List<String>{
            'enableBulkApi',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableChangeDataCapture_type_info = new List<String>{
            'enableChangeDataCapture',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableDivisions_type_info = new List<String>{
            'enableDivisions',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableEnhancedLookup_type_info = new List<String>{
            'enableEnhancedLookup',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableFeeds_type_info = new List<String>{ 'enableFeeds', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] enableHistory_type_info = new List<String>{
            'enableHistory',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableReports_type_info = new List<String>{
            'enableReports',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableSearch_type_info = new List<String>{
            'enableSearch',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableSharing_type_info = new List<String>{
            'enableSharing',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableStreamingApi_type_info = new List<String>{
            'enableStreamingApi',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] eventType_type_info = new List<String>{ 'eventType', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] externalDataSource_type_info = new List<String>{
            'externalDataSource',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] externalName_type_info = new List<String>{
            'externalName',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] externalRepository_type_info = new List<String>{
            'externalRepository',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] externalSharingModel_type_info = new List<String>{
            'externalSharingModel',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] fieldSets_type_info = new List<String>{ 'fieldSets', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] fields_type_info = new List<String>{ 'fields', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] gender_type_info = new List<String>{ 'gender', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] historyRetentionPolicy_type_info = new List<String>{
            'historyRetentionPolicy',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] household_type_info = new List<String>{ 'household', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] indexes_type_info = new List<String>{ 'indexes', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] listViews_type_info = new List<String>{ 'listViews', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] nameField_type_info = new List<String>{ 'nameField', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] pluralLabel_type_info = new List<String>{ 'pluralLabel', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] recordTypeTrackFeedHistory_type_info = new List<String>{
            'recordTypeTrackFeedHistory',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] recordTypeTrackHistory_type_info = new List<String>{
            'recordTypeTrackHistory',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] recordTypes_type_info = new List<String>{
            'recordTypes',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] searchLayouts_type_info = new List<String>{
            'searchLayouts',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] sharingModel_type_info = new List<String>{
            'sharingModel',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] sharingReasons_type_info = new List<String>{
            'sharingReasons',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] sharingRecalculations_type_info = new List<String>{
            'sharingRecalculations',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] startsWith_type_info = new List<String>{ 'startsWith', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] validationRules_type_info = new List<String>{
            'validationRules',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] visibility_type_info = new List<String>{ 'visibility', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] webLinks_type_info = new List<String>{ 'webLinks', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'actionOverrides',
            'allowInChatterGroups',
            'articleTypeChannelDisplay',
            'businessProcesses',
            'compactLayoutAssignment',
            'compactLayouts',
            'customHelp',
            'customHelpPage',
            'customSettingsType',
            'dataStewardGroup',
            'dataStewardUser',
            'deploymentStatus',
            'deprecated',
            'description',
            'enableActivities',
            'enableBulkApi',
            'enableChangeDataCapture',
            'enableDivisions',
            'enableEnhancedLookup',
            'enableFeeds',
            'enableHistory',
            'enableReports',
            'enableSearch',
            'enableSharing',
            'enableStreamingApi',
            'eventType',
            'externalDataSource',
            'externalName',
            'externalRepository',
            'externalSharingModel',
            'fieldSets',
            'fields',
            'gender',
            'historyRetentionPolicy',
            'household',
            'indexes',
            'label',
            'listViews',
            'nameField',
            'pluralLabel',
            'recordTypeTrackFeedHistory',
            'recordTypeTrackHistory',
            'recordTypes',
            'searchLayouts',
            'sharingModel',
            'sharingReasons',
            'sharingRecalculations',
            'startsWith',
            'validationRules',
            'visibility',
            'webLinks'
        };
    }
    public class DuplicateRuleFilter {
        public String booleanFilter;
        public MetadataService.DuplicateRuleFilterItem[] duplicateRuleFilterItems;
        private String[] booleanFilter_type_info = new List<String>{
            'booleanFilter',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'true'
        };
        private String[] duplicateRuleFilterItems_type_info = new List<String>{
            'duplicateRuleFilterItems',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'booleanFilter', 'duplicateRuleFilterItems' };
    }
    public class WaveRecipe {
        public String dataflow;
        public String masterLabel;
        public String securityPredicate;
        public String targetDatasetAlias;
        private String[] dataflow_type_info = new List<String>{ 'dataflow', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] masterLabel_type_info = new List<String>{ 'masterLabel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] securityPredicate_type_info = new List<String>{
            'securityPredicate',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] targetDatasetAlias_type_info = new List<String>{
            'targetDatasetAlias',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'dataflow',
            'masterLabel',
            'securityPredicate',
            'targetDatasetAlias'
        };
    }
    public class ProfileObjectPermissions {
        public Boolean allowCreate;
        public Boolean allowDelete;
        public Boolean allowEdit;
        public Boolean allowRead;
        public Boolean modifyAllRecords;
        public String object_x;
        public Boolean viewAllRecords;
        private String[] allowCreate_type_info = new List<String>{ 'allowCreate', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] allowDelete_type_info = new List<String>{ 'allowDelete', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] allowEdit_type_info = new List<String>{ 'allowEdit', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] allowRead_type_info = new List<String>{ 'allowRead', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] modifyAllRecords_type_info = new List<String>{
            'modifyAllRecords',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] object_x_type_info = new List<String>{ 'object', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] viewAllRecords_type_info = new List<String>{
            'viewAllRecords',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'allowCreate',
            'allowDelete',
            'allowEdit',
            'allowRead',
            'modifyAllRecords',
            'object_x',
            'viewAllRecords'
        };
    }
    public class ReportGrouping {
        public String aggregateType;
        public String dateGranularity;
        public String field;
        public String sortByName;
        public String sortOrder;
        public String sortType;
        private String[] aggregateType_type_info = new List<String>{
            'aggregateType',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] dateGranularity_type_info = new List<String>{
            'dateGranularity',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] field_type_info = new List<String>{ 'field', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] sortByName_type_info = new List<String>{ 'sortByName', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] sortOrder_type_info = new List<String>{ 'sortOrder', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] sortType_type_info = new List<String>{ 'sortType', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'aggregateType',
            'dateGranularity',
            'field',
            'sortByName',
            'sortOrder',
            'sortType'
        };
    }
    public class DeployMessage {
        public Boolean changed;
        public Integer columnNumber;
        public String componentType;
        public Boolean created;
        public DateTime createdDate;
        public Boolean deleted;
        public String fileName;
        public String fullName;
        public String id;
        public Integer lineNumber;
        public String problem;
        public String problemType;
        public Boolean success;
        private String[] changed_type_info = new List<String>{ 'changed', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] columnNumber_type_info = new List<String>{
            'columnNumber',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] componentType_type_info = new List<String>{
            'componentType',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] created_type_info = new List<String>{ 'created', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] createdDate_type_info = new List<String>{ 'createdDate', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] deleted_type_info = new List<String>{ 'deleted', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] fileName_type_info = new List<String>{ 'fileName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] id_type_info = new List<String>{ 'id', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] lineNumber_type_info = new List<String>{ 'lineNumber', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] problem_type_info = new List<String>{ 'problem', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] problemType_type_info = new List<String>{ 'problemType', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] success_type_info = new List<String>{ 'success', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'changed',
            'columnNumber',
            'componentType',
            'created',
            'createdDate',
            'deleted',
            'fileName',
            'fullName',
            'id',
            'lineNumber',
            'problem',
            'problemType',
            'success'
        };
    }
    public class EmailServicesAddress {
        public String authorizedSenders;
        public String developerName;
        public Boolean isActive;
        public String localPart;
        public String runAsUser;
        private String[] authorizedSenders_type_info = new List<String>{
            'authorizedSenders',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] developerName_type_info = new List<String>{
            'developerName',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] isActive_type_info = new List<String>{ 'isActive', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] localPart_type_info = new List<String>{ 'localPart', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] runAsUser_type_info = new List<String>{ 'runAsUser', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'authorizedSenders',
            'developerName',
            'isActive',
            'localPart',
            'runAsUser'
        };
    }
    public class PermissionSetObjectPermissions {
        public Boolean allowCreate;
        public Boolean allowDelete;
        public Boolean allowEdit;
        public Boolean allowRead;
        public Boolean modifyAllRecords;
        public String object_x;
        public Boolean viewAllRecords;
        private String[] allowCreate_type_info = new List<String>{ 'allowCreate', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] allowDelete_type_info = new List<String>{ 'allowDelete', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] allowEdit_type_info = new List<String>{ 'allowEdit', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] allowRead_type_info = new List<String>{ 'allowRead', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] modifyAllRecords_type_info = new List<String>{
            'modifyAllRecords',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] object_x_type_info = new List<String>{ 'object', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] viewAllRecords_type_info = new List<String>{
            'viewAllRecords',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'allowCreate',
            'allowDelete',
            'allowEdit',
            'allowRead',
            'modifyAllRecords',
            'object_x',
            'viewAllRecords'
        };
    }
    public class ProfileApexClassAccess {
        public String apexClass;
        public Boolean enabled;
        private String[] apexClass_type_info = new List<String>{ 'apexClass', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] enabled_type_info = new List<String>{ 'enabled', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'apexClass', 'enabled' };
    }
    public class ProfileLoginIpRange {
        public String description;
        public String endAddress;
        public String startAddress;
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] endAddress_type_info = new List<String>{ 'endAddress', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] startAddress_type_info = new List<String>{
            'startAddress',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'description', 'endAddress', 'startAddress' };
    }
    public class ProfileSessionSetting extends Metadata {
        public String type = 'ProfileSessionSetting';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public Boolean externalCommunityUserIdentityVerif;
        public Boolean forceLogout;
        public String profile;
        public String requiredSessionLevel;
        public Boolean sessionPersistence;
        public Integer sessionTimeout;
        public Boolean sessionTimeoutWarning;
        private String[] externalCommunityUserIdentityVerif_type_info = new List<String>{
            'externalCommunityUserIdentityVerif',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] forceLogout_type_info = new List<String>{ 'forceLogout', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] profile_type_info = new List<String>{ 'profile', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] requiredSessionLevel_type_info = new List<String>{
            'requiredSessionLevel',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] sessionPersistence_type_info = new List<String>{
            'sessionPersistence',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] sessionTimeout_type_info = new List<String>{
            'sessionTimeout',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] sessionTimeoutWarning_type_info = new List<String>{
            'sessionTimeoutWarning',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'externalCommunityUserIdentityVerif',
            'forceLogout',
            'profile',
            'requiredSessionLevel',
            'sessionPersistence',
            'sessionTimeout',
            'sessionTimeoutWarning'
        };
    }
    public class DashboardComponentColumn {
        public Double breakPoint1;
        public Double breakPoint2;
        public Integer breakPointOrder;
        public Integer highRangeColor;
        public Integer lowRangeColor;
        public Integer midRangeColor;
        public String reportColumn;
        public Boolean showTotal;
        public String type_x;
        private String[] breakPoint1_type_info = new List<String>{ 'breakPoint1', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] breakPoint2_type_info = new List<String>{ 'breakPoint2', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] breakPointOrder_type_info = new List<String>{
            'breakPointOrder',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] highRangeColor_type_info = new List<String>{
            'highRangeColor',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] lowRangeColor_type_info = new List<String>{
            'lowRangeColor',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] midRangeColor_type_info = new List<String>{
            'midRangeColor',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] reportColumn_type_info = new List<String>{
            'reportColumn',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] showTotal_type_info = new List<String>{ 'showTotal', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] type_x_type_info = new List<String>{ 'type', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'breakPoint1',
            'breakPoint2',
            'breakPointOrder',
            'highRangeColor',
            'lowRangeColor',
            'midRangeColor',
            'reportColumn',
            'showTotal',
            'type_x'
        };
    }
    public class ChartSummary {
        public String aggregate;
        public String axisBinding;
        public String column;
        private String[] aggregate_type_info = new List<String>{ 'aggregate', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] axisBinding_type_info = new List<String>{ 'axisBinding', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] column_type_info = new List<String>{ 'column', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'aggregate', 'axisBinding', 'column' };
    }
    public class InstalledPackage extends Metadata {
        public String type = 'InstalledPackage';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String password;
        public String versionNumber;
        private String[] password_type_info = new List<String>{ 'password', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] versionNumber_type_info = new List<String>{
            'versionNumber',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{ 'fullName', 'password', 'versionNumber' };
    }
    public class checkRetrieveStatus_element {
        public String asyncProcessId;
        public Boolean includeZip;
        private String[] asyncProcessId_type_info = new List<String>{
            'asyncProcessId',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] includeZip_type_info = new List<String>{ 'includeZip', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'asyncProcessId', 'includeZip' };
    }
    public class ObjectUsage {
        public String[] object_x;
        private String[] object_x_type_info = new List<String>{ 'object', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'object_x' };
    }
    public class Package_x extends Metadata {
        public String type = 'Package_x';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String apiAccessLevel;
        public String description;
        public String namespacePrefix;
        public MetadataService.ProfileObjectPermissions[] objectPermissions;
        public String packageType;
        public String postInstallClass;
        public String setupWeblink;
        public String uninstallClass;
        public String version;
        private String[] apiAccessLevel_type_info = new List<String>{
            'apiAccessLevel',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] namespacePrefix_type_info = new List<String>{
            'namespacePrefix',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] objectPermissions_type_info = new List<String>{
            'objectPermissions',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] packageType_type_info = new List<String>{ 'packageType', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] postInstallClass_type_info = new List<String>{
            'postInstallClass',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] setupWeblink_type_info = new List<String>{
            'setupWeblink',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] types_type_info = new List<String>{ 'types', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] uninstallClass_type_info = new List<String>{
            'uninstallClass',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] version_type_info = new List<String>{ 'version', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'apiAccessLevel',
            'description',
            'namespacePrefix',
            'objectPermissions',
            'packageType',
            'postInstallClass',
            'setupWeblink',
            'types',
            'uninstallClass',
            'version'
        };
    }
    public class SharingReasonTranslation {
        public String label;
        public String name;
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'label', 'name' };
    }
    public class DescribeMetadataResult {
        public MetadataService.DescribeMetadataObject[] metadataObjects;
        public String organizationNamespace;
        public Boolean partialSaveAllowed;
        public Boolean testRequired;
        private String[] metadataObjects_type_info = new List<String>{
            'metadataObjects',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] organizationNamespace_type_info = new List<String>{
            'organizationNamespace',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] partialSaveAllowed_type_info = new List<String>{
            'partialSaveAllowed',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] testRequired_type_info = new List<String>{
            'testRequired',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'metadataObjects',
            'organizationNamespace',
            'partialSaveAllowed',
            'testRequired'
        };
    }
    public class LeadConvertSettings extends Metadata {
        public String type = 'LeadConvertSettings';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public Boolean allowOwnerChange;
        public MetadataService.ObjectMapping[] objectMapping;
        public String opportunityCreationOptions;
        private String[] allowOwnerChange_type_info = new List<String>{
            'allowOwnerChange',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] objectMapping_type_info = new List<String>{
            'objectMapping',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] opportunityCreationOptions_type_info = new List<String>{
            'opportunityCreationOptions',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'allowOwnerChange',
            'objectMapping',
            'opportunityCreationOptions'
        };
    }
    public class OpportunityListFieldsLabelMapping {
        public String field;
        public String label;
        private String[] field_type_info = new List<String>{ 'field', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'field', 'label' };
    }
    public class deleteMetadataResponse_element {
        public MetadataService.DeleteResult[] result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class Keyword {
        public String keyword;
        private String[] keyword_type_info = new List<String>{ 'keyword', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'keyword' };
    }
    public class PermissionSetApplicationVisibility {
        public String application;
        public Boolean visible;
        private String[] application_type_info = new List<String>{ 'application', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] visible_type_info = new List<String>{ 'visible', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'application', 'visible' };
    }
    public class AppActionOverride {
        public String pageOrSobjectType;
        private String[] pageOrSobjectType_type_info = new List<String>{
            'pageOrSobjectType',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'pageOrSobjectType' };
    }
    public class RoleAndSubordinates {
        public String[] roleAndSubordinate;
        private String[] roleAndSubordinate_type_info = new List<String>{
            'roleAndSubordinate',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'roleAndSubordinate' };
    }
    public class StandardFieldTranslation {
        public String label;
        public String name;
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'label', 'name' };
    }
    public class EmbeddedServiceBranding extends Metadata {
        public String type = 'EmbeddedServiceBranding';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String contrastInvertedColor;
        public String contrastPrimaryColor;
        public String embeddedServiceConfig;
        public String font;
        public String masterLabel;
        public String navBarColor;
        public String primaryColor;
        public String secondaryColor;
        private String[] contrastInvertedColor_type_info = new List<String>{
            'contrastInvertedColor',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] contrastPrimaryColor_type_info = new List<String>{
            'contrastPrimaryColor',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] embeddedServiceConfig_type_info = new List<String>{
            'embeddedServiceConfig',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] font_type_info = new List<String>{ 'font', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] masterLabel_type_info = new List<String>{ 'masterLabel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] navBarColor_type_info = new List<String>{ 'navBarColor', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] primaryColor_type_info = new List<String>{
            'primaryColor',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] secondaryColor_type_info = new List<String>{
            'secondaryColor',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'contrastInvertedColor',
            'contrastPrimaryColor',
            'embeddedServiceConfig',
            'font',
            'masterLabel',
            'navBarColor',
            'primaryColor',
            'secondaryColor'
        };
    }
    public class ProfilePasswordPolicy extends Metadata {
        public String type = 'ProfilePasswordPolicy';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public Integer lockoutInterval;
        public Integer maxLoginAttempts;
        public Integer minimumPasswordLength;
        public Boolean minimumPasswordLifetime;
        public Boolean obscure;
        public Integer passwordComplexity;
        public Integer passwordExpiration;
        public Integer passwordHistory;
        public Integer passwordQuestion;
        public String profile;
        private String[] lockoutInterval_type_info = new List<String>{
            'lockoutInterval',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] maxLoginAttempts_type_info = new List<String>{
            'maxLoginAttempts',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] minimumPasswordLength_type_info = new List<String>{
            'minimumPasswordLength',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] minimumPasswordLifetime_type_info = new List<String>{
            'minimumPasswordLifetime',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] obscure_type_info = new List<String>{ 'obscure', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] passwordComplexity_type_info = new List<String>{
            'passwordComplexity',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] passwordExpiration_type_info = new List<String>{
            'passwordExpiration',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] passwordHistory_type_info = new List<String>{
            'passwordHistory',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] passwordQuestion_type_info = new List<String>{
            'passwordQuestion',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] profile_type_info = new List<String>{ 'profile', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'lockoutInterval',
            'maxLoginAttempts',
            'minimumPasswordLength',
            'minimumPasswordLifetime',
            'obscure',
            'passwordComplexity',
            'passwordExpiration',
            'passwordHistory',
            'passwordQuestion',
            'profile'
        };
    }
    public class RecommendationAudienceDetail {
        public String audienceCriteriaType;
        public String audienceCriteriaValue;
        public String setupName;
        private String[] audienceCriteriaType_type_info = new List<String>{
            'audienceCriteriaType',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] audienceCriteriaValue_type_info = new List<String>{
            'audienceCriteriaValue',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] setupName_type_info = new List<String>{ 'setupName', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'audienceCriteriaType',
            'audienceCriteriaValue',
            'setupName'
        };
    }
    public class RoleOrTerritory extends Metadata {
        public String type = 'RoleOrTerritory';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String caseAccessLevel;
        public String contactAccessLevel;
        public String description;
        public Boolean mayForecastManagerShare;
        public String name;
        public String opportunityAccessLevel;
        private String[] caseAccessLevel_type_info = new List<String>{
            'caseAccessLevel',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] contactAccessLevel_type_info = new List<String>{
            'contactAccessLevel',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] mayForecastManagerShare_type_info = new List<String>{
            'mayForecastManagerShare',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] opportunityAccessLevel_type_info = new List<String>{
            'opportunityAccessLevel',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'caseAccessLevel',
            'contactAccessLevel',
            'description',
            'mayForecastManagerShare',
            'name',
            'opportunityAccessLevel'
        };
    }
    public class LiveChatButtonSkills {
        public String[] skill;
        private String[] skill_type_info = new List<String>{ 'skill', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'skill' };
    }
    public class RemoteSiteSetting extends Metadata {
        public String type = 'RemoteSiteSetting';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String description;
        public Boolean disableProtocolSecurity;
        public Boolean isActive;
        public String url;
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] disableProtocolSecurity_type_info = new List<String>{
            'disableProtocolSecurity',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] isActive_type_info = new List<String>{ 'isActive', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] url_type_info = new List<String>{ 'url', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'description',
            'disableProtocolSecurity',
            'isActive',
            'url'
        };
    }
    public class ObjectSearchSetting {
        public Boolean enhancedLookupEnabled;
        public Boolean lookupAutoCompleteEnabled;
        public String name;
        public Integer resultsPerPageCount;
        private String[] enhancedLookupEnabled_type_info = new List<String>{
            'enhancedLookupEnabled',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] lookupAutoCompleteEnabled_type_info = new List<String>{
            'lookupAutoCompleteEnabled',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] resultsPerPageCount_type_info = new List<String>{
            'resultsPerPageCount',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'enhancedLookupEnabled',
            'lookupAutoCompleteEnabled',
            'name',
            'resultsPerPageCount'
        };
    }
    public class RetrieveMessage {
        public String fileName;
        public String problem;
        private String[] fileName_type_info = new List<String>{ 'fileName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] problem_type_info = new List<String>{ 'problem', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'fileName', 'problem' };
    }
    public class EclairMap {
        public Double boundingBoxBottom;
        public Double boundingBoxLeft;
        public Double boundingBoxRight;
        public Double boundingBoxTop;
        public String mapLabel;
        public String mapName;
        public String projection;
        private String[] boundingBoxBottom_type_info = new List<String>{
            'boundingBoxBottom',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] boundingBoxLeft_type_info = new List<String>{
            'boundingBoxLeft',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] boundingBoxRight_type_info = new List<String>{
            'boundingBoxRight',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] boundingBoxTop_type_info = new List<String>{
            'boundingBoxTop',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] mapLabel_type_info = new List<String>{ 'mapLabel', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] mapName_type_info = new List<String>{ 'mapName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] projection_type_info = new List<String>{ 'projection', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'boundingBoxBottom',
            'boundingBoxLeft',
            'boundingBoxRight',
            'boundingBoxTop',
            'mapLabel',
            'mapName',
            'projection'
        };
    }
    public class HistoryRetentionPolicy {
        public Integer archiveAfterMonths;
        public Integer archiveRetentionYears;
        public String description;
        public Integer gracePeriodDays;
        private String[] archiveAfterMonths_type_info = new List<String>{
            'archiveAfterMonths',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] archiveRetentionYears_type_info = new List<String>{
            'archiveRetentionYears',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] gracePeriodDays_type_info = new List<String>{
            'gracePeriodDays',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'archiveAfterMonths',
            'archiveRetentionYears',
            'description',
            'gracePeriodDays'
        };
    }
    public class PersonalJourneySettings extends Metadata {
        public String type = 'PersonalJourneySettings';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public Boolean enableExactTargetForSalesforceApps;
        private String[] enableExactTargetForSalesforceApps_type_info = new List<String>{
            'enableExactTargetForSalesforceApps',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{ 'fullName', 'enableExactTargetForSalesforceApps' };
    }
    public class AppProfileActionOverride {
        public String profile;
        private String[] profile_type_info = new List<String>{ 'profile', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'profile' };
    }
    public class CustomPermission extends Metadata {
        public String type = 'CustomPermission';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String connectedApp;
        public String description;
        public String label;
        public MetadataService.CustomPermissionDependencyRequired[] requiredPermission;
        private String[] connectedApp_type_info = new List<String>{
            'connectedApp',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] requiredPermission_type_info = new List<String>{
            'requiredPermission',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'connectedApp',
            'description',
            'label',
            'requiredPermission'
        };
    }
    public class FlowScreenFieldOutputParameter {
        public String assignToReference;
        public String name;
        private String[] assignToReference_type_info = new List<String>{
            'assignToReference',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'assignToReference', 'name' };
    }
    public class AgentConfigSkills {
        public String[] skill;
        private String[] skill_type_info = new List<String>{ 'skill', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'skill' };
    }
    public class DeployResult {
        public String canceledBy;
        public String canceledByName;
        public Boolean checkOnly;
        public DateTime completedDate;
        public String createdBy;
        public String createdByName;
        public DateTime createdDate;
        public Boolean done;
        public String errorMessage;
        public String errorStatusCode;
        public String id;
        public Boolean ignoreWarnings;
        public DateTime lastModifiedDate;
        public Integer numberComponentErrors;
        public Integer numberComponentsDeployed;
        public Integer numberComponentsTotal;
        public Integer numberTestErrors;
        public Integer numberTestsCompleted;
        public Integer numberTestsTotal;
        public Boolean rollbackOnError;
        public Boolean runTestsEnabled;
        public DateTime startDate;
        public String stateDetail;
        public String status;
        public Boolean success;
        private String[] canceledBy_type_info = new List<String>{ 'canceledBy', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] canceledByName_type_info = new List<String>{
            'canceledByName',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] checkOnly_type_info = new List<String>{ 'checkOnly', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] completedDate_type_info = new List<String>{
            'completedDate',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] createdBy_type_info = new List<String>{ 'createdBy', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] createdByName_type_info = new List<String>{
            'createdByName',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] createdDate_type_info = new List<String>{ 'createdDate', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] details_type_info = new List<String>{ 'details', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] done_type_info = new List<String>{ 'done', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] errorMessage_type_info = new List<String>{
            'errorMessage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] errorStatusCode_type_info = new List<String>{
            'errorStatusCode',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] id_type_info = new List<String>{ 'id', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] ignoreWarnings_type_info = new List<String>{
            'ignoreWarnings',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] lastModifiedDate_type_info = new List<String>{
            'lastModifiedDate',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] numberComponentErrors_type_info = new List<String>{
            'numberComponentErrors',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] numberComponentsDeployed_type_info = new List<String>{
            'numberComponentsDeployed',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] numberComponentsTotal_type_info = new List<String>{
            'numberComponentsTotal',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] numberTestErrors_type_info = new List<String>{
            'numberTestErrors',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] numberTestsCompleted_type_info = new List<String>{
            'numberTestsCompleted',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] numberTestsTotal_type_info = new List<String>{
            'numberTestsTotal',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] rollbackOnError_type_info = new List<String>{
            'rollbackOnError',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] runTestsEnabled_type_info = new List<String>{
            'runTestsEnabled',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] startDate_type_info = new List<String>{ 'startDate', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] stateDetail_type_info = new List<String>{ 'stateDetail', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] status_type_info = new List<String>{ 'status', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] success_type_info = new List<String>{ 'success', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'canceledBy',
            'canceledByName',
            'checkOnly',
            'completedDate',
            'createdBy',
            'createdByName',
            'createdDate',
            'details',
            'done',
            'errorMessage',
            'errorStatusCode',
            'id',
            'ignoreWarnings',
            'lastModifiedDate',
            'numberComponentErrors',
            'numberComponentsDeployed',
            'numberComponentsTotal',
            'numberTestErrors',
            'numberTestsCompleted',
            'numberTestsTotal',
            'rollbackOnError',
            'runTestsEnabled',
            'startDate',
            'stateDetail',
            'status',
            'success'
        };
    }
    public class IdeaReputationLevel {
        public String name;
        public Integer value;
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] value_type_info = new List<String>{ 'value', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'name', 'value' };
    }
    public class EmbeddedServiceConfig extends Metadata {
        public String type = 'EmbeddedServiceConfig';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String masterLabel;
        public String site;
        private String[] masterLabel_type_info = new List<String>{ 'masterLabel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] site_type_info = new List<String>{ 'site', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{ 'fullName', 'masterLabel', 'site' };
    }
    public class LayoutTranslation {
        public String layout;
        public String layoutType;
        private String[] layout_type_info = new List<String>{ 'layout', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] layoutType_type_info = new List<String>{ 'layoutType', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] sections_type_info = new List<String>{ 'sections', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'layout', 'layoutType', 'sections' };
    }
    public class createMetadata_element {
        public MetadataService.Metadata[] metadata;
        private String[] metadata_type_info = new List<String>{ 'metadata', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'metadata' };
    }
    public class DuplicateRuleFilterItem {
        public Integer sortOrder;
        public String table;
        private String[] sortOrder_type_info = new List<String>{ 'sortOrder', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] table_type_info = new List<String>{ 'table', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'sortOrder', 'table' };
    }
    public class CustomPageWebLinkTranslation {
        public String label;
        public String name;
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'label', 'name' };
    }
    public class describeMetadataResponse_element {
        public MetadataService.DescribeMetadataResult result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class CustomPermissionDependencyRequired {
        public String customPermission;
        public Boolean dependency;
        private String[] customPermission_type_info = new List<String>{
            'customPermission',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] dependency_type_info = new List<String>{ 'dependency', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'customPermission', 'dependency' };
    }
    public class ProfileFieldLevelSecurity {
        public Boolean editable;
        public String field;
        public Boolean readable;
        private String[] editable_type_info = new List<String>{ 'editable', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] field_type_info = new List<String>{ 'field', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] readable_type_info = new List<String>{ 'readable', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'editable', 'field', 'readable' };
    }
    public class checkDeployStatus_element {
        public String asyncProcessId;
        public Boolean includeDetails;
        private String[] asyncProcessId_type_info = new List<String>{
            'asyncProcessId',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] includeDetails_type_info = new List<String>{
            'includeDetails',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'asyncProcessId', 'includeDetails' };
    }
    public virtual class MetadataWithContent extends Metadata {
        public String content;
    }
    public class SkillUserAssignments {
        public String[] user_x;
        private String[] user_x_type_info = new List<String>{ 'user', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'user_x' };
    }
    public class checkDeployStatusResponse_element {
        public MetadataService.DeployResult result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class FlowInputValidationRuleTranslation {
        public String errorMessage;
        private String[] errorMessage_type_info = new List<String>{
            'errorMessage',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'errorMessage' };
    }
    public class CleanRule {
        public Boolean bulkEnabled;
        public Boolean bypassTriggers;
        public Boolean bypassWorkflow;
        public String description;
        public String developerName;
        public MetadataService.FieldMapping[] fieldMappings;
        public String masterLabel;
        public String matchRule;
        public String sourceSobjectType;
        public String status;
        public String targetSobjectType;
        private String[] bulkEnabled_type_info = new List<String>{ 'bulkEnabled', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] bypassTriggers_type_info = new List<String>{
            'bypassTriggers',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] bypassWorkflow_type_info = new List<String>{
            'bypassWorkflow',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] developerName_type_info = new List<String>{
            'developerName',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] fieldMappings_type_info = new List<String>{
            'fieldMappings',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] masterLabel_type_info = new List<String>{ 'masterLabel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] matchRule_type_info = new List<String>{ 'matchRule', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] sourceSobjectType_type_info = new List<String>{
            'sourceSobjectType',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] status_type_info = new List<String>{ 'status', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] targetSobjectType_type_info = new List<String>{
            'targetSobjectType',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'bulkEnabled',
            'bypassTriggers',
            'bypassWorkflow',
            'description',
            'developerName',
            'fieldMappings',
            'masterLabel',
            'matchRule',
            'sourceSobjectType',
            'status',
            'targetSobjectType'
        };
    }
    public class ReportColorRange {
        public String aggregate;
        public String columnName;
        public Double highBreakpoint;
        public String highColor;
        public Double lowBreakpoint;
        public String lowColor;
        public String midColor;
        private String[] aggregate_type_info = new List<String>{ 'aggregate', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] columnName_type_info = new List<String>{ 'columnName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] highBreakpoint_type_info = new List<String>{
            'highBreakpoint',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] highColor_type_info = new List<String>{ 'highColor', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] lowBreakpoint_type_info = new List<String>{
            'lowBreakpoint',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] lowColor_type_info = new List<String>{ 'lowColor', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] midColor_type_info = new List<String>{ 'midColor', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'aggregate',
            'columnName',
            'highBreakpoint',
            'highColor',
            'lowBreakpoint',
            'lowColor',
            'midColor'
        };
    }
    public class OrganizationSettingsDetail {
        public String settingName;
        public Boolean settingValue;
        private String[] settingName_type_info = new List<String>{ 'settingName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] settingValue_type_info = new List<String>{
            'settingValue',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'settingName', 'settingValue' };
    }
    public class EclairGeoData extends MetadataWithContent {
        public String type = 'EclairGeoData';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String content;
        private String[] content_type_info = new List<String>{ 'content', SOAP_M_URI, null, '0', '1', 'false' };
        public MetadataService.EclairMap[] maps;
        public String masterLabel;
        private String[] maps_type_info = new List<String>{ 'maps', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] masterLabel_type_info = new List<String>{ 'masterLabel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{ 'fullName', 'content', 'maps', 'masterLabel' };
    }
    public class GlobalValueSet extends Metadata {
        public String type = 'GlobalValueSet';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public MetadataService.CustomValue[] customValue;
        public String description;
        public String masterLabel;
        public Boolean sorted;
        private String[] customValue_type_info = new List<String>{
            'customValue',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] masterLabel_type_info = new List<String>{ 'masterLabel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] sorted_type_info = new List<String>{ 'sorted', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'customValue',
            'description',
            'masterLabel',
            'sorted'
        };
    }
    public class Territory2Type extends Metadata {
        public String type = 'Territory2Type';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String description;
        public String name;
        public Integer priority;
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] priority_type_info = new List<String>{ 'priority', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{ 'fullName', 'description', 'name', 'priority' };
    }
    public class FileProperties {
        public String createdById;
        public String createdByName;
        public DateTime createdDate;
        public String fileName;
        public String fullName;
        public String id;
        public String lastModifiedById;
        public String lastModifiedByName;
        public DateTime lastModifiedDate;
        public String manageableState;
        public String namespacePrefix;
        public String type_x;
        private String[] createdById_type_info = new List<String>{ 'createdById', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] createdByName_type_info = new List<String>{
            'createdByName',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] createdDate_type_info = new List<String>{ 'createdDate', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] fileName_type_info = new List<String>{ 'fileName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] id_type_info = new List<String>{ 'id', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] lastModifiedById_type_info = new List<String>{
            'lastModifiedById',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] lastModifiedByName_type_info = new List<String>{
            'lastModifiedByName',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] lastModifiedDate_type_info = new List<String>{
            'lastModifiedDate',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] manageableState_type_info = new List<String>{
            'manageableState',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] namespacePrefix_type_info = new List<String>{
            'namespacePrefix',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] type_x_type_info = new List<String>{ 'type', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'createdById',
            'createdByName',
            'createdDate',
            'fileName',
            'fullName',
            'id',
            'lastModifiedById',
            'lastModifiedByName',
            'lastModifiedDate',
            'manageableState',
            'namespacePrefix',
            'type_x'
        };
    }
    public class listMetadataResponse_element {
        public MetadataService.FileProperties[] result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class CommunityCustomThemeLayoutType {
        public String description;
        public String label;
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'description', 'label' };
    }
    public class CommunityTemplatePageSetting {
        public String page_x;
        public String themeLayout;
        private String[] page_x_type_info = new List<String>{ 'page', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] themeLayout_type_info = new List<String>{ 'themeLayout', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'page_x', 'themeLayout' };
    }
    public class SamlSsoConfig extends Metadata {
        public String type = 'SamlSsoConfig';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public String attributeName;
        public String attributeNameIdFormat;
        public String decryptionCertificate;
        public String errorUrl;
        public String executionUserId;
        public String identityLocation;
        public String identityMapping;
        public String issuer;
        public String loginUrl;
        public String logoutUrl;
        public String name;
        public String oauthTokenEndpoint;
        public Boolean redirectBinding;
        public String requestSignatureMethod;
        public String requestSigningCertId;
        public String salesforceLoginUrl;
        public String samlEntityId;
        public String samlJitHandlerId;
        public String samlVersion;
        public String singleLogoutBinding;
        public String singleLogoutUrl;
        public Boolean userProvisioning;
        public String validationCert;
        private String[] attributeName_type_info = new List<String>{
            'attributeName',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] attributeNameIdFormat_type_info = new List<String>{
            'attributeNameIdFormat',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] decryptionCertificate_type_info = new List<String>{
            'decryptionCertificate',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] errorUrl_type_info = new List<String>{ 'errorUrl', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] executionUserId_type_info = new List<String>{
            'executionUserId',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] identityLocation_type_info = new List<String>{
            'identityLocation',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] identityMapping_type_info = new List<String>{
            'identityMapping',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] issuer_type_info = new List<String>{ 'issuer', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] loginUrl_type_info = new List<String>{ 'loginUrl', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] logoutUrl_type_info = new List<String>{ 'logoutUrl', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] oauthTokenEndpoint_type_info = new List<String>{
            'oauthTokenEndpoint',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] redirectBinding_type_info = new List<String>{
            'redirectBinding',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] requestSignatureMethod_type_info = new List<String>{
            'requestSignatureMethod',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] requestSigningCertId_type_info = new List<String>{
            'requestSigningCertId',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] salesforceLoginUrl_type_info = new List<String>{
            'salesforceLoginUrl',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] samlEntityId_type_info = new List<String>{
            'samlEntityId',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] samlJitHandlerId_type_info = new List<String>{
            'samlJitHandlerId',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] samlVersion_type_info = new List<String>{ 'samlVersion', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] singleLogoutBinding_type_info = new List<String>{
            'singleLogoutBinding',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] singleLogoutUrl_type_info = new List<String>{
            'singleLogoutUrl',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] userProvisioning_type_info = new List<String>{
            'userProvisioning',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] validationCert_type_info = new List<String>{
            'validationCert',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'attributeName',
            'attributeNameIdFormat',
            'decryptionCertificate',
            'errorUrl',
            'executionUserId',
            'identityLocation',
            'identityMapping',
            'issuer',
            'loginUrl',
            'logoutUrl',
            'name',
            'oauthTokenEndpoint',
            'redirectBinding',
            'requestSignatureMethod',
            'requestSigningCertId',
            'salesforceLoginUrl',
            'samlEntityId',
            'samlJitHandlerId',
            'samlVersion',
            'singleLogoutBinding',
            'singleLogoutUrl',
            'userProvisioning',
            'validationCert'
        };
    }
    public class describeValueType_element {
        public String type_x;
        private String[] type_x_type_info = new List<String>{ 'type', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'type_x' };
    }
    public class PermissionSetGroup {
        public String description;
        public Boolean isCalculatingChanges;
        public String label;
        public String[] permissionSets;
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] isCalculatingChanges_type_info = new List<String>{
            'isCalculatingChanges',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] label_type_info = new List<String>{ 'label', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] permissionSets_type_info = new List<String>{
            'permissionSets',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'description',
            'isCalculatingChanges',
            'label',
            'permissionSets'
        };
    }
    public class TransactionSecurityNotification {
        public Boolean inApp;
        public Boolean sendEmail;
        public String user_x;
        private String[] inApp_type_info = new List<String>{ 'inApp', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] sendEmail_type_info = new List<String>{ 'sendEmail', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] user_x_type_info = new List<String>{ 'user', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'inApp', 'sendEmail', 'user_x' };
    }
    public class ReportColumn {
        public String[] aggregateTypes;
        public String field;
        public Boolean reverseColors;
        public Boolean showChanges;
        private String[] aggregateTypes_type_info = new List<String>{
            'aggregateTypes',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] field_type_info = new List<String>{ 'field', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] reverseColors_type_info = new List<String>{
            'reverseColors',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] showChanges_type_info = new List<String>{ 'showChanges', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'aggregateTypes',
            'field',
            'reverseColors',
            'showChanges'
        };
    }
    public class TopicsForObjects extends Metadata {
        public String type = 'TopicsForObjects';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public Boolean enableTopics;
        public String entityApiName;
        private String[] enableTopics_type_info = new List<String>{
            'enableTopics',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] entityApiName_type_info = new List<String>{
            'entityApiName',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{ 'fullName', 'enableTopics', 'entityApiName' };
    }
    public class FlowChoiceUserInputTranslation {
        public String promptText;
        public MetadataService.FlowInputValidationRuleTranslation validationRule;
        private String[] promptText_type_info = new List<String>{ 'promptText', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] validationRule_type_info = new List<String>{
            'validationRule',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'promptText', 'validationRule' };
    }
    public class FieldSetItem {
        public String field;
        public Boolean isFieldManaged;
        public Boolean isRequired;
        private String[] field_type_info = new List<String>{ 'field', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] isFieldManaged_type_info = new List<String>{
            'isFieldManaged',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] isRequired_type_info = new List<String>{ 'isRequired', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'field', 'isFieldManaged', 'isRequired' };
    }
    public class ProfileUserPermission {
        public Boolean enabled;
        public String name;
        private String[] enabled_type_info = new List<String>{ 'enabled', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] name_type_info = new List<String>{ 'name', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'enabled', 'name' };
    }
    public class FindSimilarOppFilter {
        public String[] similarOpportunitiesDisplayColumns;
        public String[] similarOpportunitiesMatchFields;
        private String[] similarOpportunitiesDisplayColumns_type_info = new List<String>{
            'similarOpportunitiesDisplayColumns',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] similarOpportunitiesMatchFields_type_info = new List<String>{
            'similarOpportunitiesMatchFields',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'similarOpportunitiesDisplayColumns',
            'similarOpportunitiesMatchFields'
        };
    }
    public class ReportAggregate {
        public String acrossGroupingContext;
        public String calculatedFormula;
        public String datatype;
        public String description;
        public String developerName;
        public String downGroupingContext;
        public Boolean isActive;
        public Boolean isCrossBlock;
        public String masterLabel;
        public String reportType;
        public Integer scale;
        private String[] acrossGroupingContext_type_info = new List<String>{
            'acrossGroupingContext',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] calculatedFormula_type_info = new List<String>{
            'calculatedFormula',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] datatype_type_info = new List<String>{ 'datatype', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] developerName_type_info = new List<String>{
            'developerName',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] downGroupingContext_type_info = new List<String>{
            'downGroupingContext',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] isActive_type_info = new List<String>{ 'isActive', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] isCrossBlock_type_info = new List<String>{
            'isCrossBlock',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] masterLabel_type_info = new List<String>{ 'masterLabel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] reportType_type_info = new List<String>{ 'reportType', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] scale_type_info = new List<String>{ 'scale', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'acrossGroupingContext',
            'calculatedFormula',
            'datatype',
            'description',
            'developerName',
            'downGroupingContext',
            'isActive',
            'isCrossBlock',
            'masterLabel',
            'reportType',
            'scale'
        };
    }
    public class ContractSettings extends Metadata {
        public String type = 'ContractSettings';
        public String fullName;
        private String[] fullName_type_info = new List<String>{ 'fullName', SOAP_M_URI, null, '0', '1', 'false' };
        public Boolean autoCalculateEndDate;
        public String autoExpirationDelay;
        public String autoExpirationRecipient;
        public Boolean autoExpireContracts;
        public Boolean enableContractHistoryTracking;
        public Boolean notifyOwnersOnContractExpiration;
        private String[] autoCalculateEndDate_type_info = new List<String>{
            'autoCalculateEndDate',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] autoExpirationDelay_type_info = new List<String>{
            'autoExpirationDelay',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] autoExpirationRecipient_type_info = new List<String>{
            'autoExpirationRecipient',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] autoExpireContracts_type_info = new List<String>{
            'autoExpireContracts',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] enableContractHistoryTracking_type_info = new List<String>{
            'enableContractHistoryTracking',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] notifyOwnersOnContractExpiration_type_info = new List<String>{
            'notifyOwnersOnContractExpiration',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] type_att_info = new List<String>{ 'xsi:type' };
        private String[] field_order_type_info = new List<String>{
            'fullName',
            'autoCalculateEndDate',
            'autoExpirationDelay',
            'autoExpirationRecipient',
            'autoExpireContracts',
            'enableContractHistoryTracking',
            'notifyOwnersOnContractExpiration'
        };
    }
    public class NetworkTabSet {
        public String[] customTab;
        public String defaultTab;
        public String[] standardTab;
        private String[] customTab_type_info = new List<String>{ 'customTab', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] defaultTab_type_info = new List<String>{ 'defaultTab', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] standardTab_type_info = new List<String>{
            'standardTab',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'customTab', 'defaultTab', 'standardTab' };
    }
    public class KeywordList {
        public String description;
        public MetadataService.Keyword[] keywords;
        public String masterLabel;
        private String[] description_type_info = new List<String>{ 'description', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] keywords_type_info = new List<String>{ 'keywords', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] masterLabel_type_info = new List<String>{ 'masterLabel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'description', 'keywords', 'masterLabel' };
    }
    public class MatchingRuleItem {
        public String blankValueBehavior;
        public String fieldName;
        public String matchingMethod;
        private String[] blankValueBehavior_type_info = new List<String>{
            'blankValueBehavior',
            SOAP_M_URI,
            null,
            '0',
            '1',
            'false'
        };
        private String[] fieldName_type_info = new List<String>{ 'fieldName', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] matchingMethod_type_info = new List<String>{
            'matchingMethod',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'blankValueBehavior',
            'fieldName',
            'matchingMethod'
        };
    }
    public class DashboardComponentSortInfo {
        public String sortColumn;
        public String sortOrder;
        private String[] sortColumn_type_info = new List<String>{ 'sortColumn', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] sortOrder_type_info = new List<String>{ 'sortOrder', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'sortColumn', 'sortOrder' };
    }
    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new List<String>{ 'debugLog', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'debugLog' };
    }
    public class DeployOptions {
        public Boolean allowMissingFiles;
        public Boolean autoUpdatePackage;
        public Boolean checkOnly;
        public Boolean ignoreWarnings;
        public Boolean performRetrieve;
        public Boolean purgeOnDelete;
        public Boolean rollbackOnError;
        public String[] runTests;
        public Boolean singlePackage;
        public String testLevel;
        private String[] allowMissingFiles_type_info = new List<String>{
            'allowMissingFiles',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] autoUpdatePackage_type_info = new List<String>{
            'autoUpdatePackage',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] checkOnly_type_info = new List<String>{ 'checkOnly', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] ignoreWarnings_type_info = new List<String>{
            'ignoreWarnings',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] performRetrieve_type_info = new List<String>{
            'performRetrieve',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] purgeOnDelete_type_info = new List<String>{
            'purgeOnDelete',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] rollbackOnError_type_info = new List<String>{
            'rollbackOnError',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] runTests_type_info = new List<String>{ 'runTests', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] singlePackage_type_info = new List<String>{
            'singlePackage',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] testLevel_type_info = new List<String>{ 'testLevel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'allowMissingFiles',
            'autoUpdatePackage',
            'checkOnly',
            'ignoreWarnings',
            'performRetrieve',
            'purgeOnDelete',
            'rollbackOnError',
            'runTests',
            'singlePackage',
            'testLevel'
        };
    }
    public class deploy_element {
        public String ZipFile;
        public MetadataService.DeployOptions DeployOptions;
        private String[] ZipFile_type_info = new List<String>{ 'ZipFile', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] DeployOptions_type_info = new List<String>{
            'DeployOptions',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'ZipFile', 'DeployOptions' };
    }
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new List<String>{ 'category', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] level_type_info = new List<String>{ 'level', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'category', 'level' };
    }
    public class DebuggingHeader_element {
        public MetadataService.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new List<String>{ 'categories', SOAP_M_URI, null, '0', '-1', 'false' };
        private String[] debugLevel_type_info = new List<String>{ 'debugLevel', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'categories', 'debugLevel' };
    }
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new List<String>{ 'client', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'client' };
    }
    public class CancelDeployResult {
        public Boolean done;
        public String id;
        private String[] done_type_info = new List<String>{ 'done', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] id_type_info = new List<String>{ 'id', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'done', 'id' };
    }
    public class cancelDeployResponse_element {
        public MetadataService.CancelDeployResult result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class DescribeValueTypeResult {
        public Boolean apiCreatable;
        public Boolean apiDeletable;
        public Boolean apiReadable;
        public Boolean apiUpdatable;
        public MetadataService.ValueTypeField parentField;
        public MetadataService.ValueTypeField[] valueTypeFields;
        private String[] apiCreatable_type_info = new List<String>{
            'apiCreatable',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apiDeletable_type_info = new List<String>{
            'apiDeletable',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] apiReadable_type_info = new List<String>{ 'apiReadable', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apiUpdatable_type_info = new List<String>{
            'apiUpdatable',
            SOAP_M_URI,
            null,
            '1',
            '1',
            'false'
        };
        private String[] parentField_type_info = new List<String>{ 'parentField', SOAP_M_URI, null, '0', '1', 'false' };
        private String[] valueTypeFields_type_info = new List<String>{
            'valueTypeFields',
            SOAP_M_URI,
            null,
            '0',
            '-1',
            'false'
        };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{
            'apiCreatable',
            'apiDeletable',
            'apiReadable',
            'apiUpdatable',
            'parentField',
            'valueTypeFields'
        };
    }
    public class describeValueTypeResponse_element {
        public MetadataService.DescribeValueTypeResult result;
        private String[] result_type_info = new List<String>{ 'result', SOAP_M_URI, null, '1', '1', 'false' };
        private String[] apex_schema_type_info = new List<String>{ SOAP_M_URI, 'true', 'false' };
        private String[] field_order_type_info = new List<String>{ 'result' };
    }
    public class MetadataPort {
        public String endpoint_x = URL.getSalesforceBaseUrl().toExternalForm() + '/services/Soap/m/42.0';
        public Map<String, String> inputHttpHeaders_x;
        public Map<String, String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public MetadataService.SessionHeader_element SessionHeader;
        public MetadataService.DebuggingInfo_element DebuggingInfo;
        public MetadataService.DebuggingHeader_element DebuggingHeader;
        public MetadataService.CallOptions_element CallOptions;
        public MetadataService.AllOrNoneHeader_element AllOrNoneHeader;
        private String SessionHeader_hns = 'SessionHeader=' + SOAP_M_URI;
        private String DebuggingInfo_hns = 'DebuggingInfo=' + SOAP_M_URI;
        private String DebuggingHeader_hns = 'DebuggingHeader=' + SOAP_M_URI;
        private String CallOptions_hns = 'CallOptions=' + SOAP_M_URI;
        private String AllOrNoneHeader_hns = 'AllOrNoneHeader=' + SOAP_M_URI;
        private String[] ns_map_type_info = new List<String>{ SOAP_M_URI, 'MetadataService' };
        public MetadataService.DeleteResult[] deleteMetadata(String type_x, String[] fullNames) {
            MetadataService.deleteMetadata_element request_x = new MetadataService.deleteMetadata_element();
            request_x.type_x = type_x;
            request_x.fullNames = fullNames;
            MetadataService.deleteMetadataResponse_element response_x;
            Map<String, MetadataService.deleteMetadataResponse_element> response_map_x = new Map<String, MetadataService.deleteMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'deleteMetadata',
                    SOAP_M_URI,
                    'deleteMetadataResponse',
                    'MetadataService.deleteMetadataResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.SaveResult renameMetadata(String type_x, String oldFullName, String newFullName) {
            MetadataService.renameMetadata_element request_x = new MetadataService.renameMetadata_element();
            request_x.type_x = type_x;
            request_x.oldFullName = oldFullName;
            request_x.newFullName = newFullName;
            MetadataService.renameMetadataResponse_element response_x;
            Map<String, MetadataService.renameMetadataResponse_element> response_map_x = new Map<String, MetadataService.renameMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'renameMetadata',
                    SOAP_M_URI,
                    'renameMetadataResponse',
                    'MetadataService.renameMetadataResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.SaveResult[] updateMetadata(MetadataService.Metadata[] metadata) {
            MetadataService.updateMetadata_element request_x = new MetadataService.updateMetadata_element();
            request_x.metadata = metadata;
            MetadataService.updateMetadataResponse_element response_x;
            Map<String, MetadataService.updateMetadataResponse_element> response_map_x = new Map<String, MetadataService.updateMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'updateMetadata',
                    SOAP_M_URI,
                    'updateMetadataResponse',
                    'MetadataService.updateMetadataResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.DescribeMetadataResult describeMetadata(Double asOfVersion) {
            MetadataService.describeMetadata_element request_x = new MetadataService.describeMetadata_element();
            request_x.asOfVersion = asOfVersion;
            MetadataService.describeMetadataResponse_element response_x;
            Map<String, MetadataService.describeMetadataResponse_element> response_map_x = new Map<String, MetadataService.describeMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'describeMetadata',
                    SOAP_M_URI,
                    'describeMetadataResponse',
                    'MetadataService.describeMetadataResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.DeployResult checkDeployStatus(String asyncProcessId, Boolean includeDetails) {
            MetadataService.checkDeployStatus_element request_x = new MetadataService.checkDeployStatus_element();
            request_x.asyncProcessId = asyncProcessId;
            request_x.includeDetails = includeDetails;
            MetadataService.checkDeployStatusResponse_element response_x;
            Map<String, MetadataService.checkDeployStatusResponse_element> response_map_x = new Map<String, MetadataService.checkDeployStatusResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'checkDeployStatus',
                    SOAP_M_URI,
                    'checkDeployStatusResponse',
                    'MetadataService.checkDeployStatusResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.RetrieveResult checkRetrieveStatus(String asyncProcessId, Boolean includeZip) {
            MetadataService.checkRetrieveStatus_element request_x = new MetadataService.checkRetrieveStatus_element();
            request_x.asyncProcessId = asyncProcessId;
            request_x.includeZip = includeZip;
            MetadataService.checkRetrieveStatusResponse_element response_x;
            Map<String, MetadataService.checkRetrieveStatusResponse_element> response_map_x = new Map<String, MetadataService.checkRetrieveStatusResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'checkRetrieveStatus',
                    SOAP_M_URI,
                    'checkRetrieveStatusResponse',
                    'MetadataService.checkRetrieveStatusResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.AsyncResult retrieve(MetadataService.RetrieveRequest retrieveRequest) {
            MetadataService.retrieve_element request_x = new MetadataService.retrieve_element();
            request_x.retrieveRequest = retrieveRequest;
            MetadataService.retrieveResponse_element response_x;
            Map<String, MetadataService.retrieveResponse_element> response_map_x = new Map<String, MetadataService.retrieveResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'retrieve',
                    SOAP_M_URI,
                    'retrieveResponse',
                    'MetadataService.retrieveResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.CancelDeployResult cancelDeploy(String String_x) {
            MetadataService.cancelDeploy_element request_x = new MetadataService.cancelDeploy_element();
            request_x.String_x = String_x;
            MetadataService.cancelDeployResponse_element response_x;
            Map<String, MetadataService.cancelDeployResponse_element> response_map_x = new Map<String, MetadataService.cancelDeployResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'cancelDeploy',
                    SOAP_M_URI,
                    'cancelDeployResponse',
                    'MetadataService.cancelDeployResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public String deployRecentValidation(String validationId) {
            MetadataService.deployRecentValidation_element request_x = new MetadataService.deployRecentValidation_element();
            request_x.validationId = validationId;
            MetadataService.deployRecentValidationResponse_element response_x;
            Map<String, MetadataService.deployRecentValidationResponse_element> response_map_x = new Map<String, MetadataService.deployRecentValidationResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'deployRecentValidation',
                    SOAP_M_URI,
                    'deployRecentValidationResponse',
                    'MetadataService.deployRecentValidationResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.DescribeValueTypeResult describeValueType(String type_x) {
            MetadataService.describeValueType_element request_x = new MetadataService.describeValueType_element();
            request_x.type_x = type_x;
            MetadataService.describeValueTypeResponse_element response_x;
            Map<String, MetadataService.describeValueTypeResponse_element> response_map_x = new Map<String, MetadataService.describeValueTypeResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'describeValueType',
                    SOAP_M_URI,
                    'describeValueTypeResponse',
                    'MetadataService.describeValueTypeResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.SaveResult[] createMetadata(MetadataService.Metadata[] metadata) {
            MetadataService.createMetadata_element request_x = new MetadataService.createMetadata_element();
            request_x.metadata = metadata;
            MetadataService.createMetadataResponse_element response_x;
            Map<String, MetadataService.createMetadataResponse_element> response_map_x = new Map<String, MetadataService.createMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'createMetadata',
                    SOAP_M_URI,
                    'createMetadataResponse',
                    'MetadataService.createMetadataResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.AsyncResult deploy(String ZipFile, MetadataService.DeployOptions DeployOptions) {
            MetadataService.deploy_element request_x = new MetadataService.deploy_element();
            request_x.ZipFile = ZipFile;
            request_x.DeployOptions = DeployOptions;
            MetadataService.deployResponse_element response_x;
            Map<String, MetadataService.deployResponse_element> response_map_x = new Map<String, MetadataService.deployResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'deploy',
                    SOAP_M_URI,
                    'deployResponse',
                    'MetadataService.deployResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.IReadResult readMetadata(String type_x, String[] fullNames) {
            MetadataService.readMetadata_element request_x = new MetadataService.readMetadata_element();
            request_x.type_x = type_x;
            request_x.fullNames = fullNames;
            MetadataService.IReadResponseElement response_x;
            Map<String, MetadataService.IReadResponseElement> response_map_x = new Map<String, MetadataService.IReadResponseElement>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'readMetadata',
                    SOAP_M_URI,
                    'readMetadataResponse',
                    'MetadataService.read' +
                    type_x +
                    'Response_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.getResult();
        }
        public MetadataService.UpsertResult[] upsertMetadata(MetadataService.Metadata[] metadata) {
            MetadataService.upsertMetadata_element request_x = new MetadataService.upsertMetadata_element();
            request_x.metadata = metadata;
            MetadataService.upsertMetadataResponse_element response_x;
            Map<String, MetadataService.upsertMetadataResponse_element> response_map_x = new Map<String, MetadataService.upsertMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'upsertMetadata',
                    SOAP_M_URI,
                    'upsertMetadataResponse',
                    'MetadataService.upsertMetadataResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.FileProperties[] listMetadata(
            MetadataService.ListMetadataQuery[] queries,
            Double asOfVersion
        ) {
            MetadataService.listMetadata_element request_x = new MetadataService.listMetadata_element();
            request_x.queries = queries;
            request_x.asOfVersion = asOfVersion;
            MetadataService.listMetadataResponse_element response_x;
            Map<String, MetadataService.listMetadataResponse_element> response_map_x = new Map<String, MetadataService.listMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new List<String>{
                    endpoint_x,
                    '',
                    SOAP_M_URI,
                    'listMetadata',
                    SOAP_M_URI,
                    'listMetadataResponse',
                    'MetadataService.listMetadataResponse_element'
                }
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
    }
}
