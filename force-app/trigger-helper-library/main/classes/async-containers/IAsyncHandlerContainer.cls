/**
 * Created by Ilya Matsuev on 7/1/2020.
 */

public interface IAsyncHandlerContainer {

    void execute(TriggerContext context, ITriggerHandler handler, Map<TriggerBindOption, Object> options);
}
