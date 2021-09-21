/*
    * @author : Yan Nascimento
    * @date : 15/09/2021
    * @description : add a message erro BEFORE DELETE an object and do not allow the user to delete it
    * @log : 15/09/2021 : creation
*/

trigger erroMessageBeforeDelete on Account(before delete) {
    if (Trigger.isBefore) {
        if (Trigger.isDelete) {
            // In a before delete trigger, the trigger accesses the records that will be deleted with the Trigger.old list.
            for (Account a : Trigger.old) {
                if (a.name != 'okToDelete') {
                    a.addError('You can\'t delete this record!');
                } 
            }
        } 
    }   
}