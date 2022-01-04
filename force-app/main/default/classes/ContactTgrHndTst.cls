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
    @isTest
    public static void IncrementCounterAndSendEmailTst() {
        List<Contact> contacts = [
            SELECT Id, Email, Counter__c
            FROM Contact
            LIMIT 3
        ];
        //ATTENTION: you need to query twice to compare at the end on the assertEquals the old and new value 
        List<Contact> oldContacts = [
            SELECT Id, Email, Counter__c
            FROM Contact
            LIMIT 3
        ];
        Test.startTest();
        Integer i = 3;
        for (Contact ct : contacts) {
            ct.Email = 'yannascimento'+String.valueOf(i)+'@gmail.com';
            i++;
        }
        update contacts;
        Test.stopTest();
        Integer sumCounter = 0;
        for (i = 0; i < contacts.size(); i++) {
            if (oldContacts[i].Email != contacts[i].Email) {
                sumCounter += 1;
            }
        }
        System.assertEquals(contacts.size(), sumCounter);
    }
}
