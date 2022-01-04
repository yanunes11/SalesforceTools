/**
    @author : Yan Nascimento
    @description : different ways of sending email
    @log : 02/01/2022 : creation
 */

public with sharing class SendEmail {
    @future
    public static void massEmailing(List<Id> ids) {
        //ATTENTION: you need to create an email template on Setup/Classic Email Templates/New Template
        EmailTemplate et = [
            SELECT Id
            FROM EmailTemplate
            WHERE name = 'EmailTemplateName'
            LIMIT 1
        ];
        List<Messaging.MassEmailMessage> mails = new List<Messaging.MassEmailMessage>();
        for (Id IdSing : ids) {
            Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
            mail.setTargetObjectIds(ids);
            mail.setSenderDisplayName('System Admin');
            mail.setTemplateId(et.id);
            mails.add(mail);
        }
    }
}
