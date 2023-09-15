@IsTest
public class ViberBotCalloutMock extends BotCalloutMock {

    protected override String handleRequest(BotJsonPayload request, String method) {
        switch on method {
            when 'set_webhook' {
                return setWebhook(request);
            }
            when 'send_message' {
                return sendMessage(request);
            }
            when 'broadcast_message' {
                return broadcastMessage(request);
            }
        }
        throw new IllegalArgumentException('The provided viber bot method is not correct: ' + method);
    }

    private String setWebhook(BotJsonPayload request) {
        String webhookUrl = request.getString('url');
        if (webhookUrl == '') {
            return new BotJsonPayload().set('status', 0).set('status_message', 'ok').toJson();
        }
        Assert.isTrue(Pattern.matches('Viber/\\w{15,18}/\\w+', webhookUrl.substringAfter('bots/')));
        Assert.isTrue(request.hasValue('event_types'));
        Assert.isTrue(request.getBoolean('send_name'));
        Assert.isTrue(request.getBoolean('send_photo'));
        return new BotJsonPayload()
            .set('status', 0)
            .set('status_message', 'ok')
            .set('event_types', request.get('event_types'))
            .toJson();
    }

    private String sendMessage(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('receiver'));
        Assert.isTrue(request.hasValue('type'));
        Assert.isTrue(request.hasValue('sender'));
        String messageType = request.getString('type');
        switch on messageType {
            when 'text' {
                assertTextMessagePayload(request);
            }
            when 'picture' {
                assertPictureMessagePayload(request);
            }
            when 'video' {
                assertVideoMessagePayload(request);
            }
            when 'file' {
                assertFileMessagePayload(request);
            }
            when 'contact' {
                assertContactMessagePayload(request);
            }
            when 'location' {
                assertLocationMessagePayload(request);
            }
            when 'sticker' {
                assertStickerMessagePayload(request);
            }
            when 'url' {
                assertUrlMessagePayload(request);
            }
            when 'rich_media' {
                assertRichMediaMessagePayload(request);
            }
            when else {
                throw new IllegalArgumentException('The provided viber message type is not correct: ' + messageType);
            }
        }
        return new BotJsonPayload()
            .set('status', 0)
            .set('status_message', 'ok')
            .set('message_token', generateExternalId())
            .set('chat_hostname', 'SN-CHAT-05_')
            .set('billing_status', 1)
            .toJson();
    }

    private String broadcastMessage(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('broadcast_list'));
        Assert.isTrue(request.hasValue('type'));
        Assert.isTrue(request.hasValue('sender'));
        if (request.getString('type') == 'text') {
            Assert.isTrue(request.hasValue('text'));
        } else {
            throw new IllegalArgumentException('Viber broadcast message mock supports "text" messages only');
        }
        return new BotJsonPayload()
            .set('status', 0)
            .set('status_message', 'ok')
            .set('message_token', generateExternalId())
            .set('failed_list', new List<Object>())
            .toJson();
    }

    private void assertTextMessagePayload(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('text'));
    }

    private void assertPictureMessagePayload(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('media'));
    }

    private void assertVideoMessagePayload(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('media'));
        Assert.isTrue(request.hasValue('size'));
    }

    private void assertFileMessagePayload(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('media'));
        Assert.isTrue(request.hasValue('size'));
        Assert.isTrue(request.hasValue('file_name'));
    }

    private void assertContactMessagePayload(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('contact'));
        BotJsonPayload contact = request.getJsonPayload('contact');
        Assert.isTrue(String.isNotBlank(contact.getString('name')));
        Assert.isTrue(String.isNotBlank(contact.getString('phone_number')));
    }

    private void assertLocationMessagePayload(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('location'));
        BotJsonPayload location = request.getJsonPayload('location');
        Assert.isTrue(String.isNotBlank(location.getString('lat')));
        Assert.isTrue(String.isNotBlank(location.getString('lon')));
    }

    private void assertStickerMessagePayload(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('sticker_id'));
    }

    private void assertUrlMessagePayload(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('media'));
    }

    private void assertRichMediaMessagePayload(BotJsonPayload request) {
        Assert.isTrue(request.hasValue('rich_media'));
        BotJsonPayload richMedia = request.getJsonPayload('rich_media');
        Assert.isTrue(richMedia.hasValue('Buttons'));
        Assert.areEqual(richMedia.getString('Type'), 'rich_media');
    }
}
