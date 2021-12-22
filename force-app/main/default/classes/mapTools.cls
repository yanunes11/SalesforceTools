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
        ];
        Set<String> stateList = new Set<String>();
        for (Account acct : accounts) {
            if (String.isNotBlank(acct.BillingState)) {
                stateList.add(acct.BillingState);
            }
        }
        for (String ls : stateList) {
            List<Account> master = new List<Account>();
            for (Account acct : accounts) {
                if (ls == acct.BillingState) {
                    master.add(acct);
                }
            }
            accountMap.put(ls, master);
        }
        for (String ls : stateList) {
            system.debug('>>>>> accountMap.get('+ls+'): '+accountMap.get(ls));
        }
    }
}
