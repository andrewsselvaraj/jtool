<%@ page import="java.io.File"%>
<%@ page import="javax.xml.parsers.*"%> 
<%@ page import="java.util.ResourceBundle"%> 


<%@ page import= "javax.xml.parsers.DocumentBuilder"%> 
<%@ page import= "javax.xml.parsers.DocumentBuilderFactory"%> 

<%@ page import= "org.w3c.dom.Document"%> 
<%@ page import= "org.w3c.dom.Element"%> 
<%@ page import= "org.w3c.dom.Node"%> 
<%@ page import= "org.w3c.dom.NodeList"%> 
<%@ page import= "org.xml.sax.SAXException"%> 
<%@ page import= "org.xml.sax.SAXParseException"%> 

<%

try {


DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
//Document doc = docBuilder.parse (new File("D:\\\\ejb\\codegen\\book.xml"));

File f = new File("dbxm.xml");

out.println("ABS PATH "+f.getDirectory());
out.println("ABS PATH "+f.getAbsolutePath());


//File f = new File(name); 
 f.getCanonicalPath(); 


Document doc = docBuilder.parse (new File("dbxm.xml"));


// normalize text representation
doc.getDocumentElement ().normalize ();
out.println ("Root element of the doc is " + doc.getDocumentElement().getNodeName());


NodeList listOfPersons = doc.getElementsByTagName("TABLE");
int totalPersons = listOfPersons.getLength();
out.println("Total no of people : " + totalPersons);

for(int s=0; s<listOfPersons.getLength() ; s++){


Node firstPersonNode = listOfPersons.item(s);
if(firstPersonNode.getNodeType() == Node.ELEMENT_NODE){


Element firstPersonElement = (Element)firstPersonNode; 

//-------
NodeList firstNameList = firstPersonElement.getElementsByTagName("fieldname");
Element firstNameElement = (Element)firstNameList.item(0);

NodeList textFNList = firstNameElement.getChildNodes();
out.println("First Name : " + ((Node)textFNList.item(0)).getNodeValue().trim());

//------- 
NodeList lastNameList = firstPersonElement.getElementsByTagName("fieldtype");
Element lastNameElement = (Element)lastNameList.item(0);

NodeList textLNList = lastNameElement.getChildNodes();
out.println("Last Name : " + ((Node)textLNList.item(0)).getNodeValue().trim());

//----
NodeList ageList = firstPersonElement.getElementsByTagName("fieldsize");
Element ageElement = (Element)ageList.item(0);



//------


}//end of if clause


}//end of for loop with s var


}catch (SAXParseException err) {
out.println ("** Parsing error" + ", line " + err.getLineNumber () + ", uri " + err.getcon.close();Id ());
out.println(" " + err.getMessage ());

}catch (SAXException e) {
Exception x = e.getException ();
((x == null) ? e : x).printStackTrace ();

}catch (Throwable t) {
t.printStackTrace ();
}
//exit (0);



%>

