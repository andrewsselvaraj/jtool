<%@ page language="java" %>
<%@ page import="java.sql.*"%>
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
	<form method="get" action="xmldeveloper.jsp">
	
<%!
	Connection con=null;
	Statement st=null;

%>	
<%
			String Driver=	(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");
		
		
			try
			{

			Class.forName(Driver);
		 	con= DriverManager.getConnection(Database,username,password);
			st = con.createStatement();
			
			
			ResultSet rs=st.executeQuery("select tname from tab");
			
			%>
			<center >
			<select name="tablename">
			
			<%
			while(rs.next())
			{
			String val=""+rs.getString(1);
			%>
			<option value=<%=val%>>
			
			<%
			
			out.println(val);
			%>
			
			</option>
				
			<%
			}
			%>
			</center>
			</select>
			<%
			ResultSet rs1=st.executeQuery("select tname from tab");
			
			%>
			
			<select name="tablename2">
			
			<%
			while(rs1.next())
			{
			String val2=""+rs1.getString(1);
			%>
			<option value=<%=val2%>>
			
			<%
			
			out.println("CG-"+val2+"-DO");
			%>
			
			</option>
				
			<%
			}
			%>
			
			</select>
			<%		
			st.close();		
			con.close();
			}
				catch(Exception e)
				{
				e.printStackTrace();
				}
		
%><br><br>

<input type="submit" value="submit">
</form></td>
  </tr>
    <tr >
     <th colspan="2" scope="col"> con.close();</th>
  </tr>
</table>

</body>

</html>