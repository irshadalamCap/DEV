Public Class caseExtensionGanttChartController{
    
    public Case cse;
    Map<Id, Case> IdMaptoCaseObj;
    List<Task> TasksLstRelToCase = New List<Task>();
    public Id CaseId;
    public Id ParentCaseId;
    public List<GanttChartData> GanttHirearchy;
    public List<Case> parentCase;
    public List<Case> ChildCase;
    List<Task> ts = new List<Task>();
    List<Case> caseTest = new List<Case>();
    public String XMLStr{get;set;}
    public caseExtensionGanttChartController(ApexPages.StandardController stdCon){
        GanttHirearchy = new List<GanttChartData>();
        ChildCase = new List<Case>();
        //this.parentCase = (Case)stdCon.getRecord();
        
        CaseId = ApexPages.currentPage().getParameters().get('id');
        parentCase = [select Id,parentId,OwnerId from case where Id =:CaseId];
        
        //ChildCase = [select Id, CaseNumber,(select Id from Tasks) from Case where parentId =: parentCase[0].Id];       

        SYSTEM.DEBUG('@@parentCase =='+parentCase.size());
        SYSTEM.DEBUG('@@ChildCase =='+ChildCase);        
        XmlOutput();
    
    }
    
    public void XmlOutput(){
    
        Xmlstreamwriter xmlstrWrtr = new Xmlstreamwriter();
        xmlstrWrtr.writeStartDocument('utf-8','1.0');
        xmlstrWrtr.writeStartElement(null,'Project', null);
        xmlstrWrtr.writeAttribute(null,null,'version','1.0');
            // Tasks Starts here...
            
            xmlstrWrtr.writeStartElement(null,'Task',null);
            
                xmlstrWrtr.writeStartElement(null,'PID',null);
                    xmlstrWrtr.writeCharacters(parentCase[0].id);
                xmlstrWrtr.writeEndElement(); 
                
                xmlstrWrtr.writeStartElement(null,'pStart',null);
                    //xmlstrWrtr.writeCharacters(parentCase[0].id);
                xmlstrWrtr.writeEndElement(); 
                
                xmlstrWrtr.writeStartElement(null,'pEnd',null);
                    //xmlstrWrtr.writeCharacters(parentCase[0].id);
                xmlstrWrtr.writeEndElement();
                
                xmlstrWrtr.writeStartElement(null,'pRes',null);
                    xmlstrWrtr.writeCharacters('Irshad Alam');
                xmlstrWrtr.writeEndElement();
                
                xmlstrWrtr.writeStartElement(null,'pParent',null);
                    //xmlstrWrtr.writeCharacters(parentCase[0].id);
                xmlstrWrtr.writeEndElement();
             
             
             
                
                
                
            xmlstrWrtr.writeEndElement();
        
        
        
        xmlstrWrtr.writeEndElement(); //Close SERVICE
        XMLStr = xmlstrWrtr.getXmlString();
        System.debug('The XML :'+XMLStr); 
        
        
        
        
        
        
        
        
        /*Dom.Document doc = new Dom.Document();    
        Dom.Xmlnode rootNode = doc.createRootElement('response', null, null);
        for(case c: caseTest){
            Dom.Xmlnode caseNode = rootNode.addChildElement('Project', null, null);
            //accountNode.setAttribute('id', eachAccount.Id);
            //accountNode.setAttribute('name', eachAccount.Name);
            
            for(Task t: ts){
                    Dom.Xmlnode taskNode = caseNode.addChildElement('Task', null, null);
            }
        }
        XMLStr = doc.toXmlString();*/
        
    }
    
    
    
    
    
    
    
    
    
    public class GanttChartData{
        public Case GrparentCase {get;set;}
        public List<Case> ParentCaseObj {get;set;}
        List<Task> TasksLstRelToCase = New List<Task>();
        
        public GanttChartData(Case gp, List<Case> p){
         GrparentCase = gp;
         ParentCaseObj = p;
            
        }
    
    }

}