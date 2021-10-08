@isTest
public class BatchLeadProcessorTest {
    @TestSetup
    static void setup(){
        List<Lead> leads = New List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead ld = new Lead();
            ld.LastName = 'Test ' + i;
            ld.Company = 'Company ' + i;
            ld.LeadSource = 'LdSource ' + i;
            leads.add(ld);
        }
        INSERT leads;
    }
    @isTest
    public static void BatchLeadProcessorTest() {
        Test.startTest();
        BatchLeadProcessor ldProcessor = new BatchLeadProcessor();
        Id batchId = Database.executeBatch(ldProcessor);
        Test.stopTest();
        List<Lead> totalLeads = [
            SELECT LeadSource
            FROM Lead
            WHERE LeadSource = 'Dreamforce'
        ];
        System.assertEquals(totalLeads.size(), 200);
    }
}
