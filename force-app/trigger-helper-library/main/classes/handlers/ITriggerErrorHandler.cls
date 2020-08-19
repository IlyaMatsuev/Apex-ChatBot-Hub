/**
 * Created by Ilya Matsuev on 7/3/2020.
 */

global interface ITriggerErrorHandler {

    void handle(TriggerContext context, Exception error);
}
