@RestResource(urlMapping='/Account/*')

//workbench URL for Post-->/services/apexrest/Account

//Post--> 
/**{
  "name" : "Wingo Ducks",
  "phone" : "707-555-1234",
  "website" : "www.wingo.ca.us"
}*/
global with sharing Class CreateAccountRestful{

    @HttpPost
    global static String doPost(String name,
        String phone, String website) {
        Account account = new Account();
        account.Name = name;
        account.phone = phone;
        account.website = website;
        insert account;
        return 'Account Created';
    }
//workbench URL for get method-->/services/apexrest/Account?id=0019000000xYuzx
    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = RestContext.request.params.get('id'); 
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return result;
    }
  

}