/**
    @author : Yan Nascimento
    @description : future method
        1. Notify a Contact that his email has been changed
        2. Increment a count field when an email is sent
    @log : 02/01/2022 : creation
 */

public with sharing class ContactTgrHnd {
    public static void sendEmail(Map<Id, Contact> contacts, Map<Id, Contact> oldMapContacts) {
        List<Id> ids = new List<Id>();
        List<Contact> contactList = new List<Contact>();
        for (String ct : oldMapContacts.keySet()) {
            if (contacts.get(ct).Email != oldMapContacts.get(ct).Email && contacts.get(ct).Id == oldMapContacts.get(ct).Id) {
                ids.add(contacts.get(ct).Id);
                contactList.add(contacts.get(ct));
            }
        }
        //Send email to the Contact
        SendEmail.massEmailing(ids);
        //Increment the Counter Field
        QueueableCounter updateJob = new QueueableCounter(contactList);
        ID jobID = System.enqueueJob(updateJob);
    }   
}
