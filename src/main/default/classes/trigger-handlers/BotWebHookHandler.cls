public class BotWebHookHandler implements Triggers.IHandler {
    public void handle(Triggers.Context context) {
        switch on context.operation {
            when AFTER_INSERT, AFTER_UNDELETE {
                registerWebHooks(context.newList);
            }
            when AFTER_UPDATE {
                updateWebHooks(context.newList, (Map<Id, Bot__c>) context.oldMap);
            }
            when AFTER_DELETE {
                removeWebHooks(context.oldList);
            }
        }
    }

    private void registerWebHooks(List<Bot__c> bots) {
        for (Bot__c bot : bots) {
            // TODO: Get rid of this helper
            WebHookRegistrationHelper.registerWebHookHandler(bot);
        }
    }

    private void updateWebHooks(List<Bot__c> bots, Map<Id, Bot__c> oldBots) {
        for (Bot__c bot : bots) {
            // TODO: Get rid of this helper
            WebHookRegistrationHelper.updateWebHookHandler(oldBots.get(bot.Id), bot);
        }
    }

    private void removeWebHooks(List<Bot__c> bots) {
        for (Bot__c bot : bots) {
            // TODO: Get rid of this helper
            WebHookRegistrationHelper.removeWebHookHandler(bot);
        }
    }
}
