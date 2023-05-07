public abstract class BotCalloutMock implements HttpCalloutMock {
    private ResponseOverrides overrides;

    public HttpResponse respond(HttpRequest request) {
        Assert.areEqual('POST', request.getMethod());
        Assert.areEqual('application/json', request.getHeader('Content-Type'));

        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setHeader('Content-Type', 'application/json');
        response.setBody(
            handleRequest(BotJsonPayload.fromJson(request.getBody()), request.getEndpoint().substringAfterLast('/'))
        );

        if (overrides != null) {
            overrides.apply(response);
        }

        return response;
    }

    public HttpCalloutMock overrideResponse(Integer statusCode, String responseBody) {
        this.overrides = new ResponseOverrides(statusCode, responseBody);
        return this;
    }

    protected abstract String handleRequest(BotJsonPayload request, String method);

    protected Long generateExternalId() {
        Long min = 1000000L;
        Long max = 1000000000L;
        return (Long) Math.round(Math.random() * (max - min) + min);
    }

    private class ResponseOverrides {
        private Integer statusCode;
        private String responseBody;

        public ResponseOverrides(Integer statusCode, String responseBody) {
            this.statusCode = statusCode;
            this.responseBody = responseBody;
        }

        public void apply(HttpResponse response) {
            response.setStatusCode(statusCode);
            response.setBody(responseBody);
        }
    }
}
