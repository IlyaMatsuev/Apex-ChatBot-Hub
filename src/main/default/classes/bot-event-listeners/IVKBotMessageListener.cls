/**
 * Created by Ilya Matsuev on 8/26/2020.
 */

public interface IVKBotMessageListener extends IBotMessageListener {
    void onMessage(VKBotService botService);
}
