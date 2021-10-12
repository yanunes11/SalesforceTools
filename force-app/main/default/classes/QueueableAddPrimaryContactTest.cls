@isTest
public with sharing class QueueableAddPrimaryContactTest {
    @TestSetup
    static void setup(){
        List<Account> accountList = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            Account account = new Account();
            if (i >= 0 && i < 50) {
                account.Name = 'test ' + i;
                account.BillingState = 'NY';
            } else {
                account.Name = 'test ' + i;
                account.BillingState = 'CA';
            }
            accountList.add(account);
        }
        INSERT accountList;
    }
    @isTest
    public static void QueueableAddPrimaryContactTest() {
        Contact contact = new Contact();
        contact.LastName = 'Contact';
        contact.FirstName = 'Test';
        INSERT contact;

        QueueableAddPrimaryContact updater = new QueueableAddPrimaryContact(contact, 'CA');
        Test.startTest();
            System.enqueueJob(updater);
        Test.stopTest();
        
    }
}
