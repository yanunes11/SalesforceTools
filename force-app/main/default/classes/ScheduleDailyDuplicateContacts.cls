/**
    @author : Yan Nascimento
    @date : 28/12/2021
    @description : schedule job that invokes the class BatchDuplicatedContacts
    @log : 28/12/2021 : creation
 */

public with sharing class ScheduleDailyDuplicateContacts implements Schedulable {
    public void execute(SchedulableContext ctx) {
        BatchDuplicatedContacts b = new BatchDuplicatedContacts();
        Id batchId = Database.executeBatch(b, 100);
    }
}
