//Commented--//
public without sharing class AccountController {
    public Account account{get; set;}
    public string amountOnPage{get;set;}
    public string quantity{get;set;}
    public AccountController(){
        String recordID = ApexPages.currentPage().getParameters().get('id');
        account = [Select Id, Name, Phone, Site, Type, AccountNumber, Rating, Quantity__c, Percentage__c, Amount__c from Account where Id =: recordID];
    }
    
    public void save(){
        //amount 
        upsert account;
    }
    
}