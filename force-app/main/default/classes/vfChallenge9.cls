public with sharing class vfChallenge9 {
    public list<account> acclist {set;get;}   
    public string nameOfAcc {set;get;}

    public ApexPages.StandardSetController ssc{
        get{
            if(ssc == null){
                ssc = new ApexPages.StandardSetController([SELECT Name, (SELECT Id, Name FROM Contacts) FROM Account]);
            }
            return ssc;
        }
        set;
    }
    
    public vfChallenge9(ApexPages.StandardController sc) {
        populateTable();
    }
    public vfChallenge9(ApexPages.StandardSetController sc) {
        populateTable();
    }

    public void populateTable(){
        acclist = [SELECT Name, (SELECT Id, Name FROM Contacts) FROM Account];      
    }

    public void searchAcc(){
        String searchAccoount = '%' + nameOfAcc + '%';
        acclist = [SELECT Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Name LIKE :searchAccoount];      
    }

    public PageReference filterAcc(){
        String searchAccoount = '%' + nameOfAcc + '%';
        acclist = [SELECT Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Name LIKE :searchAccoount];      
        return Page.vfCodingChallenge9.setRedirect(false);
    }

    public void saveRecord(){

        update this.ssc.getRecords(); 
    }
}