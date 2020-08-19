/**
 * Created by Ilya Matsuev on 7/1/2020.
 */

public with sharing class TriggerContextBuilder {

    public static TriggerContext getContext() {
        return new TriggerContext();
    }
}
