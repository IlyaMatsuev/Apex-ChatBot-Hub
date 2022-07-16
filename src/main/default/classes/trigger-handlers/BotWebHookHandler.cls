public class BotWebHookHandler implements Triggers.IHandler {
    public void handle(Triggers.Context context) {
        switch on context.props.operation {
            when AFTER_INSERT, AFTER_UNDELETE {
                // Add WebHook
            }
            when AFTER_DELETE {
                // Remove WebHook
            }
        }
    }
}
