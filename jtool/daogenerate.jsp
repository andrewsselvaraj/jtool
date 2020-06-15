<%@ page import="java.io.*" %>
<%@ page import= "java.io.File" %>
<%@ page import= "org.w3c.dom.Document" %>
<%@ page import= "org.w3c.dom.*" %>


<%@ page import= "javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import= "javax.xml.parsers.DocumentBuilder" %>
<%@ page import= "org.xml.sax.SAXException" %>
<%@ page import= "org.xml.sax.SAXParseException" %> 

<%

			String[] rowvalues = request.getParameterValues("fieldrowid");
		
			for(int i=1;i<=rowvalues.length;i++)
			{
				String columnType = request.getParameter("datatype"+i);
				String columnname = request.getParameter("columnname"+i);
				out.println("sdfs????<BR>"+columnType);
				out.println("sdfasdasd  ??? <BR>"+columnname );
			}

try {


DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
Document doc = docBuilder.parse (new File("esi.xml"));

// normalize text representation
doc.getDocumentElement ().normalize ();
System.out.println ("Root element of the doc is " + doc.getDocumentElement().getNodeName());


NodeList listOfPersons = doc.getElementsByTagName("dao");
int totalPersons = listOfPersons.getLength();
System.out.println("Total no of people : " + totalPersons);

for(int s=0; s<listOfPersons.getLength() ; s++){


Node firstPersonNode = listOfPersons.item(s);
if(firstPersonNode.getNodeType() == Node.ELEMENT_NODE){


Element firstPersonElement = (Element)firstPersonNode; 

//-------
NodeList firstNameList = firstPersonElement.getElementsByTagName("name");
Element firstNameElement = (Element)firstNameList.item(0);

NodeList textFNList = firstNameElement.getChildNodes();
System.out.println("First Name : " + ((Node)textFNList.item(0)).getNodeValue().trim());

//------- 
NodeList lastNameList = firstPersonElement.getElementsByTagName("tablename");
Element lastNameElement = (Element)lastNameList.item(0);

NodeList textLNList = lastNameElement.getChildNodes();
System.out.println("tablename : " + ((Node)textLNList.item(0)).getNodeValue().trim());

//----
NodeList ageList = firstPersonElement.getElementsByTagName("voname");
Element ageElement = (Element)ageList.item(0);

NodeList textAgeList = ageElement.getChildNodes();
System.out.println("Age : " + ((Node)textAgeList.item(0)).getNodeValue().trim());

//------


}//end of if clause


}//end of for loop with s var


}catch (SAXParseException err) {
System.out.println ("** Parsing error" + ", line " + err.getLineNumber () + ", uri " + err.getSystemId ());
System.out.println(" " + err.getMessage ());

}catch (SAXException e) {
Exception x = e.getException ();
((x == null) ? e : x).printStackTrace ();

}catch (Throwable t) {
t.printStackTrace ();
}
//System.exit (0);

%>
