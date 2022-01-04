/**
    @author : Yan Nascimento
    @description : future method notifying a Contact that his email has been changed
    @log : 02/01/2022 : creation
 */

public with sharing class ContactTgrHnd {
    public static void sendEmail(List<Contact> contacts, Map<Id, Contact> oldMapContacts) {
        List<Id> ids = new List<Id>();
        for (String ct : oldMapContacts.keySet()) {
            if (contacts[0].Email != oldMapContacts.get(ct).Email && contacts[0].Id == oldMapContacts.get(ct).Id) {
                ids.add(contacts[0].Id);
                SendEmail.massEmailing(ids);
            }
        }
    }   
}
