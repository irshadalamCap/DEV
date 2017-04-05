public class AccountTreeComponentController {
    
    public AccountTreeComponentController.TreeModel pac;
    public List<TreeModel> treeLst {get;set;}
    
     public ID accountParamID {get;set;}   
    
    public AccountTreeComponentController (ApexPages.StandardController controller) {    
         accountParamID = ApexPages.currentPage().getParameters().get('Id');
         system.debug('accountParamId on Page Load'+ accountParamID);    
         treeLst = new List<TreeModel>();
         string selectstring ;
          List<Account> accountDetail = new List<Account>();
          accountDetail = [select Id,UltimateParentId__c from Account where ID =: accountParamID limit 1];
          if(accountDetail[0].Id!=null){
              selectstring = 'select Id,ParentId, name,Owner.Name,BillingCity,BillingCountry,BillingState,UltimateParentId__c from Account where ID =\'' +accountDetail[0].UltimateParentId__c+  '\' or UltimateParentId__c =\'' +accountDetail[0].UltimateParentId__c+  '\'';  
          }
          else
         {
             system.debug('Inside Ultimate null');
             selectstring = 'select Id,ParentId, name,Owner.Name,BillingCity,BillingCountry,BillingState,UltimateParentId__c from Account where ID =\'' +accountParamID+  '\' or UltimateParentId__c =\'' + String.valueOf(accountParamID).substring(0,15)+  '\'';            
         }
    }

    
  
    
  public class TreeModel {
          
        public Account accDetails {get;set;}
        public boolean isFile {get;set;}
        public string ultimateParentId {get;set;}
        public String BillingState{get;set;}
        public String BillingCity{get;set;}
        public String BillingCountry{get;set;}
       
        public List<TreeModel> children {get;set;}
           public TreeModel(){
            children  = new List<TreeModel>();
            isFile = true;
        }
     
        public TreeModel(String BillingAccState, String BillingAccCity, String BillingAccCountry, Account acctDetails){ 
            accDetails = acctDetails;
            BillingState = BillingAccState;
            BillingCity = BillingAccCity;
            BillingCountry = BillingAccCountry;     
            
         }   
        
     
    
    }
}