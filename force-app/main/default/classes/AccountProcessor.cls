public class AccountProcessor {
/*
    * @author : Yan Nascimento
    * @Date : 31/08/2021
    * @Description : retrieve related contats with accounts, sum the total number of relations and assign it to Account.Number_of_contacts__c
    * @log : 31/08/2021 - created
*/
    @future
    public static void countContacts(Set<id> acc) {
        //Retrive contacts
        Contact[] ct = [
            SELECT Id, AccountId
            FROM Contact
            WHERE AccountId =: acc
        ];
        //compare contacts with accounts
        List<Account> acctList = new List<Account>();
        Integer numberOfContactsOnAccount = 0;
        for (Id ac : acc) {
            Account beforeInsertAcct = new Account();
            system.debug('ct: '+ct);
            for (Contact contacts : ct) {
                system.debug('for (Contact contacts : ct) {');
                system.debug(contacts.AccountId);
                if (contacts.AccountId == ac) {
                    numberOfContactsOnAccount += 1;
                }
            }
            beforeInsertAcct.Id = ac;
            beforeInsertAcct.Number_Of_Contacts__c = numberOfContactsOnAccount;
            acctList.add(beforeInsertAcct);
            numberOfContactsOnAccount = 0;
        }
        UPSERT acctList;
    }
}