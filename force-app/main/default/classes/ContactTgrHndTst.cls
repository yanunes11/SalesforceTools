@isTest
public with sharing class ContactTgrHndTst {
    @TestSetup
    static void setup(){
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 3; i++) {
            Contact ct = new Contact();
            ct.FirstName = 'Yan';
            ct.LastName = 'Nascimento' + String.valueOf(i);
            ct.Email = 'yannascimento'+String.valueOf(i)+'@gmail.com';
            contacts.add(ct);
        }
        insert contacts;
    }
    public static Integer changeEmails(List<Contact> contacts) {
        Integer sumCounter = 0;
        Integer i = 0;
        for (Contact ct : contacts) {
            ct.Email = 'yannascimento'+String.valueOf(i)+'@gmail.com';
            if (ct.Counter__c == null) {
                ct.Counter__c = 0;
            }
            ct.Counter__c += 1;
            sumCounter += (Integer)ct.Counter__c;
            i++;
        }
        update contacts;
        return sumCounter;
    }
    @isTest
    public static void IncrementCounterTst() {
        List<Contact> contacts = [
            SELECT Id, Email, Counter__c
            FROM Contact
            LIMIT 3
        ];
        Test.startTest();
        Integer sumCounter = changeEmails(contacts);
        System.assertEquals(3, sumCounter);
        sumCounter = changeEmails(contacts);
        System.assertEquals(6, sumCounter);
        Test.stopTest();

    }
}
