public interface IBotUpdateResolver {
    BotModel resolve(BotUpdateApi.UriParams params, Map<String, String> headers);
}
