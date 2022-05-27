/**
 * Created by Ilya Matsuev on 8/15/2020.
 */

public with sharing class NotificationHelper {
    public static List<Messaging.SendEmailResult> sendEmail(String subject, String body, String address) {
        return sendEmail(subject, body, new List<String>{ address });
    }

    public static List<Messaging.SendEmailResult> sendEmail(String subject, String body, List<String> addresses) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        mail.setToAddresses(addresses);
        mail.setCharset('UTF-8');
        return Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ mail });
    }
}
