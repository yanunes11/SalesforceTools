/**
    @author : Yan Nascimento
    @description : different ways to send email
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
            List<Id> idsToList = new List<Id>();
            idsToList.add(IdSing);
            Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
            mail.setTargetObjectIds(idsToList);
            mail.setSenderDisplayName('System Admin');
            mail.setTemplateId(et.id);
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
    }
}
