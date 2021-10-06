/**
    @author : Yan Nascimento
    @date : 06/10/2021
    @description : batch apex that updates a field on Lead Object
    @log : 06/10/2021 : creation
 */

public class LeadProcessor implements Database.Batchable<sObject> {
    public Integer recordsProcessed = 0;
    //Retrieve the Lead values
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT LeadSource FROM Lead '
        );
    }
    //update the LeadSource  field with 'Dreamforce' value
    public void execute(Database.BatchableContext bc, List<Lead> scope) {
        List<Lead> leads = new List<Lead>();
        for (Lead ld : scope) {
            ld.LeadSource = 'Dreamforce';
            leads.add(ld);
            recordsProcessed = recordsProcessed + 1;
        }
        UPDATE leads;
    }
    //is shows the quantity of changed records
    public void finish (Database.BatchableContext bc) {
        System.debug('recordsProcessed: '+recordsProcessed);
    }
}
