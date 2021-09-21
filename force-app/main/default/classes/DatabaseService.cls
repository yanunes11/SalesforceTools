/**
    @author : Yan Nascimento
    @date : 21/09/2021
    @description : make it easy to use a Database class
    @log : 21/09/2021 : creation
 */
public with sharing class DatabaseService {
    //insert a list of Accounts
    public static void insertAccount(List<account> accountList) {
        Database.SaveResult[] srList = Database.insert(accountList, false);
        //track saved records
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                system.debug('Sucessfully inserted: ' +sr.getId());
            } else {
                for(Database.Error objErr : sr.getErrors()) {
                    system.debug('The following errors occured: ');
                    system.debug(objErr.getStatusCode() + ' ' + objErr.getMessage());
                    system.debug('Object field affected: ' +objErr.getFields());
                }
            }
        }
    }
}