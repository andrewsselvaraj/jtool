<%@ page language="java"  %>
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
	<form method=get action="projectmapping.jsp">
	
<%!
	Connection con=null;
	Statement st=null;
	String  name, pass;
%>
<%
			String Driver=(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");

		
		
		try
		{
		Class.forName(Driver);
		con=DriverManager.getConnection("jdbc:odbc:name", "scott","tiger");
		st=con.createStatement();
		name= request.getParameter("name");
		pass= request.getParameter("pass");
		String sql="select * from login where name='"+name+"' and pass='"+pass+"'";
		ResultSet rs=st.executeQuery(sql);
		if (rs.next())
		{
		
		
		out.println("<h2><center>Welcome to CodeGen for STRUTS</center></h2>");
		%><center>
		<a href="projectmapping.jsp">Mainframe</a></center>	
		<%
		}
		else
		{
		 out.println("<h1><center><br><br><br><br><br><br>Invalid User</center></h1>");
		%>
		<center>
		<a href="login.jsp">Login</a></center>
		<%
		}
		con.close();
		st.close();
		}
		catch(Exception e)
		{
 		e.printStackTrace();
		}
	%>
	
	</form></td>
  </tr>
    <tr >
     <th colspan="2" scope="col"> con.close();</th>
  </tr>
</table>

</body>

</html>