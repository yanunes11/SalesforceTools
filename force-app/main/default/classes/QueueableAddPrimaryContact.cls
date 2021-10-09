<<<<<<< HEAD
/**
    @author : Yan Nascimento
    @date : 09/10/2021
    @description : assign contacts to related accounts using clone
    @log : 09/10/2021 : creation
 */
=======
>>>>>>> ece16f982b991b1370321290f9af551075dd5e13
public class QueueableAddPrimaryContact implements Queueable {
    private Contact contact;
    private String state;
    public QueueableAddPrimaryContact(Contact record, String sts) {
        this.contact = record;
        this.state = sts;
    }
    public void execute(QueueableContext context) {
        List<Account> accounts = [
            SELECT Id
            FROM Account
            WHERE BillingState =:state
            LIMIT 200
        ];
        List<Contact> contactList = new List<Contact>();
        for (Account acc : accounts) {
            if (String.isNotBlank(acc.Id)) {
                Contact clonedContact = contact.clone(false, false, false, false);
                clonedContact.AccountId = acc.Id;
                contactList.add(clonedContact);
            }
        }
        INSERT contactList;
    }
}
