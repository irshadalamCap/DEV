public class jqSlider_Con {
        private ApexPages.StandardController stdController;
        public String redirectUrl {public get; private set;}
        public Boolean shouldRedirect {public get; private set;}
            public Account account{get; set;}
      
        public Boolean refreshPage { get; set; }
        public String sSliderField { get; set; }
        public String amountSliderVal { get; set; }
        public String percentageSliderVal { get; set; }
        public String Field_Names { get; set; }
        public String min { get; set; }
        private String soql;
        private String[] fields1;
        private List<String> whereStrings;
        private String sobType;
        public string amountOncomponent{get;set;}
        public string quantity;
        
        
        public jqSlider_Con(){
        String recordID = ApexPages.currentPage().getParameters().get('id');
            
            account = [Select Id, Name, Phone, Site, Type, AccountNumber, Rating, Quantity__c, Percentage__c, Amount__c from Account where Id =: recordID];
             system.debug('@@@Fields - '+account.Amount__c );
          sSliderField = min;  
          refreshPage = false;
          shouldRedirect = false;
          
        }
        
        public PageReference doStuffAndRedirect() {
            
            shouldRedirect = true;
            redirectUrl = stdController.view().getUrl();
            return null;
        }
        
        public pageReference checkSliderVal(){
            
             upsert account;
             
             system.debug('Id==='+ApexPages.currentPage().getParameters().get('id'));
             pageReference accountRecord = new pageReference('/apex/AccountPage?id='+account.Id);
             return accountRecord;
             
        }
        
        
 }