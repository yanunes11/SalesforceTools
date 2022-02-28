/**
    @author : Yan Nascimento
    @date : 11/10/2021
    @description : query tools
    @log : 11/10/2021 : creation
 */

public with sharing class DatabaseQueries {
    //SOSL that finds Leads and/or Contacts with a specifica string
    public static List<List<SObject>> SOSLsearchContactsAndLeads(String str) {
        List<List<SObject>> listOfContactAndAccount = [
            FIND :str
            IN ALL FIELDS
            RETURNING Lead(LastName, FirstName), Contact(LastName, FirstName)
        ];
        List<Lead> searchLeads = (List<Lead>) listOfContactAndAccount[0];
        List<Contact> searchContact = (List<Contact>) listOfContactAndAccount[1];
        return listOfContactAndAccount;
    }
}
