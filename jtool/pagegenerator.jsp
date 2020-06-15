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


	out.println("asd"+parameters.length  );
	  for(int i=0; i<parameters.length; i++) 
      	  { 

	datatype = request.getParameter("datatype"+(i+1)); 
	out.println("lslsllslsl"+datatype+"--" );
                if("TextField".equalsIgnoreCase(datatype)) 
                {                        	
		html=html+"<html:text  property="+parameters[i]+" />\n";
                } 

	else if("multibox".equalsIgnoreCase(datatype)) 
                { 
                   html = html + "<select>\n&nbsp<option>&nbsp\n</option>\n</select>\n"; 
		html=html+"<html:multibox  property="+parameters[i]+" />\n";
                } 
                else if("textarea".equalsIgnoreCase(datatype)) 
                { 
                      
		html=html+"<html:textarea  property="+parameters[i]+" />\n";
                } 
                else if("radiobutton".equalsIgnoreCase(datatype)) 
                { 
              
	html=html+"<html:radio  property="+parameters[i]+" />\n";
                } 
                else if("submit".equalsIgnoreCase(datatype)) 
                { 
            
	html=html+"<html:submit  property="+parameters[i]+" />\n";
                } 
	else if("checkbox".equalsIgnoreCase(datatype)) 
                { 
                      
		html=html+"<html:checkbox  property="+parameters[i]+" />\n";
                } 
	
	}
       // html = html +"<html> ";

        out.println("<textarea name=commant rows='25' cols='70'  >"+html+""); 
out.println("</textarea>");




        
%> 









	
	</td>
  </tr>
    <tr >
     <th colspan="2" scope="col">Andrew con.close();</th>
  </tr>
</table>

</body>

</html>

