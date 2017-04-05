global with sharing class AccountGMap {

    public String accountName { get; set; }
    public static Account account { get; set; }
    public AccountGMap() { } // empty constructor
    
    @RemoteAction
    global static Account getAccount() {
        account = [SELECT Id, Name, Billinglatitude, billingLongitude, BillingCity, BillingCountry
                   FROM Account where Billinglatitude != null];
        return account;
    }
}