public class Leadpage2 {
public String name{ get ; set;}
List<Lead> records;
List<Lead> templi;
public String msg {get; set; }
public transient String errorMessage { get; set; }
String s { get; set; } 
    public List<Lead> getrecords(){
      return records;
      }
      public Leadpage2(){
       records = new List<Lead>();
    }
    public PageReference search() {
      s = '%' + name + '%';
       if(name.length()==0){
          errorMessage = 'Please enter a Lead Name';
         }
      records  =[select Name,Email,Company from Lead  where name like:s OR Email like:s OR Company like:s ];
       if(records !=null && records.size() ==0){
           errorMessage = 'LEAD NOT fOUND !';
         }
     return null;
   }
}