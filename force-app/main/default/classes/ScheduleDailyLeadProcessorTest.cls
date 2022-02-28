@isTest
public with sharing class ScheduleDailyLeadProcessorTest {
    @TestSetup
    static void setup(){
        List<Lead> leadList = New List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead ld = new Lead(Firstname = 'test',LastName = ''+i, Company = 'tests'+i);
            leadList.add(ld);
        }
        INSERT leadList;
    }
    public static String CRON_EXP = '0 0 13 * * ?';
    
    @isTest
    public static void ScheduleDailyLeadProcessorTest() {
        Test.startTest();
        String JobId = System.schedule('TestScheduable', CRON_EXP, new ScheduleDailyLeadProcessor());
        Test.stopTest();
        List<Lead> leadList = [
            SELECT Id, LeadSource
            FROM Lead
            WHERE LeadSource = 'Dreamforce'
        ];
        System.assertEquals(200, leadList.size());
    }
}