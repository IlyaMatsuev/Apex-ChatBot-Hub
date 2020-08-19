/**
 * Created by Ilya Matsuev on 7/26/2020.
 */

@IsTest
public with sharing class BotRegistrationTest {

    private static final String BOT_REGISTRATION_TEST_NAME = 'Test';

    private static final String BOT_WEBHOOK_TEST_PATH_CORRECT = '/test';
    private static final String BOT_WEBHOOK_TEST_PATH_WRONG = '/test/';

    private static final String BOT_SYSTEM_VK = 'VK';
    private static final String BOT_SYSTEM_TELEGRAM = 'Telegram';

    private static final String BOT_TEST_TOKEN = '1231231231';


    @IsTest
    public static void registrationCreateTest() {
        List<ApexClass> storedApexClasses = [
                SELECT Id
                FROM ApexClass
        ];
        Bot_Registration__c registration = new Bot_Registration__c(
                Name = BOT_REGISTRATION_TEST_NAME,
                WebHook_Path__c = BOT_WEBHOOK_TEST_PATH_CORRECT,
                System__c = BOT_SYSTEM_TELEGRAM,
                Token__c = BOT_TEST_TOKEN
        );

        Test.startTest();
        insert registration;
        Test.stopTest();

        List<Bot_Registration__c> registrations = [
                SELECT Name, WebHook_Path__c, System__c, Token__c
                FROM Bot_Registration__c
        ];
        List<ApexClass> createdApexClasses = [
                SELECT Name
                FROM ApexClass
                ORDER BY CreatedDate DESC
        ];

        System.assertEquals(1, registrations.size());
        System.assertEquals(BOT_REGISTRATION_TEST_NAME, registrations.get(0).Name);
        System.assertEquals(BOT_WEBHOOK_TEST_PATH_CORRECT, registrations.get(0).WebHook_Path__c);
        System.assertEquals(BOT_SYSTEM_TELEGRAM, registrations.get(0).System__c);
        System.assertEquals(BOT_TEST_TOKEN, registrations.get(0).Token__c);

        System.assertEquals(1, createdApexClasses.size() - storedApexClasses.size());
        System.assertEquals(WebHookRegistrationHelper.WEB_HOOK_CLASS_PREFIX + BOT_REGISTRATION_TEST_NAME, createdApexClasses.get(0).Name);
    }

    @IsTest
    public static void registrationUpdateTest() {
        String newRegistrationName = BOT_REGISTRATION_TEST_NAME + 'Updated';
        String newWebHookPath = BOT_WEBHOOK_TEST_PATH_CORRECT + 'Updated';
        String newToken = BOT_TEST_TOKEN + 'Updated';

        List<ApexClass> storedApexClasses = [
                SELECT Id
                FROM ApexClass
        ];
        Bot_Registration__c registration = new Bot_Registration__c(
                Name = BOT_REGISTRATION_TEST_NAME,
                WebHook_Path__c = BOT_WEBHOOK_TEST_PATH_CORRECT,
                System__c = BOT_SYSTEM_TELEGRAM,
                Token__c = BOT_TEST_TOKEN
        );

        Test.startTest();
        insert registration;

        registration.Name = newRegistrationName;
        registration.WebHook_Path__c = newWebHookPath;
        registration.Token__c = newToken;

        update registration;
        Test.stopTest();

        List<Bot_Registration__c> registrations = [
                SELECT Name, WebHook_Path__c, System__c, Token__c
                FROM Bot_Registration__c
        ];
        List<ApexClass> createdApexClasses = [
                SELECT Name
                FROM ApexClass
                ORDER BY CreatedDate DESC
        ];

        System.assertEquals(1, registrations.size());
        System.assertEquals(newRegistrationName, registrations.get(0).Name);
        System.assertEquals(newWebHookPath, registrations.get(0).WebHook_Path__c);
        System.assertEquals(BOT_SYSTEM_TELEGRAM, registrations.get(0).System__c);
        System.assertEquals(newToken, registrations.get(0).Token__c);

        System.assertEquals(1, createdApexClasses.size() - storedApexClasses.size());
        System.assertEquals(WebHookRegistrationHelper.WEB_HOOK_CLASS_PREFIX + newRegistrationName, createdApexClasses.get(0).Name);
    }

    @IsTest
    public static void registrationDeleteTest() {
        Bot_Registration__c registration = new Bot_Registration__c(
                Name = BOT_REGISTRATION_TEST_NAME,
                WebHook_Path__c = BOT_WEBHOOK_TEST_PATH_CORRECT,
                System__c = BOT_SYSTEM_TELEGRAM,
                Token__c = BOT_TEST_TOKEN
        );

        Test.startTest();
        insert registration;
        delete registration;
        Test.stopTest();

        List<Bot_Registration__c> registrations = [
                SELECT Name, WebHook_Path__c, System__c, Token__c
                FROM Bot_Registration__c
        ];
        List<ApexClass> createdApexClasses = [
                SELECT Name
                FROM ApexClass
                WHERE Name = :WebHookRegistrationHelper.WEB_HOOK_CLASS_PREFIX + BOT_REGISTRATION_TEST_NAME
        ];

        System.assertEquals(0, createdApexClasses.size());
        System.assertEquals(0, registrations.size());
    }
}
