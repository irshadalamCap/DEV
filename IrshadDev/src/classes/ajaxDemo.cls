public class ajaxDemo {
    
    private string CurrTime;
    //return the values of currentTime
    public string getCurrTime(){
        return CurrTime;    
    }
    
    //set the value in CurrentTime field
    public void setCurrTime(){
          CurrTime=system.now().format(); 
    
    }
    
}