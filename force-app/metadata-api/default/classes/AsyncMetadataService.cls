/**
 * Created by Ilya Matsuev on 8/21/2020.
 */

public with sharing class AsyncMetadataService {

    public class deleteMetadataResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.DeleteResult[] getValue() {
            MetadataService.deleteMetadataResponse_element response = (MetadataService.deleteMetadataResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class renameMetadataResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.SaveResult getValue() {
            MetadataService.renameMetadataResponse_element response = (MetadataService.renameMetadataResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class updateMetadataResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.SaveResult[] getValue() {
            MetadataService.updateMetadataResponse_element response = (MetadataService.updateMetadataResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class describeMetadataResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.DescribeMetadataResult getValue() {
            MetadataService.describeMetadataResponse_element response = (MetadataService.describeMetadataResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class checkDeployStatusResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.DeployResult getValue() {
            MetadataService.checkDeployStatusResponse_element response = (MetadataService.checkDeployStatusResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class checkRetrieveStatusResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.RetrieveResult getValue() {
            MetadataService.checkRetrieveStatusResponse_element response = (MetadataService.checkRetrieveStatusResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class retrieveResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.AsyncResult getValue() {
            MetadataService.retrieveResponse_element response = (MetadataService.retrieveResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class cancelDeployResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.CancelDeployResult getValue() {
            MetadataService.cancelDeployResponse_element response = (MetadataService.cancelDeployResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class deployRecentValidationResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            MetadataService.deployRecentValidationResponse_element response = (MetadataService.deployRecentValidationResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class describeValueTypeResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.DescribeValueTypeResult getValue() {
            MetadataService.describeValueTypeResponse_element response = (MetadataService.describeValueTypeResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class createMetadataResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.SaveResult[] getValue() {
            MetadataService.createMetadataResponse_element response = (MetadataService.createMetadataResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class deployResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.AsyncResult getValue() {
            MetadataService.deployResponse_element response = (MetadataService.deployResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class readMetadataResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.ReadResult getValue() {
            MetadataService.readMetadataResponse_element response = (MetadataService.readMetadataResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class upsertMetadataResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.UpsertResult[] getValue() {
            MetadataService.upsertMetadataResponse_element response = (MetadataService.upsertMetadataResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class listMetadataResponse_elementFuture extends System.WebServiceCalloutFuture {
        public MetadataService.FileProperties[] getValue() {
            MetadataService.listMetadataResponse_element response = (MetadataService.listMetadataResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class AsyncMetadataOutlet {
        public String endpoint_x = 'https://login.salesforce.com/services/Soap/m/38.0';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        public MetadataService.SessionHeader_element SessionHeader;
        public MetadataService.DebuggingInfo_element DebuggingInfo;
        public MetadataService.DebuggingHeader_element DebuggingHeader;
        public MetadataService.CallOptions_element CallOptions;
        public MetadataService.AllOrNoneHeader_element AllOrNoneHeader;
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/2006/04/metadata';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/2006/04/metadata';
        private String AllOrNoneHeader_hns = 'AllOrNoneHeader=http://soap.sforce.com/2006/04/metadata';
        private String[] ns_map_type_info = new String[]{MetadataService.SOAP_M_URI, 'MetadataService'};
        public AsyncMetadataService.deleteMetadataResponse_elementFuture beginDeleteMetadata(System.Continuation continuation,String type_x,String[] fullNames) {
            MetadataService.deleteMetadata_element request_x = new MetadataService.deleteMetadata_element();
            request_x.type_x = type_x;
            request_x.fullNames = fullNames;
            return (AsyncMetadataService.deleteMetadataResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.deleteMetadataResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'deleteMetadata',
                            MetadataService.SOAP_M_URI,
                            'deleteMetadataResponse',
                            'MetadataService.deleteMetadataResponse_element'}
            );
        }
        public AsyncMetadataService.renameMetadataResponse_elementFuture beginRenameMetadata(System.Continuation continuation,String type_x,String oldFullName,String newFullName) {
            MetadataService.renameMetadata_element request_x = new MetadataService.renameMetadata_element();
            request_x.type_x = type_x;
            request_x.oldFullName = oldFullName;
            request_x.newFullName = newFullName;
            return (AsyncMetadataService.renameMetadataResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.renameMetadataResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'renameMetadata',
                            MetadataService.SOAP_M_URI,
                            'renameMetadataResponse',
                            'MetadataService.renameMetadataResponse_element'}
            );
        }
        public AsyncMetadataService.updateMetadataResponse_elementFuture beginUpdateMetadata(System.Continuation continuation,MetadataService.Metadata[] metadata) {
            MetadataService.updateMetadata_element request_x = new MetadataService.updateMetadata_element();
            request_x.metadata = metadata;
            return (AsyncMetadataService.updateMetadataResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.updateMetadataResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'updateMetadata',
                            MetadataService.SOAP_M_URI,
                            'updateMetadataResponse',
                            'MetadataService.updateMetadataResponse_element'}
            );
        }
        public AsyncMetadataService.describeMetadataResponse_elementFuture beginDescribeMetadata(System.Continuation continuation,Double asOfVersion) {
            MetadataService.describeMetadata_element request_x = new MetadataService.describeMetadata_element();
            request_x.asOfVersion = asOfVersion;
            return (AsyncMetadataService.describeMetadataResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.describeMetadataResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'describeMetadata',
                            MetadataService.SOAP_M_URI,
                            'describeMetadataResponse',
                            'MetadataService.describeMetadataResponse_element'}
            );
        }
        public AsyncMetadataService.checkDeployStatusResponse_elementFuture beginCheckDeployStatus(System.Continuation continuation,String asyncProcessId,Boolean includeDetails) {
            MetadataService.checkDeployStatus_element request_x = new MetadataService.checkDeployStatus_element();
            request_x.asyncProcessId = asyncProcessId;
            request_x.includeDetails = includeDetails;
            return (AsyncMetadataService.checkDeployStatusResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.checkDeployStatusResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'checkDeployStatus',
                            MetadataService.SOAP_M_URI,
                            'checkDeployStatusResponse',
                            'MetadataService.checkDeployStatusResponse_element'}
            );
        }
        public AsyncMetadataService.checkRetrieveStatusResponse_elementFuture beginCheckRetrieveStatus(System.Continuation continuation,String asyncProcessId,Boolean includeZip) {
            MetadataService.checkRetrieveStatus_element request_x = new MetadataService.checkRetrieveStatus_element();
            request_x.asyncProcessId = asyncProcessId;
            request_x.includeZip = includeZip;
            return (AsyncMetadataService.checkRetrieveStatusResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.checkRetrieveStatusResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'checkRetrieveStatus',
                            MetadataService.SOAP_M_URI,
                            'checkRetrieveStatusResponse',
                            'MetadataService.checkRetrieveStatusResponse_element'}
            );
        }
        public AsyncMetadataService.retrieveResponse_elementFuture beginRetrieve_x(System.Continuation continuation,MetadataService.RetrieveRequest retrieveRequest) {
            MetadataService.retrieve_element request_x = new MetadataService.retrieve_element();
            request_x.retrieveRequest = retrieveRequest;
            return (AsyncMetadataService.retrieveResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.retrieveResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'retrieve',
                            MetadataService.SOAP_M_URI,
                            'retrieveResponse',
                            'MetadataService.retrieveResponse_element'}
            );
        }
        public AsyncMetadataService.cancelDeployResponse_elementFuture beginCancelDeploy(System.Continuation continuation,String String_x) {
            MetadataService.cancelDeploy_element request_x = new MetadataService.cancelDeploy_element();
            request_x.String_x = String_x;
            return (AsyncMetadataService.cancelDeployResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.cancelDeployResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'cancelDeploy',
                            MetadataService.SOAP_M_URI,
                            'cancelDeployResponse',
                            'MetadataService.cancelDeployResponse_element'}
            );
        }
        public AsyncMetadataService.deployRecentValidationResponse_elementFuture beginDeployRecentValidation(System.Continuation continuation,String validationId) {
            MetadataService.deployRecentValidation_element request_x = new MetadataService.deployRecentValidation_element();
            request_x.validationId = validationId;
            return (AsyncMetadataService.deployRecentValidationResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.deployRecentValidationResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'deployRecentValidation',
                            MetadataService.SOAP_M_URI,
                            'deployRecentValidationResponse',
                            'MetadataService.deployRecentValidationResponse_element'}
            );
        }
        public AsyncMetadataService.describeValueTypeResponse_elementFuture beginDescribeValueType(System.Continuation continuation,String type_x) {
            MetadataService.describeValueType_element request_x = new MetadataService.describeValueType_element();
            request_x.type_x = type_x;
            return (AsyncMetadataService.describeValueTypeResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.describeValueTypeResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'describeValueType',
                            MetadataService.SOAP_M_URI,
                            'describeValueTypeResponse',
                            'MetadataService.describeValueTypeResponse_element'}
            );
        }
        public AsyncMetadataService.createMetadataResponse_elementFuture beginCreateMetadata(System.Continuation continuation,MetadataService.Metadata[] metadata) {
            MetadataService.createMetadata_element request_x = new MetadataService.createMetadata_element();
            request_x.metadata = metadata;
            return (AsyncMetadataService.createMetadataResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.createMetadataResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'createMetadata',
                            MetadataService.SOAP_M_URI,
                            'createMetadataResponse',
                            'MetadataService.createMetadataResponse_element'}
            );
        }
        public AsyncMetadataService.deployResponse_elementFuture beginDeploy(System.Continuation continuation,String ZipFile,MetadataService.DeployOptions DeployOptions) {
            MetadataService.deploy_element request_x = new MetadataService.deploy_element();
            request_x.ZipFile = ZipFile;
            request_x.DeployOptions = DeployOptions;
            return (AsyncMetadataService.deployResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.deployResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'deploy',
                            MetadataService.SOAP_M_URI,
                            'deployResponse',
                            'MetadataService.deployResponse_element'}
            );
        }
        public AsyncMetadataService.readMetadataResponse_elementFuture beginReadMetadata(System.Continuation continuation,String type_x,String[] fullNames) {
            MetadataService.readMetadata_element request_x = new MetadataService.readMetadata_element();
            request_x.type_x = type_x;
            request_x.fullNames = fullNames;
            return (AsyncMetadataService.readMetadataResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.readMetadataResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'readMetadata',
                            MetadataService.SOAP_M_URI,
                            'readMetadataResponse',
                            'MetadataService.readMetadataResponse_element'}
            );
        }
        public AsyncMetadataService.upsertMetadataResponse_elementFuture beginUpsertMetadata(System.Continuation continuation,MetadataService.Metadata[] metadata) {
            MetadataService.upsertMetadata_element request_x = new MetadataService.upsertMetadata_element();
            request_x.metadata = metadata;
            return (AsyncMetadataService.upsertMetadataResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.upsertMetadataResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'upsertMetadata',
                            MetadataService.SOAP_M_URI,
                            'upsertMetadataResponse',
                            'MetadataService.upsertMetadataResponse_element'}
            );
        }
        public AsyncMetadataService.listMetadataResponse_elementFuture beginListMetadata(System.Continuation continuation,MetadataService.ListMetadataQuery[] queries,Double asOfVersion) {
            MetadataService.listMetadata_element request_x = new MetadataService.listMetadata_element();
            request_x.queries = queries;
            request_x.asOfVersion = asOfVersion;
            return (AsyncMetadataService.listMetadataResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncMetadataService.listMetadataResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            MetadataService.SOAP_M_URI,
                            'listMetadata',
                            MetadataService.SOAP_M_URI,
                            'listMetadataResponse',
                            'MetadataService.listMetadataResponse_element'}
            );
        }
    }
}
