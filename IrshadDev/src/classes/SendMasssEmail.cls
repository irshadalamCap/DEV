global class SendMasssEmail {
    
   //public List<Id> contactids; 
   //public List<CampaignMember> campMem;
   /*public SendMasssEmail(ApexPages.StandardController controller){
     Id campaignObjId = ApexPages.currentPage().getParameters().get('Id');
     contactids = new List<Id>();
     //Retriving campMem from campaign..     
         campMem = [select Id,ContactId from CampaignMember where campaignId =: campaignObjId];
         system.debug('campMem =='+campMem);
         if(campMem.size() > 0 && campMem != null){
             for(CampaignMember cMemb : campMem){
                 contactids.add(cMemb.ContactId);
             }
         }
         system.debug('contactids=='+contactids);         
   
   }*/
   
   webservice static void SendEmail(String Id){
       List<Id> contactids = new List<Id>();       
       List<CampaignMember> campMem = new List<CampaignMember>();
       system.debug('Id=='+Id);
       campMem= [select Id,ContactId from CampaignMember where campaignId =: Id];
       
       if(campMem.size() > 0 && campMem != null){
             for(CampaignMember cMemb : campMem){
                 contactids.add(cMemb.ContactId);
             }
         }
        system.debug('contactids=='+contactids);  
       Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
       mail.setTargetObjectIds(contactids);
       mail.setTemplateId('00X90000001Fz2V');
       Messaging.sendEmail(new Messaging.MassEmailMessage[] { mail });
       
       
       List<Messaging.SendEmailResult> results = Messaging.sendEmail(new Messaging.Email[] { mail });
        if (!results.get(0).isSuccess()) {
            System.StatusCode statusCode = results.get(0).getErrors()[0].getStatusCode();
            system.debug('statusCode =='+statusCode );
            String errorMessage = results.get(0).getErrors()[0].getMessage();
        }   
    }
}