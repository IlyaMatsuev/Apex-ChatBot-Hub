/**
 * Created by Ilya Matsuev on 7/1/2020.
 */

global interface ITriggerHandler {
    void handle(TriggerContext context, ITriggerService service);
}
