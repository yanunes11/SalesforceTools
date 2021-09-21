@isTest
public with sharing class DatabaseServiceTest {
    @TestSetup
    static void createData(){
        //INSERT ACCOUNTS
        List<Account> addAccount = new List<Account>();
        Integer i;
        for (i = 0; i < 10; i++) {
            //CREATE 9 ACCOUNTS
            Account acct = new Account();
            if (i < 9) {
                acct.Name = 'Test' + (i + 1);
                acct.Phone = '554199195678' + i;
                addAccount.add(acct);
            //CREATE A DEFECT ACCOUNT
            } else {
                acct.Phone = '554199195678' + i;
                addAccount.add(acct);
            }
        }
        DatabaseService.insertAccount(addAccount);
    }
    @isTest
    static void InsertAccountTest() {
        List<Account> accounts = [
            SELECT Id 
            FROM Account
        ];
        Test.StartTest();
        system.assertEquals(9, accounts.size());
        Test.StopTest();

    }
}
