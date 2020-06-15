<%@ page import="java.io.*" %>
<%@ page import= "java.io.File" %>
<%@ page import= "org.w3c.dom.Document" %>
<%@ page import= "org.w3c.dom.*" %>


<%@ page import= "javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import= "javax.xml.parsers.DocumentBuilder" %>
<%@ page import= "org.xml.sax.SAXException" %>
<%@ page import= "org.xml.sax.SAXParseException" %> 
<%@ page import= "java.util.*" %> 

<%
HashMap hm = new HashMap();
hm.put("VARCHAR2","String");
hm.put("DECIMAL","float");



%>

<%

			String[] rowvalues = request.getParameterValues("fieldrowid");
			String voname = request.getParameter("voname");

			String start ="public  class ";
			out.println(start+" "+voname+"{<BR>");
			for(int i=0;i<rowvalues.length;i++)
			{
			
			String coltype = request.getParameter("datatype"+rowvalues[i]);
			String colname  = request.getParameter("columnname"+rowvalues[i]);
			//out.println("<BR>VALUES "+rowvalues[i]);
			out.println(" "+hm.get(coltype));
			out.println(" "+colname+";<BR>");
			}

			for(int i=0;i<rowvalues.length;i++)
			{
			
			String coltype = request.getParameter("datatype"+rowvalues[i]);
			String colname  = request.getParameter("columnname"+rowvalues[i]);

			out.println("<BR> public void ");
			out.println(" set"+colname+"("+hm.get(coltype)+" "+colname+"){<BR>this."+ colname+"="+colname+";<BR>}");

			out.println("<BR> public "+hm.get("VARCHAR2"));
			out.println(" get"+colname+"(){<BR>return "+colname+";<BR>}");
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
