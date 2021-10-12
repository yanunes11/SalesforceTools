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
