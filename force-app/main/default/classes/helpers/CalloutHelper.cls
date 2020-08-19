/**
 * Created by Ilya Matsuev on 7/25/2020.
 */

public with sharing class CalloutHelper {

    public static final String SLASH = '/';
    public static final String SPACE = ' ';

    public static final String METHOD_GET = 'GET';
    public static final String METHOD_POST = 'POST';
    public static final String METHOD_PUT = 'PUT';
    public static final String METHOD_DELETE = 'DELETE';

    public static final String CONTENT_TYPE_HEADER = 'Content-Type';
    public static final String AUTHORIZATION_HEADER = 'Authorization';

    public static final String BEARER_AUTHORIZATION = 'Bearer';
    public static final String JSON_CONTENT_TYPE = 'application/json';
    public static final String URL_ENCODED_TYPE = 'application/x-www-form-urlencoded';


    public static String getOrgUrl() {
        return Url.getSalesforceBaseUrl().toExternalForm();
    }

    public static String getRESTUrlStart() {
        return getOrgUrl() + '/services/apexrest';
    }

    public static String getToolingAPIUrl() {
        return getOrgUrl() + '/services/data/v46.0/tooling';
    }

    public static String getToolingApexClassesAPIUrl() {
        return getToolingAPIUrl() + '/sobjects/ApexClass';
    }

    public static String buildUrlParams(Map<String, String> params) {
        List<String> paramPairs = new List<String>();
        for (String paramName: params.keySet()) {
            paramPairs.add(paramName + '=' + params.get(paramName));
        }
        return '?' + String.join(paramPairs, '&');
    }
}
