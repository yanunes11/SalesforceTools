/**
    @author : Yan Nascimento
    @date : 21/09/2021
    @description : before and after insert and update
    @log : 21/09/2021 : creation
 */

trigger createPagamentotrigger on Account (before insert, after insert, after update) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            Account acct = new Account();
            acct.Description = 'inserted with isBefore' + date.today();
        }
        if (Trigger.isAfter) {
            insertPagamentoInAccount.insertinginAccount(Trigger.New);
        }
    } else if (Trigger.isUpdate) {
        insertTaskInAccount.insertTaskInAccount(Trigger.New);
        insertingWithDataBase.inserting(Trigger.New);
    }

}