trigger AccountTgr on Account (before insert, after insert,before update, after update) {

    if (Trigger.isUpdate) {
        if (Trigger.isBefore) {
        }
        if (Trigger.isAfter) {
        }
    }   
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
        }
        if (Trigger.isAfter) {
        }
    }
}