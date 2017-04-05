public class xmlgenerator{
   public String StringXML{get;set;}
    public String xmlgen(){
        Xmlstreamwriter xmlstrWrtr = new Xmlstreamwriter();
        xmlstrWrtr.writeStartDocument('utf-8','1.0');
        xmlstrWrtr.writeStartElement(null,'SERVICE', null);
        xmlstrWrtr.writeAttribute(null,null,'version','1.0');
        Contact con = [SELECT id,FirstName,LastName FROM Contact limit 1];
        
            xmlstrWrtr.writeStartElement(null,'PID',null);
                xmlstrWrtr.writeCharacters(con.id);
            xmlstrWrtr.writeEndElement(); //Close ID Element
            
            xmlstrWrtr.writeStartElement(null,'FirstName',null);            
                xmlstrWrtr.writeCharacters(con.FirstName);
            xmlstrWrtr.writeEndElement(); //Close FirstNameElement
            
            xmlstrWrtr.writeStartElement(null,'LastName ',null);
                xmlstrWrtr.writeCharacters(con.LastName );
            xmlstrWrtr.writeEndElement(); //Close LastName Element
            
           xmlstrWrtr.writeEndElement(); //Close SERVICE
           StringXML= xmlstrWrtr.getXmlString();
           System.debug('The XML :'+StringXML); 
        
        return null;    
    }
}