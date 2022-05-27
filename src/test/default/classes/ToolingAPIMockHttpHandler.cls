/**
 * Created by Ilya Matsuev on 7/26/2020.
 */

public with sharing class ToolingAPIMockHttpHandler implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(201);
        return response;
    }
}
