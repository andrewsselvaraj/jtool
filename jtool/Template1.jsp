<%@ page import="java.sql.*" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%!
	Connection con=null;
	Statement st=null;

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
    <th colspan="2" scope="col"><span class="style4">Codegen - for Struts</span></th>
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

	out.println("asd"+parameters.length  );
  for(int i=0; i<parameters.length; i++) 
        { 

	datatype = request.getParameter("datatype"+(i+1)); 
	out.println("???????????????"+datatype+"--" );
                if("TextField".equalsIgnoreCase(datatype)) 
                { 
		
                        	html = html + "<input type=text name="+datatype+">"; 
                } 

	else if("ComboBox".equalsIgnoreCase(datatype)) 
                { 
                        html = html + "<select><option></option></select>"; 
                } 
                else if("Textarea".equalsIgnoreCase(datatype)) 
                { 
                        html = html + "<input type=textarea name="+datatype+"> "; 
                } 
                else if("radiobutton".equalsIgnoreCase(datatype)) 
                { 
                html = html + "<input type=radio name="+datatype+">";  
                } 
                else if("date".equalsIgnoreCase(datatype)) 
                { 
                html = html + "<input type=date name="+datatype+">";  
                } 

        } 
        html = html +"<html> ";

        out.println(html); 





        
%> 









	
	</td>
  </tr>
    <tr >
     <th colspan="2" scope="col">LinuXport System</th>
  </tr>
</table>

</body>

</html>