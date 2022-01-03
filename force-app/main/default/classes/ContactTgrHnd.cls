/**
    @author : Yan Nascimento
    @description : future method
        1. Notify a Contact that his email has been changed
        2. Increment a count field when an email is sent
    @log : 02/01/2022 : creation
 */

public with sharing class ContactTgrHnd {
    public static void sendEmail(List<Contact> contacts, Map<Id, Contact> oldMapContacts) {
        List<Id> ids = new List<Id>();
        for (String ct : oldMapContacts.keySet()) {
            if (contacts[0].Email != oldMapContacts.get(ct).Email && contacts[0].Id == oldMapContacts.get(ct).Id) {
                ids.add(contacts[0].Id);
                //Send email to the Contact
                SendEmail.massEmailing(ids);
                //Increment the Counter Field
                QueueableCounter updateJob = new QueueableCounter(contacts[0]);
                ID jobID = System.enqueueJob(updateJob);
            }
        }
    }   
}
