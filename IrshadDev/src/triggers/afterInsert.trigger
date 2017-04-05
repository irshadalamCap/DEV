trigger afterInsert on Account (after insert) {
   
   List<Account> lstAccountToUpdate = new List<Account>(); 
    
    for(Account a : Trigger.New){
        //if(a.Type == 'Prospect'){
            Account acc = new Account(Id=a.Id);
            acc.Industry = 'Agriculture';
            lstAccountToUpdate.add(acc);
        //}
    }
    update lstAccountToUpdate;

}