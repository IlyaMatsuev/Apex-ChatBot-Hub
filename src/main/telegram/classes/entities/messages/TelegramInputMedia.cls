/**
 * @description Describes the input media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
 * Source: https://core.telegram.org/bots/api#inputmedia
 */
global abstract class TelegramInputMedia extends TelegramSendMessageOptions {
    protected TelegramInputMedia(String type, String media) {
        super('caption_entities');
        payload.set('type', type);
        payload.set('media', media);
    }

    protected TelegramInputMedia addCaption(String caption) {
        payload.set('caption', caption);
        return this;
    }

    protected TelegramInputMedia addSpoiler() {
        payload.set('has_spoiler', true);
        return this;
    }

    protected TelegramInputMedia addThumbnail(String thumbnailUrl) {
        payload.set('thumbnail', thumbnailUrl);
        return this;
    }
}
