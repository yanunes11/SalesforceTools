@isTest
public with sharing class DatabaseQueriesTest {
    @TestSetup
    static void setup(){
        Lead leadCreated = new Lead(LastName = 'Smith', Company = 'test lead');
        INSERT leadCreated;

        Contact contactCreated = new Contact(LastName = 'Smith');
        INSERT contactCreated;
    }

    @isTest
    public static void SOSLsearchContactsAndLeadsTest() {
        Test.startTest();
        List<List<SObject>> listOfContactsAndLeads = DatabaseQueries.SOSLsearchContactsAndLeads('Smith');
        Test.stopTest();
        Boolean createdLeadAndContact = listOfContactsAndLeads.size() == 2 ? true : false;
        System.AssertEquals(true, createdLeadAndContact);
    }
}
