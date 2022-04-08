/**
    * @author: Yan Nascimento
    * @description: exception tool
    * @log: 07/04/2022 - creation
 */

public with sharing class ExceptionExample {
    //when is not Account or Contact, show a notification
    public static void notMappedField(SObject obj) {
        Switch on obj {
            when Account a {
                //Account acct = (Account) a;
                System.debug('a.Name: '+a.Name);
            }
            when Contact c {
                //Contact ct = (Contact) c;
                System.debug('c.FirstName + c.LastName: '+c.FirstName+' '+c.LastName);
            }
            when else {
                throw new MyException('Impossible to identify the register name because the Object was not mapped');
            }
        }
    }
}