trigger beforeUpdate on Account (before update) {
    
    set<Id> accIds = new Set<Id>();
    Account[] LstAcc= new List<Account>();
    for(Account a: Trigger.New){
        if(a.Active__c=='Yes'){
            accIds.add(a.Id);
        }        
    }    
    lstAcc = [select id,(select Id,StageName,name from Opportunities where StageName !='Closed Won') from Account where Id=: accIds];    
    for(Account acc : lstAcc){
       Account newAcc = trigger.newMap.get(acc.Id);
       if(!acc.Opportunities.isEmpty()){
          newAcc.addError('Cant be Activated');// can't be used here
       }
    }
    
}