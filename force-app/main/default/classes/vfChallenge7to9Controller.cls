public with sharing class vfChallenge7to9Controller {
    public list<account> acclist {set;get;}  
    public list<Contact> conlist {set;get;}  
    public string nameOfAcc {set;get;}
    public string nameOfCon {set;get;}
    public Account acc {get;set;}

    
    public vfChallenge7to9Controller(ApexPages.StandardController sc) {

    }
    public vfChallenge7to9Controller(ApexPages.StandardSetController sc) {

    }
    public PageReference expertSearchAcc2(){
        if (String.isEmpty(nameOfAcc)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.Error, 'No Account with that Name'));
            return null;
        }
        else {
            try {
                String sanitizedQuery = String.escapeSingleQuotes(nameOfAcc);
                this.acc = [SELECT Id, Name FROM Account WHERE Name = :sanitizedQuery LIMIT 1];
            } catch (Exception ex) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.Error, 'No Account with that Name'));
                return null;
            }
            acclist = [SELECT Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id =: acc.Id LIMIT 1];
            transient PageReference pageRef = new Pagereference('/apex/vfChallenge13');
            pageRef.setRedirect(false);
            pageRef.getParameters().put('id', acc.Id);
            return pageRef;
        }
    }
}