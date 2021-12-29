/**
    @author : Yan Nascimento
    @date : 28/12/2021
    @description : schedule job that invokes the class BatchDuplicatedContacts
    @log : 28/12/2021 : creation
 */

global with sharing class ScheduleDailyDuplicateContacts implements Schedulable {
    global void execute(SchedulableContext ctx) {
        BatchDuplicatedContacts b = new BatchDuplicatedContacts();
        Id batchId = Database.executeBatch(b, 50);
    }
}
