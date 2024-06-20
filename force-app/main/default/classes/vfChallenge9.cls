public with sharing class vfChallenge9 {
    public list<account> acclist {set;get;}   
    public string nameOfAcc {set;get;}
    public Account acc;

    
    public vfChallenge9(ApexPages.StandardController sc) {
        if (sc != NULL) {
            this.acc = (Account)sc.getRecord();
        }
        searchAcc();
    }
    public vfChallenge9(ApexPages.StandardSetController sc) {
        if (sc != NULL) {
            this.acc = (Account)sc.getRecord();
        }
        searchAcc();
    }

    public void searchAcc(){
        acclist = [SELECT Name, (SELECT Id, Name FROM Contacts) FROM Account];      
    }
}