Public Class caseExtensionGanttChartControllerV1_1{
    
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
   
    
    public caseExtensionGanttChartControllerV1_1(ApexPages.StandardController stdCon){
        
        StartDate = new List<Date>();
        ListOfweeks = new List<Date>();
        allMapCases = new Map<Id,Case>();
        prjlstWr = new List<ProjectWrapper>();
        CaseProjectsData = new List<sObjectWrapper>();
        tskGc = new List<TaskGanttChart>();
        endDates = new List<Date>();
        
        
        
        
        CaseId = ApexPages.currentPage().getParameters().get('id');
        parentCase = [select Id,parentId, caseNumber, Expected_Closing_Date__c, Expected_Start_Date__c, Owner.Name from case where Id =:CaseId];
        allMapCases.put(parentCase[0].Id ,parentCase[0]);
        
        ChildCase = new Map<Id,Case>([select Id,parentId, CaseNumber, Expected_Closing_Date__c, Expected_Start_Date__c, Owner.Name from Case where parentId =: parentCase[0].Id]); 
        for(Case c: childCase.values()){
            allMapCases.put(c.Id,c);
        }
        
        TasksLstRelToCase = [select Owner.Name,whatId,Expected_Start_Date__c,Expected_End_Date__c, Subject from Task where whatId=: allMapCases.keySet()];
        SYSTEM.DEBUG('@@TaskListRelToCase =='+TasksLstRelToCase );
        
        //Adding Cases and Task into ProjectWrapper in parent child Tree view
            for(Case c: allMapCases.Values()){
                List<Task> childTask = new List<Task>();
                if(c.parentId == null){
                    childTask = [select Owner.Name,Expected_Start_Date__c,Expected_End_Date__c , whatId, Subject from Task where whatId=: c.Id];
                    // Creating data for TaskGanttChart                    
                    
                    for(Task t: childTask){
                        TaskGanttChart tg = new TaskGanttChart();
                        tg.tsk = t;
                        tgc.add(tg);
                    }   
                        
                    prjlstWr.add(new ProjectWrapper(c,childTask, tgc));
                }
                else if(c.parentId != null){
                    childTask = [select Owner.Name,whatId,Expected_Start_Date__c,Expected_End_Date__c, Subject from Task where whatId=: c.Id];
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
                           startDate.add(p.prjCase.Expected_Start_Date__c);
                           endDates.add(p.prjCase.Expected_Closing_Date__c);
                           for(Task t: p.CaseTasks){
                               startDate.add(t.Expected_Start_Date__c);
                               endDates.add(t.Expected_End_Date__c);
                           }    
                       
                       }
                      startDate.sort();
                      endDates.sort();
                      Integer nuOfEndDates = endDates.size();
                      earliestStartDate = startDate[0].toStartofWeek(); 
                      latestEndDate = endDates[nuOfEndDates-1].toStartofWeek(); 
                      
                      // Number Of Weeks Between the two Dates...
                         numOfWeeks = earliestStartDate.daysBetween(latestEndDate)/7+1;
                       
                       // list of Weeks... 
                       weekStart = earliestStartDate;
                       ListOfweeks.add(weekStart);
                       for(integer i=0; i< numOfWeeks; i++){
                           weekStart =+ weekStart.addDays(7);
                           ListOfweeks.add(weekStart.toStartofWeek());
                       } 
                       
                      system.debug('@@latestEndDate =='+latestEndDate );
                      system.debug('@@earliestStartDate=='+earliestStartDate); 
                      system.debug('@@numOfWeeks =='+numOfWeeks);
                      system.debug('@@ListOfweeks =='+ListOfweeks);
       /**-----------------------------------------------------------
        *         Calulating EarliestStartDate and LatestEndDate... Ended
        **/ 
        
          
        
        
        
        // creating CaseProjectData.....
        
        
        for(projectWrapper p: prjlstWr){
           system.debug('@Casetask=='+p.CaseTasks);        
           sObjectWrapper prj = new sObjectWrapper();           
           prj.prjWr = p;
           
           system.debug('prj.prjWr =='+prj.prjWr);
           /*
           List<TaskGanttChart> tskGc = new List<TaskGanttChart>();
           for(Task t: p.CaseTasks){
               TaskGanttChart tGc = new TaskGanttChart();
               tGc.tsk = t;
            }
           for(TaskGanttChart t: tskGc){    
               prj.TaskGc.iniTaskWeeks = ((earliestStartDate).daysBetween(t.tsk.Expected_Start_Date__c))/7;
               prj.TaskGc.colorTaskWeeks = ((t.tsk.Expected_Start_Date__c.toStartofWeek()).daysBetween(t.tsk.Expected_End_Date__c.toStartofWeek()))/7+1 ;
               prj.TaskGc.finTaskWeeks = numOfWeeks - (prj.TaskGc.iniTaskWeeks + prj.TaskGc.colorTaskWeeks ) +1;
               
           }*/
           //system.debug('@@prj.TaskGc.iniTaskWeeks=='+prj.TaskGc.iniTaskWeeks);
           
           
           //prj.TaskGc = p.CaseTasks;
           // Gantt Chart creation for Cases..
               prj.initialWeeks = ((earliestStartDate).daysBetween(p.prjCase.Expected_Start_Date__c))/7; 
               prj.coloringWeeks = ((p.prjCase.Expected_Start_Date__c.toStartofWeek()).daysBetween(p.prjCase.Expected_Closing_Date__c.toStartofWeek()))/7+1;
               prj.remWeeks = numOfWeeks - (prj.initialWeeks + prj.coloringWeeks) +1;
               
               system.debug('@@prj.initialWeeks=='+prj.initialWeeks);
               
           // Gantt Chart Creation for Tasks related to cases....
              
              for(Task prjTsk: p.CaseTasks){
                  prj.iniTaskWeeks = ((earliestStartDate).daysBetween(prjTsk.Expected_Start_Date__c))/7;
                  prj.colorTaskWeeks = ((prjTsk.Expected_Start_Date__c.toStartofWeek()).daysBetween(prjTsk.Expected_End_Date__c.toStartofWeek()))/7 +1;
                  prj.finTaskWeeks = numOfWeeks - (prj.iniTaskWeeks + prj.colorTaskWeeks ) +1;
                  
                  system.debug('@@prjTsk.Subject=='+prjTsk.Subject+'@@prj.iniTaskWeeks =='+prj.iniTaskWeeks);
              }
              
              
              
               
                         
           CaseProjectsData.add(prj); 
        }
        
        system.debug('@@CaseProjectsData=='+CaseProjectsData);
        
      
        
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
        //public TaskGanttChart TaskGc {get;set;}//Take List       
        public integer coloringWeeks{get;set;}
        public integer initialWeeks {get;set;}
        public integer remWeeks {get;set;}
        public Integer iniTaskWeeks {get;set;}
        public Integer colorTaskWeeks {get;set;}
        public Integer finTaskWeeks {get;set;}        
        
        
        public sObjectWrapper(){
        
        }
    
    }
    // storing data for tree structure...
    public class ProjectWrapper{
        Public Case prjCase {get;set;}
        public List<Task> CaseTasks {get;set;}
        public List<TaskGanttChart> TaskGcLst {get;set;}
        
        
        //public ProjectWrapper(Case c, List<Task> t){
        public ProjectWrapper(Case c, List<Task> t, List<TaskGanttChart> tGc){
           prjCase = c;
           CaseTasks = t;
           TaskGcLst = tGc;
            
        }
    
    }
}