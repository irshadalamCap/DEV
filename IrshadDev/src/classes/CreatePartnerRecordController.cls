public  class  CreatePartnerRecordController{
     private Id PartnerId;
     public Partner__c partnerObj {get;set;}
     public String phone {get;set;}
     public Attachment attachment {
      get {
      if (attachment == null)
        attachment = new Attachment();
          return attachment;
        }
      set;
      }
      
      public Boolean ErrorMsg{get;set;}
     public CreatePartnerRecordController(ApexPages.StandardController controller){
         ErrorMsg = False;
        PartnerId = ApexPages.currentPage().getParameters().get('id');
        this.partnerObj = (Partner__c)Controller.getRecord();
        partnerObj.clear();
     }

        
    public pageReference createPartner(){
      try {
        partner__c pObj = new Partner__c();
        pObj.phone__c = partnerObj.Phone__c;
        pObj.email__c = partnerObj.Email__c;
        pObj.Contact_Name__c = partnerObj.Contact_Name__c ;
        pObj.Company_Name__c= partnerObj.Company_Name__c;
        insert pObj;
        
        //attachment.OwnerId = UserInfo.getUserId();
        attachment.ParentId = pObj.Id;
        attachment.IsPrivate = true;
       
          insert attachment;
          ErrorMsg = True;
        }catch (DMLException e) {
          ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
          return null;
        } finally {
          attachment = new Attachment(); 
        }
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
        
        return null;
    }
    

}