@isTest
public with sharing class ExceptionExampleTst {
    @TestSetup
    static void setup(){
        Account acct = new Account(Name = 'Yan Nascimento');
        insert acct;
        Contact ct = new Contact(FirstName = 'Yan', LastName = 'Nascimento');
        insert ct;
        Lead ld = new Lead(FirstName = 'Yan', LastName = 'Nascimento', Company = 'Yan Corp');
        insert ld;
    }
    @isTest
    public static void accountTest() {
        SObject sObj = [SELECT Id, Name FROM Account LIMIT 1];
        Boolean exceptionOccurred = false;
        Test.startTest();
        try {
            ExceptionExample.notMappedField(sObj);
        } catch(MyException e) {
            exceptionOccurred = true;
        }
        Test.stopTest();
        System.assert(exceptionOccurred == false, 'There is an exception');
    }
    @isTest
    public static void contactTest() {
        SObject sObj = [SELECT Id, FirstName, LastName FROM Contact LIMIT 1];
        Boolean exceptionOccurred = false;
        Test.startTest();
        try {
            ExceptionExample.notMappedField(sObj);
        } catch(MyException e) {
            exceptionOccurred = true;
        }
        Test.stopTest();
        System.assert(exceptionOccurred == false, 'There is an exception');
    }
    @isTest
    public static void notMappedFieldTest() {
        SObject sObj = [SELECT Id FROM Lead LIMIT 1];
        Boolean exceptionOccurred = false;
        Test.startTest();
        try {
            ExceptionExample.notMappedField(sObj);
        } catch(MyException e) {
            exceptionOccurred = true;
        }
        Test.stopTest();
        System.assert(exceptionOccurred == true, 'There is an exception');
    }
}

