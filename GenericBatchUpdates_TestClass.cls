@isTest
private class GenericBatchUpdates_TestClass {

static testmethod void testBatchUpdates() {

// Creating Test Accounts to Update
    List<Account> accList = new List<Account>();
    for (Integer i=0;i<199;i++) {
        Account m = new Account(Name = 'PIN-GOLD-' + i, Gold_Account__c= true);
        accList.add(m);
    }
    for (Integer i=0;i<199;i++) {
        Account m = new Account(Name = 'PIN-SILVER-' + i, Silver_Account__c= true);
        accList.add(m);
    }
    for (Integer i=0;i<199;i++) {
        Account m = new Account(Name = 'PIN-BRONZE' + i, Bronze_Account__c = true);
        accList.add(m);
    }
    insert accList;

    Test.startTest();
        GenericBatchUpdates AccUpd = new GenericBatchUpdates('test','Gold');
        Database.executeBatch(AccUpd);
    
        GenericBatchUpdates AccUpd1 = new GenericBatchUpdates('test','Silver');
        Database.executeBatch(AccUpd1);
    
        GenericBatchUpdates AccUpd2 = new GenericBatchUpdates('test','Bronze');
        Database.executeBatch(AccUpd2);
    Test.stopTest(); 


    // Verify accounts updated
    Account[] accUpdatedList = [SELECT Id,Enterprise_Account_Status__c,Name FROM Account where Gold_Account__c = true];
    System.assert(accUpdatedList[0].Enterprise_Account_Status__c.Contains('Gold'));
    Account[] accUpdatedList1 = [SELECT Id,Enterprise_Account_Status__c,Name FROM Account where Silver_Account__c = true];
    System.assert(accUpdatedList1[0].Enterprise_Account_Status__c.Contains('Silver'));
    Account[] accUpdatedList2 = [SELECT Id,Enterprise_Account_Status__c, Name FROM Account where Bronze_Account__c = true];
    System.assert(accUpdatedList2[0].Enterprise_Account_Status__c.Contains('Bronze'));


}
}