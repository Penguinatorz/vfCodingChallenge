@isTest
private class vfChallenge7to9ControllerTest {

    @TestSetup
    static void makeData(){
        List<Account> mockAccList = new List<Account>();
        List<Contact> mockConList = new List<Contact>();
        for (Integer i = 0; i < 20; i++) {
            Account acc = new Account();

            acc.Name = 'AccountTest ' + i;
            mockAccList.add(acc);
        }
        insert mockAccList;
        for (Account acc : [SELECT Id, Name FROM Account]) {
            Contact con = new Contact();
            con.LastName = 'Contact';
            con.AccountId = acc.Id;

            mockConList.add(con);
        }
        insert mockConList;

    }

    @isTest
    static void expertSearchAcc2Test(){

        ApexPages.StandardSetController sc;

        vfChallenge7to9Controller testCon = new vfChallenge7to9Controller(sc);
        PageReference results = testcon.expertSearchAcc2();
        
        System.assertEquals(null, results);
        
        testCon.nameOfAcc = 'AccountTest';
        PageReference results1 = testcon.expertSearchAcc2();
        
        System.assertEquals(null, results1);
        
        
        Account acc = [SELECT Id, Name FROM Account WHERE Name = 'AccountTest 1' LIMIT 1];      
        
        testCon.nameOfAcc = 'AccountTest 1';
        PageReference results2 = testcon.expertSearchAcc2();

        PageReference expected = new Pagereference('/apex/vfChallenge13');
        expected.getParameters().put('id', acc.Id);
        
        String urlResults = results2.getUrl();
        String urlExpected = expected.getUrl();
        
        System.assertEquals(urlExpected, urlResults);
    

    }
}