/**
    @author : Yan Nascimento
    @date : 06/10/2021
    @description : batch apex that updates a field on Lead Object
    @log : 06/10/2021 : creation
 */

public class BatchLeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
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
            recordsProcessed += 1;
        }
        UPDATE leads;
    }
    //is shows informations of batch apex
    public void finish (Database.BatchableContext bc) {
        AsyncApexJob job = [
            SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()
        ];
        System.debug('recordsProcessed: '+recordsProcessed);
        System.debug('Job Information: '+job);
    }
}
