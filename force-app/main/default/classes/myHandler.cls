/**
    @author : Yan Nascimento
    @date : 20/12/2021
    @description : retrieve email information to create a task
    @log : 20/12/2021 : creation
 */
global class myHandler implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();

        Contact ct = [
            SELECT Id, Name, Email
            FROM Contact
            WHERE Email =: email.fromAddress
            LIMIT 1
        ];
        Task tk = new Task();
        tk.Description = email.plainTextBody;
        tk.Priority = 'Normal';
        tk.Status = 'Inbound Email';
        tk.Subject = email.subject;
        tk.IsReminderSet = true;
        tk.ReminderDateTime = System.now()+1;
        tk.WhoId = ct.Id;

        insert tk;  

        result.success = true;
        return result;
    }
}