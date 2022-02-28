/*
    * @author : Yan Nascimento
    * @Date : 31/08/2021
    * @Description : retrieve related contats with accounts, sum the total number of relations and assign it to Account.Number_of_contacts__c
    * @log : 31/08/2021 - created
*/

@IsTest
public class AccountProcessorTest {
    @testSetup
	static void setup() {
    	Account a = new Account();
        a.Name = 'Test Account';
        Insert a;

        Contact cont = New Contact();
        cont.FirstName ='Bob';
        cont.LastName ='Masters';
        cont.AccountId = a.Id;
        Insert cont;

    }
    @isTest
    public static void TestAccountProcessorTest() 
    {
        Account a = [
            SELECT Id, Number_of_Contacts__c
            FROM Account
            WHERE Name = 'Test Account' 
        ];
        Contact cont = [
            SELECT AccountId
            FROM Contact
            WHERE AccountId =: a.Id
        ];
        set<Id> setAccId = new Set<ID>();
        setAccId.add(a.id);
 
        Test.startTest();
        AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        Account ACC = [
            select Number_of_Contacts__c
            from Account
            where id = :a.id
            LIMIT 1
        ];
        System.assertEquals(Integer.valueOf(ACC.Number_of_Contacts__c) ,1);
	}
}