/**
    @author : Yan Nascimento
    @description : queueable method the increments a Counter Field the contact email has changed
    @log : 03/01/2022 : creation
 */

public with sharing class QueueableCounter implements Queueable {
    public contact ct;
    
    public QueueableCounter(Contact record) {
        this.ct = record;
    }
    public void execute(QueueableContext qc) {
        if (String.isNotBlank(ct.Id)) {
            Contact updateContact = new Contact();
            Contact ctQuery = [
                SELECT Id, Counter__c
                FROM Contact
                WHERE Id = :ct.Id
            ];
            updateContact.Id = ctQuery.Id;
            if (ctQuery.Counter__c == null) {
                ctQuery.Counter__c = 0;
            }
            updateContact.Counter__c = ctQuery.Counter__c + 1;
            Database.update(updateContact);
        }
    }
}
