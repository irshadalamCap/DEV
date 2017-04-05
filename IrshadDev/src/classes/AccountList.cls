public class AccountList {
public list<Account> objAccounts {get;set;}
public string selectedvalue{get;set;}

public List<SelectOption> getAccount(){
    List<SelectOption> options = new List<SelectOption>();
     objAccounts = new list<Account>();  
            objAccounts=[SELECT Name,BillingStreet,BillingCity,BillingPostalCode,
                                BillingCountry FROM Account 
                                Where BillingCountry <> null limit 20];
    selectedvalue = objAccounts[0].Id;
     for(Account a: objAccounts){
         options.add(new SelectOption(a.Id,a.Name));
     }
       
     return options;
                         
}

    public AccountList(){
        try{
            objAccounts = new list<Account>();  
            objAccounts.addAll([SELECT Name,BillingStreet,BillingCity,BillingPostalCode,
                                BillingCountry FROM Account 
                                Where BillingCountry <> null limit 20]);
        }catch(Exception ex){
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error:'
                                                        +ex.getMessage()));
        }
    }
}