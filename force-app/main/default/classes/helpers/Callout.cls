/**
 * Created by Ilya Matsuev on 7/25/2020.
 */

public with sharing class Callout {

    public String endpoint {get; private set;}
    public String method {get; private set;}
    public String requestBody {get; private set;}
    public Map<String, String> requestHeaders {get; private set;}

    public Integer statusCode {get; private set;}
    public String statusMessage {get; private set;}
    public String responseBody {get; private set;}
    public Map<String, String> responseHeaders {get; private set;}

    public Callout(String endpoint, String method, Map<String, String> requestHeaders, String requestBody) {
        this.endpoint = endpoint;
        this.method = method;
        this.requestHeaders = requestHeaders;
        this.requestBody = requestBody;
        send();
    }

    public Callout(String endpoint, String method, Map<String, String> requestHeaders) {
        this.endpoint = endpoint;
        this.method = method;
        this.requestHeaders = requestHeaders;
        send();
    }

    public Callout(String endpoint, String method, String requestBody) {
        this.endpoint = endpoint;
        this.method = method;
        this.requestBody = requestBody;
        send();
    }

    public Callout(String endpoint, String method) {
        this.endpoint = endpoint;
        this.method = method;
        send();
    }


    private void send() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod(method);
        if (requestBody != null) {
            request.setBody(requestBody);
        }
        if (requestHeaders != null) {
            for (String header: requestHeaders.keySet()) {
                request.setHeader(header, requestHeaders.get(header));
            }
        }
        HttpResponse response = new Http().send(request);
        statusCode = response.getStatusCode();
        statusMessage = response.getStatus();
        responseBody = response.getBody();
        responseHeaders = new Map<String, String>();
        for (String header: response.getHeaderKeys()) {
            responseHeaders.put(header, response.getHeader(header));
        }
    }

    public Boolean isSuccess() {
        return Math.floor(statusCode / 100) == 2;
    }
}
