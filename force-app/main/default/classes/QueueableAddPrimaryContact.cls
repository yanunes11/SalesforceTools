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
