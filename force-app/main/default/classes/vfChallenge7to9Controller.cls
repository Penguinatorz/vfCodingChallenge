public with sharing class vfChallenge7to9Controller {
    public list<account> acclist {set;get;}  
    public list<Contact> conlist {set;get;}  
    public string nameOfAcc {set;get;}
    public string nameOfCon {set;get;}
    public Account acc;

    
    public vfChallenge7to9Controller(ApexPages.StandardController sc) {
        if (sc != NULL) {
            this.acc = (Account)sc.getRecord();
        }
    }
    public vfChallenge7to9Controller(ApexPages.StandardSetController sc) {
        if (sc != NULL) {
            this.acc = (Account)sc.getRecord();
        }
    }

    public void searchAcc(){
        String searchAccoount = '%' + nameOfAcc + '%';
        acclist = [SELECT Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Name LIKE :searchAccoount];      
    }
    
    public void searchCon(){
        String searchContact = '%' + nameOfCon + '%';
        conlist = [SELECT Name, Account.Name FROM Contact WHERE Account.Name LIKE :searchContact];      
    }
}