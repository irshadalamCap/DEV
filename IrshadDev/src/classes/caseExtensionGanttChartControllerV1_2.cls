Public Class caseExtensionGanttChartControllerV1_2{
    
    public Case cse;
    Map<Id, Case> IdMaptoCaseObj;
    List<Task> TasksLstRelToCase = New List<Task>();
    public Id CaseId;
    public Id ParentCaseId;
    
    public List<Case> parentCase {get;set;}
    public Map<ID,Case> ChildCase;
    List<TaskGanttChart> tgc = new List<TaskGanttChart>();
    List<Task> ts = new List<Task>();
    List<Case> caseTest = new List<Case>();    
    public List<sObjectWrapper> CaseProjectsData {get;set;}
    public Integer numOfWeeks {get;set;}
    
    public Date earliestStartDate {get;set;}
    public Date latestEndDate {get;set;}
    public Date weekStart{get;set;}
    public Date weekEndDate{get;set;}
    public List<Date> ListOfweeks{get;set;}
    public List<Date> StartDate{get;set;}
    public List<Date> endDates {get;set;}
    public Integer numbOfWeeks {get;set;}
    public Boolean taskOcc {get;set;}
    public Map<Id,Case> allMapCases {get;set;}
    public List<ProjectWrapper> prjlstWr {get;set;}
    public List<TaskGanttChart> tskGc {get;set;}
    
    public caseExtensionGanttChartControllerV1_2(ApexPages.StandardController stdCon){
        
        StartDate = new List<Date>();
        ListOfweeks = new List<Date>();
        allMapCases = new Map<Id,Case>();
        prjlstWr = new List<ProjectWrapper>();
        CaseProjectsData = new List<sObjectWrapper>();
        tskGc = new List<TaskGanttChart>();
        endDates = new List<Date>();
        
        
        
        
        CaseId = ApexPages.currentPage().getParameters().get('id');
        parentCase = [select Id,parentId, caseNumber, Expected_Closing_Date__c,effort__c, Expected_Start_Date__c, Owner.Name from case where Id =:CaseId];
        allMapCases.put(parentCase[0].Id ,parentCase[0]);
        
        ChildCase = new Map<Id,Case>([select Id,parentId, CaseNumber,Effort__c, Expected_Closing_Date__c, Expected_Start_Date__c, Owner.Name from Case where parentId =: parentCase[0].Id]); 
        for(Case c: childCase.values()){
            allMapCases.put(c.Id,c);
        }
        
        TasksLstRelToCase = [select Owner.Name,whatId,Expected_Start_Date__c,Expected_End_Date__c, Subject from Task where whatId=: allMapCases.keySet()];
        SYSTEM.DEBUG('@@TaskListRelToCase =='+TasksLstRelToCase );
        
        //Adding Cases and Task into ProjectWrapper in parent child Tree view
            for(Case c: allMapCases.Values()){
                List<Task> childTask = new List<Task>();
                if(c.parentId == null){
                    childTask = [select Owner.Name,Expected_Start_Date__c,Expected_End_Date__c,Final_weeks__c ,initial_weeks__c ,effort__c, whatId, Subject from Task where whatId=: c.Id];
                    // Creating data for TaskGanttChart                    
                    
                    for(Task t: childTask){
                        TaskGanttChart tg = new TaskGanttChart();
                        tg.tsk = t;
                        tgc.add(tg);
                    }   
                        
                    prjlstWr.add(new ProjectWrapper(c,childTask, tgc));
                }
                else if(c.parentId != null){
                    childTask = [select Owner.Name,whatId,Expected_Start_Date__c,effort__c,Final_weeks__c ,initial_weeks__c,Expected_End_Date__c, Subject from Task where whatId=: c.Id];
                    for(Task t: childTask){
                        TaskGanttChart tg = new TaskGanttChart();
                        tg.tsk = t;
                        tgc.add(tg);
                    }
                    prjlstWr.add(new ProjectWrapper(c,childTask, tgc));
                }
                
           }
        system.debug('@@prjlstWr=='+prjlstWr);
        
        /**-----------------------------------------------------------
        *         Calulating EarliestStartDate, LatestEndDate and ListOfweeks ...STARTED
        **/
                       for(projectWrapper p: prjlstWr){
                           if(p.prjCase.Expected_Start_Date__c != null || p.prjCase.Expected_Closing_Date__c != null){
                               startDate.add(p.prjCase.Expected_Start_Date__c);
                               endDates.add(p.prjCase.Expected_Closing_Date__c);
                           }
                           
                           for(Task t: p.CaseTasks){
                               if(t.Expected_Start_Date__c != null || t.Expected_End_Date__c != null){
                                   startDate.add(t.Expected_Start_Date__c);
                                   endDates.add(t.Expected_End_Date__c);
                               }
                               
                           }    
                       
                       }
                      startDate.sort();
                      endDates.sort();
                      Integer nuOfEndDates = endDates.size();
                      Date firstWeekOfStartDate;
                      for(integer d=0; d< startDate.size(); d++){
                          if(startDate[d] != null){
                             firstWeekOfStartDate = startDate[d]; 
                             break;
                          }
                      }
                      //Date firstWeekOfStartDate = startDate[0];
                      
                      //earliestStartDate = firstWeekOfStartDate.addDays(-7).toStartofWeek(); 
                      earliestStartDate = firstWeekOfStartDate.toStartofWeek(); 
                      //latestEndDate = endDates[nuOfEndDates-1].addDays(7).toStartofWeek();
                      latestEndDate = endDates[nuOfEndDates-1].toStartofWeek(); 
                      
                      // Number Of Weeks Between the two Dates...
                         numOfWeeks = earliestStartDate.daysBetween(latestEndDate)/7;
                       
                       
                       // list of Weeks... 
                       weekStart = earliestStartDate;
                       ListOfweeks.add(weekStart);
                       for(integer i=1; i< numOfWeeks; i++){
                           weekStart =+ weekStart.addDays(7);
                           ListOfweeks.add(weekStart.toStartofWeek());
                       } 
                       ListOfweeks.add(latestEndDate);
                       
                      system.debug('@@latestEndDate =='+latestEndDate );
                      system.debug('@@earliestStartDate=='+earliestStartDate); 
                      system.debug('@@numOfWeeks =='+numOfWeeks);
                      system.debug('@@ListOfweeks =='+ListOfweeks.size());
       /**-----------------------------------------------------------
        *         Calulating EarliestStartDate and LatestEndDate... Ended
        **/ 
        
          
        
        
        
        // creating CaseProjectData.....
        
        
        for(projectWrapper p: prjlstWr){
           system.debug('@Casetask=='+p.CaseTasks);        
           sObjectWrapper prj = new sObjectWrapper();           
           prj.prjWr = p;
           system.debug('Size of P=='+p);                   
           
         
           // Gantt Chart creation for Cases..
         
                 
                 if(p.prjCase.Expected_Start_Date__c == null || p.prjCase.Expected_Closing_Date__c == null){
                   prj.initialWeeks = 0; 
                   prj.coloringWeeks = 0; 
                   prj.remWeeks = 0;
                   prj.prjWr.prjCase.Effort__C =  0;
                 } 
                 else{
                     prj.initialWeeks = ((ListOfweeks[0]).daysBetween(p.prjCase.Expected_Start_Date__c))/7;
                     prj.coloringWeeks = ((p.prjCase.Expected_Start_Date__c.toStartofWeek()).daysBetween(p.prjCase.Expected_Closing_Date__c.toStartofWeek()))/7+1;
                     prj.remWeeks = ListOfweeks.size() - (prj.initialWeeks + prj.coloringWeeks);
                     
                     prj.prjWr.prjCase.Effort__C =  p.prjCase.Expected_Start_Date__c.daysBetween(p.prjCase.Expected_Closing_Date__c);
                     
                 }                 
                   
                 
                 
               
           // Gantt Chart Creation for Tasks related to cases....
              
              for(Task prjTsk: p.CaseTasks){
                  if(prjTsk.Expected_Start_Date__c == null || prjTsk.Expected_End_Date__c == null){
                  
                      prjTsk.initial_Weeks__c = 0;
                      p.colorTaskWeeks = 0;
                      prjTsk.Effort__C = p.colorTaskWeeks;
                      prjTsk.Final_weeks__c = 0;
                  }
                  else{
                      prjTsk.initial_Weeks__c = ((ListOfweeks[0]).daysBetween(prjTsk.Expected_Start_Date__c))/7;                                    
                      p.colorTaskWeeks = ((prjTsk.Expected_Start_Date__c.toStartofWeek()).daysBetween(prjTsk.Expected_End_Date__c.toStartofWeek()))/7+1;
                      prjTsk.Effort__C = p.colorTaskWeeks;
                      prjTsk.Final_weeks__c = ListOfweeks.size() - (prjTsk.initial_Weeks__c + prjTsk.Effort__C); 
                  }
                  
              }
              
              
            
              
               
                         
           CaseProjectsData.add(prj); 
        }
        
        system.debug('@@CaseProjectsData=='+CaseProjectsData);
        
      
        
    }
    
    public class color{
        public Integer iColor{get;set;}
        public Integer mColor{get;set;}
        public Integer fColor{get;set;}
        
        public color(){
        }
    }
    
    public class TaskGanttChart{
        public Task tsk {get;set;}
        public Integer iniTaskWeeks {get;set;}
        public Integer colorTaskWeeks {get;set;}
        public Integer finTaskWeeks {get;set;}
        
        public TaskGanttChart(){
            
        }
    
    }
    
   // Main data for Table View...
    public class sObjectWrapper{
    
        //public Case Project{get;set;}
        public ProjectWrapper prjWr {get;set;} 
        //public List<color> lstColor{get;set;}
        public color Colors{get;set;}
        public TaskGanttChart TaskGc {get;set;}//Take List       
        public integer coloringWeeks{get;set;}
        public integer initialWeeks {get;set;}
        public integer remWeeks {get;set;}
        public Integer iniTaskWeeks {get;set;}
        public Integer colorTaskWeeks {get;set;}
        public Integer finTaskWeeks {get;set;}
        public Integer CaseEffort {get;set;}
        public Integer totalEffort {get;set;}        
        
        
        public sObjectWrapper(){
        
        }
    
    }
    // storing data for tree structure...
    public class ProjectWrapper{
        Public Case prjCase {get;set;}
        public List<Task> CaseTasks {get;set;}
        public List<TaskGanttChart> TaskGcLst {get;set;}
        public Integer iniTaskWeeks {get;set;}
        public Integer colorTaskWeeks {get;set;}
        public Integer finTaskWeeks {get;set;}
        
        
        //public ProjectWrapper(Case c, List<Task> t){
        public ProjectWrapper(Case c, List<Task> t, List<TaskGanttChart> tGc){
           prjCase = c;
           CaseTasks = t;
           TaskGcLst = tGc;
            
        }
    
    }
}