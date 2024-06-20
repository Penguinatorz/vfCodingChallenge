public with sharing class vfCodingChallenge1to5CustomController {

    public ID accId{get; set;}
    public String accountId{get; set;}
    public List<Account> accounts;

    public ApexPages.StandardSetController ssc {
        get{
            if(ssc == null)
            {
                ssc = new ApexPages.StandardSetController([SELECT Name, AnnualRevenue,
                Industry FROM Account ORDER BY Id DESC LIMIT 1]);
                }
                return ssc;
            }
        set;
    }

    public String lang{get{
        return [select LanguageLocaleKey from User where Id=:UserInfo.getUserId()].LanguageLocaleKey;
    }
    set;}
    
    public void greetAccount(){
        String accName = [SELECT Name FROM Account WHERE Id =:accountId LIMIT 1].Name;
        ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.INFO, accName));
    }

/*    public PageReference createPDF(){
        PageReference accountPage = Page.vfCodingChallenge1to5;
        Blob pagePDF = accountPage.getContentAsPDF();
        return ;
    }*/

    public List<Account> getAccounts(){
        return (List<Account>) ssc.getRecords();
    }
    public void previous() {
        this.ssc.previous();
    }
    
    public void next() {
        this.ssc.next();
    }
    
    public void save() {
        update this.ssc.getRecords(); 
    }
}