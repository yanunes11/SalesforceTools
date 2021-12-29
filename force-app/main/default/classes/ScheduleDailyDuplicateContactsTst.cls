@isTest
public with sharing class ScheduleDailyDuplicateContactsTst {
    public static String cronExp = '0 0 0 * * ?';
    @TestSetup
    static void setup(){
        List<Contact> ctList = new List<Contact>();
        for (Integer i = 0; i < 100; i++) {
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
    public static void ScheduleDailyDuplicateContactsTst() {
        Test.startTest();
        String jobId = System.schedule('ScheduleDuplicatedContactsBatch', cronExp, new ScheduleDailyDuplicateContacts());
        Test.stopTest();
        //ATTENTION: You cannot test a batch invoked by a schedule apex. Then only can test if a shedule was created
        List<AsyncApexJob> jobsScheduled = [
            SELECT Id, ApexClassId, ApexClass.Name, Status
            FROM AsyncApexJob
            WHERE JobType = 'ScheduledApex'
        ];
        System.assertEquals(1, jobsScheduled.size());
    }
}
