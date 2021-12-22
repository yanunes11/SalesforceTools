/**
     @author : Yan Nascimento
     @description : possiblities using maps
     @log : 22/12/2021 - creation
 */

public with sharing class mapTools {
    //map that key is BillingState and the it returns a list of accounts
    public stringListString() {
        Map<String, List<Account>> accountMap = new Map<String, List<Account>>();
        List<Account> accounts = [
            SELECT BillingState, Name
            FROM Account
            WHERE BillingState != NULL
        ];
        for (Account acct : accounts) {
            List<Account> accList = 
                (accountMap.containsKey(acct.BillingState)) ? accountMap.get(acct.BillingState) : new List<Account>();
            accList.add(acct);
            accountMap.put(acct.BillingState, accList);
        }
        for (String ls : accountMap.keySet()) {
            system.debug('>>>>> accountMap.get('+ls+'): '+accountMap.get(ls));
        }
    }
}
