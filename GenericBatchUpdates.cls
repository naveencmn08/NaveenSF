/* Added by Naveenkumar as part of the Pinterest Interview Code test
       Name : Naveenkumar
       Date : 03/17/2020
       Comments: Added as part of the intervew code test  */
       
global class GenericBatchUpdates implements Database.Batchable<sObject>, Database.Stateful {

    private String QueryParam;
    Private String QueryCategory;
    Private String FinalQuery;
    Private String AccStatus;

    /*Constructor of GenericBatchUpdates Batch Class */
    public GenericBatchUpdates(String QryParam, String Category) {
        QueryParam = QryParam;
        QueryCategory = Category;        
    }

    global Database.QueryLocator start(Database.BatchableContext BC) {

        String query = 'select id,Enterprise_Account_Status__c, Gold_Account__c from Account where Enterprise_Account_Status__c = null ';
        
        if(QueryCategory == 'Gold') {        
            FinalQuery = query + ' and Gold_Account__c = '+ 'true;';
            AccStatus = 'Gold';  // Has to be taken from Actual Picklist values
        }
        else if (QueryCategory == 'Silver'){
            FinalQuery = Query + ' and Silver_Account__c =' + 'true;';
            AccStatus = 'Silver'; // Has to be taken from Actual Picklist values
        }
        else {
            FinalQuery = Query + ' and bronze_Account__c =' + 'true;';
            AccStatus = 'Bronze'; // Has to be taken from Actual Picklist values
            }
      
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Account> Accscope) {
        system.debug('==========check string====='+ FinalQuery);  
            
        List<Account> Accupd = new List<Account>();
        
        for( Account Accs: Accscope){
            Accs.Enterprise_Account_Status__c = AccStatus;
            Accupd.add(Accs);
        }
        
        try {
            // Update the Account Record
            update Accupd;
        
        } catch(Exception e) {
            System.debug(e);
        }  
    }   

    global void finish(Database.BatchableContext BC) {
    
    System.debug('===Account Update Complete====');
    }
}