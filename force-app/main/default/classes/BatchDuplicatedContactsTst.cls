@isTest
public with sharing class BatchDuplicatedContactsTst {
    @TestSetup
    static void setup() {
        List<Contact> ctList = new List<Contact>();
        for (Integer i = 0; i < 5; i++) {
            Contact ct = new Contact();
            ct.FirstName = 'test' + String.valueOf(i);
            ct.Lastname = 'lastTest' + String.valueOf(i);
            if (math.mod(i, 2) == 0) {
                ct.Email = 'testRepete@gmail.com';
            } else {
                ct.Email = 'test' + i + '@gmail.com';
            }
            ctList.add(ct);
        }
        Database.insert(ctList);
    }

    @isTest
    static void duplicateContactTest() {
        Test.startTest();
        BatchDuplicatedContacts b = new BatchDuplicatedContacts();
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        List<Contact> ct = [
            SELECT Id
            FROM Contact
        ];
        System.assertEquals(3, ct.size());
    }
}
