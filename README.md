# NaveenSF

Batch Class : GenericBatchUpdates
Test Class : GenericBatchUpdates_TestClass

Assumptions: 
1. Batch Class has been designed to update different types of the Account i.e. Considering the Gold, Silver and Bronze. 
2. As of now the batch class is designed for the Account object, it could have been made to run for different objects but needs some    
   clarifications. Having said that it can be customised further to accomodate different object as well. 
3. Account object needs to have the 3 fields i.e. Gold_Account__c,Silver_Account__c, Bronze_Account__c along with 
   Enterprise_Account_Status__c.


Here are the steps to call the Batch class to update the Account Records. 
_________________________________________________________________________

1. Go to Developer Console > Debug > Open Execute Anonymous Window.
2. Check the Open Log & Execute the below statements to run the batch class. 
    
              GenericBatchUpdates AccUpd = new GenericBatchUpdates('Gold');
              Database.executeBatch(AccUpd);
              
   Note: Change the parameter to the desired Account type i.e. Silver , Bronze etc and repeat the same steps. 
