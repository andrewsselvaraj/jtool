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
  <td width=20%>
	<table>
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
	 <%!
	Connection con=null;  
	Statement st=null;
	String usecases, projectname, input, output, dbfunctionname, tablename, functionname,daoname,classname;
%>
<%
			
			String Driver=(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");
		
		
			try
			{
			

			Class.forName(Driver);
		 	con= DriverManager.getConnection(Database,username,password);
			st = con.createStatement();
			projectname= request.getParameter("projectname");
			usecases= request.getParameter("usecases");
			input= request.getParameter("input");
			output= request.getParameter("output");
			dbfunctionname= request.getParameter("dbfunctionname");
			classname=request.getParameter("classname");
			functionname = request.getParameter("functionname ");
			tablename= request.getParameter("tablename");
			daoname= request.getParameter("daoname");
			classname= request.getParameter("classname");
			ResultSet rs=st.executeQuery("select * from  dblist");
			out.println("<table><tr><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>");
			while(rs.next())
			{
			out.println("<form action=datareterival1.jsp>");

			out.println("<tr><td><input type=text name=PROJECTNAME value="+rs.getString("PROJECTNAME")+"></td>");
			out.println("<td><input type=text name=USECASES value="+rs.getString("USECASES")+"></td>");
			out.println("<td><input type=text name=FUNCTIONNAME value="+rs.getString("FUNCTIONNAME")+"></td>");
			out.println("<td><input type=text name=INPUT value="+rs.getString("INPUT")+"></td>");
			out.println("<td><input type=text name=OUTPUT value="+rs.getString("OUTPUT")+"></td>");
			out.println("<td><input type=text name=DBFUNCTIONNAME value="+rs.getString("DBFUNCTIONNAME")+"></td>");
			out.println("<td><input type=text name=TABLENAME value="+rs.getString("TABLENAME")+"></td>");
			out.println("<td><input type=text name=DAONAME value="+rs.getString("DAONAME")+"></td>");
			out.println("<td><input type=submit></td></tr>");

			out.println("</form>");
				
			}
									out.println("</table>");
			
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		%></td>
  </tr>
    <tr >
     <th colspan="2" scope="col"> con.close();</th>
  </tr>
</table>

</body>

</html>