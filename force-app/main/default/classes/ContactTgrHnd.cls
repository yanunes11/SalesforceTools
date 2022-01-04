/**
    @author : Yan Nascimento
    @description : method to invoke a future and queueable method to:
        1. Notify a Contact that his email has been changed
        2. Increment a count field when an email is sent
    @log : 02/01/2022 : creation
 */

public with sharing class ContactTgrHnd {
    public static void sendEmail(Map<Id, Contact> newMapContacts, Map<Id, Contact> oldMapContacts) {
        List<Id> ids = new List<Id>();
        List<Contact> contactList = new List<Contact>();
        for (String ct : oldMapContacts.keySet()) {
            if (newMapContacts.get(ct).Email != oldMapContacts.get(ct).Email && newMapContacts.get(ct).Id == oldMapContacts.get(ct).Id) {
                ids.add(newMapContacts.get(ct).Id);
                contactList.add(newMapContacts.get(ct));
            }
        }
        //Send email to the Contact
        if (ids.size() > 0) {
            SendEmail.massEmailing(ids);
        }
        //Increment the Counter Field
        if (contactList.size() > 0) {
            QueueableCounter updateJob = new QueueableCounter(contactList);
            ID jobID = System.enqueueJob(updateJob);
        }
    }   
}
