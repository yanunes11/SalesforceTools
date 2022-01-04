trigger ContactTgr on Contact (after update) {
    if (Trigger.isAfter) {
        ContactTgrHnd.sendEmail(Trigger.newMap, Trigger.oldMap);
    }
}