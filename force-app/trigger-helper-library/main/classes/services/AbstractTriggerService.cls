/**
 * Created by Ilya Matsuev on 7/12/2020.
 */

global with sharing abstract class AbstractTriggerService {

    protected TriggerContext context {
        get;
        private set {
            if (context != null) {
                throw new TriggerDispatcherException(Label.CannotSetTriggerContext);
            }
            context = value;
        }
    }


    public void setContext(TriggerContext context) {
        this.context = context;
    }

    global virtual void insertRelatedRecords() {}

    global virtual void updateRelatedRecords() {}

    global virtual void deleteRelatedRecords() {}
}
