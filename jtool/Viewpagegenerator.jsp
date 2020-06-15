<%@ page import="java.sql.*" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<html>
<style type="text/css">
<!--
.style4 {color: #000000}
.style5 {color: #CC00CC}
-->
</style>
<body >
<table width="100%"  border="2" cellpadding="10" cellspacing="10" bordercolor="#000000">
  <tr >
    <th colspan="2" scope="col"><span class="style4">Struts Tool Sample </span></th>
  </tr>
  <tr>
  <td width=20%><table>
	<tr><td class="style5"><a href="aboutproject.jsp">About Project</a></td></tr>
  	<tr><td class="style5"><a href="connectiondatabase.jsp">Project Configuration </a></td></tr>
	<tr><td class="style5"><a href="ProjectEntry.jsp">Project Details Entry  </a></td></tr>
	<tr><td class="style5"><a href="UseCaseEntry.jsp">UseCase Details Entry  </a></td></tr>
	<tr><td class="style5"><a href="ClassEntry.jsp">Class Detail Entry </a></td></tr>
	<tr><td class="style5"><a href="MethodEntry.jsp">Method Details Entry  </a></td></tr>
	<tr><td class="style5"><a href="code.jsp">Code generation</a> </td></tr>
	<tr><td class="style5"><a href="displayalltable.jsp ">Page Generation </a></td></tr><tr><td class="style5"><a href="daocreation.jsp ">DAO creation </a></td></tr>	<tr><td class="style5"><a href="vogenerate.jsp">VO generation</a> </td></tr>
	<tr><td class="style5"><a href="integeration.jsp ">Integeration & Deployment</a></td></tr>
	</table>
	</td>
	<td bgcolor="#FFFFFF">
	<%@ page import="java.sql.*"%> 

<% 
			String Driver=(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");

        String[] parameters = request.getParameterValues("field"); 
        String datatype = null;

        String html = ""; 

	out.println("asd"+parameters );
html = html +"<%@ taglib uri=\"/WEB-INF/struts-html.tld\" prefix=\"html\">\n";

html = html +"<%@ taglib uri=\"/WEB-INF/struts-bean.tld\" prefix=\"bean\">\n";

html = html +"<%@ taglib uri=\"/WEB-INF/struts-logic.tld\" prefix=\"logic\">\n";


html = html+"<logic:iterate id=\"object\" name=\"SessionVarible\">\n";

for(int i=0;i<parameters.length;i++)
{
html = html+"<bean:write name=user property="+parameters[i]+">\n";
}
html = html+"</logic:iterate>";
/*

	out.println("asd"+parameters.length  );

	  Jakarta Struts Live
</tr>
<logic:iterate id="user" name="users">
<tr>
<td>
<bean:write name="user"
Using Logic Tags to Iterate over Users 40
property="firstName"/>
</td>
<td>
<bean:write name="user"
property="lastName"/>
</td>
<td>
<bean:write name="user"
property="email"/>
</td>
</tr>
</logic:iterate>

*/

        out.println("<textarea name=commant rows='25' cols='70'  >"+html+""); 
out.println("</textarea>");




        
%> 












	
	</td>
  </tr>
    <tr >
     <th colspan="2" scope="col"> con.close();</th>
  </tr>
</table>

</body>

</html>

