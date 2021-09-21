/**
    @author : Yan Nascimento
    @date : 21/09/2021
    @description : create a samples
    @log : 21/09/2021 : creation
 */
public class creatingRecords {
    public static void creatingNewLeads(Integer numberOfLeads) {
        List<Lead> addLead = new List<Lead>();

        for (Integer i = 0; i < numberOfLeads; i++) {
            Lead newLead = new Lead();
            if (i < 10) {
                newLead.FirstName = 'Test';
                newLead.LastName = '' + (i + 1);
                newLead.Company = (i + 1) + 'Test ';
                newLead.Status = 'Open - Not Contacted';
                newLead.Email = 'test' +(i + 1)+ '@gmail.com';
                newLead.Phone = '554199195678' + i;
            } else if (i >= 10 && i <100) {
                newLead.FirstName = 'Test';
                newLead.LastName = '' + (i + 1);
                newLead.Company = (i + 1) + 'Test ';
                newLead.Status = 'Open - Not Contacted';
                newLead.Email = 'test' +(i + 1)+ '@gmail.com';
                newLead.Phone = '55419919567' + i;
            } else if (i >= 100 && i <1000) {
                newLead.FirstName = 'Test';
                newLead.LastName = '' + (i + 1);
                newLead.Company = (i + 1) + 'Test ';
                newLead.Status = 'Open - Not Contacted';
                newLead.Email = 'test' +(i + 1)+ '@gmail.com';
                newLead.Phone = '5541991956' + i;
            } else {
                system.debug('Out of range - [0 < number Of Leads < 1000]');
            }
            addLead.add(newlead);                    
        }
        if (addLead.size() > 0) {
            INSERT addLead;
            system.debug('It Worked inserting ' +addLead.size()+ ' Leads');
        }
    }
    public static void creatingAccounts(Integer numberOfAccounts) {
        List<Account> addAccount = new List<Account>();
        for (Integer i = 0; i < numberOfAccounts; i++) {
            Account newAccount = new Account();
            if (i < 10) {
                newAccount.Name = 'Test' + (i + 1);
                newAccount.Phone = '554199195678' + i;
            } else if (i >= 10 && i < 100) {
                newAccount.Name = 'Test' + (i + 1);
                newAccount.Phone = '55419919567' + i;
            } else if (i >= 100 && i < 1000) {
                newAccount.Name = 'Test' + (i + 1);
                newAccount.Phone = '55419919567' + i;
            } else {
                system.debug('Out of range - [0 < number of accounts < 1000]');
            }
            addAccount.add(newAccount);
        }
        if (addAccount.size() > 0) {
            INSERT addAccount;
            system.debug('It Worked to insert ' +addAccount.size()+ ' Leads');
        }
    }
    public static void creatingContacts(Integer numberOfContacts) {
        List<Contact> addContact = new List<Contact>();
        for (Integer i = 0; i < numberOfContacts; i++) {
            Contact contacts = new Contact();
            if (i < 10) {
                contacts.FirstName = 'Test' + (i + 1);
                contacts.LastName = '' + (i + 1);
                contacts.Email = 'test' +(i + 1)+ '@gmail.com';
                contacts.Phone = '554199195678' + i;
            } else if (i >= 10 && i < 100) {
                contacts.FirstName = 'Test' + (i + 1);
                contacts.LastName = '' + (i + 1);
                contacts.Email = 'test' +(i + 1)+ '@gmail.com';
                contacts.Phone = '55419919567' + i;
            } else if (i >= 100 && i < 999) {
                contacts.FirstName = 'Test' + (i + 1);
                contacts.LastName = '' + (i + 1);
                contacts.Email = 'test' +(i + 1)+ '@gmail.com';
                contacts.Phone = '5541991956' + i;
            } else {
                system.debug('Out of range - [0 < number of Contacts < 1000]');
            }
        }
        if (addContact.size() > 0) {
            INSERT addContact;
            system.debug('It Worked to insert ' +addContact.size()+ ' Leads');
        } 
    }
    public static void creatingRelatedAccountContact(Integer numberOfRecords) {
        creatingRecords.creatingAccounts(numberOfRecords);
        Account[] acctID = [
            SELECT Id 
            FROM Account 
        ];
        List<Contact> addContact = new List<Contact>();

        for (Integer i = 0; i < numberOfRecords; i++) {
            Contact contacts = new Contact();
            if (i < 10) {
                contacts.AccountId = acctID[i].Id;
                contacts.FirstName = 'Test';
                contacts.LastName = '' + (i + 1);
                contacts.Email = 'test' +(i + 1)+ '@gmail.com';
                contacts.Phone = '554199195678' + i;
            } else if (i >= 10 && i < 100) {
                contacts.AccountId = acctID[i].Id;
                contacts.FirstName = 'Test';
                contacts.LastName = '' + (i + 1);
                contacts.Email = 'test' +(i + 1)+ '@gmail.com';
                contacts.Phone = '55419919567' + i;
            } else if (i >= 100 && i < 1000) {
                contacts.AccountId = acctID[i].Id;
                contacts.FirstName = 'Test';
                contacts.LastName = '' + (i + 1);
                contacts.Email = 'test' +(i + 1)+ '@gmail.com';
                contacts.Phone = '5541991956' + i;
            } else {
                system.debug('Out of range - [0 < number Of Leads < 1000]');
            }
        }
        if (addContact.size() > 0) {
            INSERT addContact;
            system.debug('It Worked to insert ' +addContact.size()+ ' Leads');
        }
    }
}