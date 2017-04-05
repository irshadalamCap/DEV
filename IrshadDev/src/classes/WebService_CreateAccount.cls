/**The GLOBAL access modifier declares that the class is visible to all Apex scripts everywhere.
* This means the class can be used by any Apex code, not just the Apex in the same application
*
**/

global class WebService_CreateAccount{

    webservice String area;
    webservice String region;

    //Define an object in apex that is exposed in apex web service
    
    global class Plan {
    
    webservice String name;
    webservice Integer planNumber;
    webservice Date planningPeriod;
    webservice Id planId;
    
    }   
    
   //create and define an Apex method using both the STATIC and WEBSERVICE modifiers
    
    webservice static Plan createAccountPlan(Plan vPlan) {
    
    //A plan maps to the Account object in salesforce.com.
    //So need to map the Plan class object to Account standard object
        
    Account acct = new Account();
    acct.Name = vPlan.name;
    acct.AccountNumber = String.valueOf(vPlan.planNumber);
    insert acct;
    vPlan.planId=acct.Id;
    return vPlan;
        
    }




}