/**
    @author : Yan Nascimento
    @date : 10/12/2021
    @description : scheduleable apex that change a field on leads
    @log : 10/12/2021 : creation
 */

public with sharing class ScheduleDailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [
            SELECT Id, LeadSource
            FROM Lead
            LIMIT 200
        ];
        for (Lead ld : leads) {
            ld.LeadSource = 'Dreamforce';
        }
        UPDATE leads;
    }
}
