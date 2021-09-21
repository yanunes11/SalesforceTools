/*
    * @author : Yan Nascimento
    * @date : 15/09/2021
    * @description : example with BEFORE INSERT. It allows to create a new account only if these fields have the specific values
    * @log : 15/09/2021 : creation
*/

trigger useBeforeInsert on Account( before insert) {
    if (Trigger.isInsert) {
        for (Account a : Trigger.new) {
            System.assertEquals('MyTutorialRack', a.Name); 
            System.assertEquals('12345678', a.AccountNumber);
            System.assertEquals(100, a.numberofemployees);
            System.assertEquals(200, a.annualrevenue);
        }
    }
}