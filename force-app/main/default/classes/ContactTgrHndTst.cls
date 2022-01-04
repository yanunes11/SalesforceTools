@isTest
public with sharing class ContactTgrHndTst {
    @TestSetup
    static void setup(){
        Contact ct = new Contact();
        ct.FirstName = 'Yan';
        ct.LastName = 'Nascimento';
        ct.Email = 'yannascimento@gmail.com';
        insert ct;
    }
    public ContactTgrHndTst() {
        Contact ct = [
            SELECT Id, Email
            FROM Contact
            WHERE Email = 'yannascimento@gmail.com'
        ];
        System.assertEquals('yannascimento@gmail.com', ct.Email);
        ct.Email = 'yannunes112@gmail.com';
        update ct;
    }
}
