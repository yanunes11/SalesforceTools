/**
    @author : Yan Nascimento
    @description : queueable method the increments a Counter Field the contact email has changed
    @log : 03/01/2022 : creation
 */

public with sharing class QueueableCounter implements Queueable {
    public List<Contact> contacts;
    public QueueableCounter(List<Contact> records) {
        this.contacts = records;
    }
    public void execute(QueueableContext qc) {
        List<Contact> ctQuery = [
            SELECT Id, Counter__c
            FROM Contact
            WHERE Id IN :contacts
        ];
        for (Contact ct : ctQuery) {
            if (ct.Counter__c == null) {
                ct.Counter__c = 0;
            }
            ct.Counter__c = ct.Counter__c + 1;
        }
        Database.update(ctQuery);
    }
}
