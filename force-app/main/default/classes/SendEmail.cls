/**
    @author : Yan Nascimento
    @description : different ways of sending email
    @log : 02/01/2022 : creation
 */

public with sharing class SendEmail {
    @future
    public static void massEmailing(List<Id> ids) {
        //
        Contact lstcon = [
                SELECT Id
                FROM Contact
                WHERE Id = :ids[0]
            ];
            List<Id> lstids= new List<Id>();
            lstids.add(lstcon.Id);
            //ATTENTION: you need to create an email template on Setup/Classic Email Templates/New Template
            EmailTemplate et = [
                SELECT Id
                FROM EmailTemplate
                WHERE name = 'EmailTemplateName'
                LIMIT 1
            ];
            Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
            mail.setTargetObjectIds(lstIds);
            mail.setSenderDisplayName('System Admin');
            mail.setTemplateId(et.id);
            Messaging.sendEmail(new Messaging.MassEmailMessage[] { mail });
    }
}
