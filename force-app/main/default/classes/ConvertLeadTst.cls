/**
    @author : Yan Nascimento
    @date : 14/01/2021
    @description : convert lead
    @log : 14/01/2021 : creation
 */
@istest
public class ConvertLeadTest {
    @TestSetup
    static void createData(){
        Lead newLead = new Lead();
        newLead.FirstName = 'test';
        newLead.lastname = '1';
        newLead.Company = 'test 1 company';
        INSERT newLead;
        ConvertLead.toConvert(newLead.Id);
    }
    @isTest
    static void convertedLead() {
        LeadStatus lead = [
            SELECT Id, IsConverted
            FROM LeadStatus
            LIMIT 1
        ];
        Test.startTest();
            System.assertEquals(true, lead.isConverted);
        Test.stopTest();
    }
}