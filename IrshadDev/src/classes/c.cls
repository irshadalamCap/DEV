public class c{

    public string XML{get;set;}
    public c(){
        DomExample();
    }
    public void DomExample()
{
    Dom.Document doc = new Dom.Document();
    
    Dom.Xmlnode rootNode = doc.createRootElement('response', null, null);

    list<Account> accountList = [ 
        select  id, name, 
                (select id, name, email from Contacts) 
          from  Account 
    ];
          
    for (Account eachAccount : accountList) {
        Dom.Xmlnode accountNode = rootNode.addChildElement('Project', null, null);
        //accountNode.setAttribute('id', eachAccount.Id);
        //accountNode.setAttribute('name', eachAccount.Name);
        
        for (Contact eachContact : eachAccount.Contacts) {
            Dom.Xmlnode contactNode = accountNode.addChildElement('Contact', null, null);
            contactNode.setAttribute('id', eachContact.Id);
            contactNode.setAttribute('name', eachContact.Name);
            //contactNode.setAttribute('email', eachContact.Email);
        }
    }
    XML = doc.toXmlString();
    system.debug(doc.toXmlString());            
}
}