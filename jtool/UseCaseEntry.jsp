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
	ResultSet rs = null;

%>

<form action="UsecaseProcess.jsp">
<%
	String Driver=	(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");

	try
	{
	Class.forName(Driver);
			con=DriverManager.getConnection(Database, username,password);
	st=con.createStatement();
	rs = st.executeQuery("select * from projectMaster");			

%>
	<table>
	<tr>
	<td>
	Project Name
	</td>
	<td>
	<select name=project_id>
	<%
	while(rs.next())
	{
	String project_id = rs.getString("project_id");
	String project_name = rs.getString("project_name");
	%>
	<option value="<%=project_id%>">  <%=project_name%> </option>";
	<%
	}
	}//try 	
	catch(Throwable e)
			{
			out.println("Error in Project Master Registration data Not inserted");
			%>
		
			<html><script language=\"javascript\">alert("Error is");</script></html>
			<%

			}
			
			finally
		{
			try
			{
				if ( st != null )
				{
					st.close();
				}
				
				if ( con != null )
				{
					con.close();
				}
			}
			catch (SQLException e1)
			{
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	%>
	</select>

	</td>
	</tr>
	<tr>
	<td>
	UseCase Name
	</td>
	<td>
	<input type=text name="usecasename" >
	</td>
	</tr>
	
	<tr>
	<td>
	<input type=submit>
	</td>
	<td>
	<input type=reset>
	</td>
	</tr>
	</table>

</form>
</td>
  </tr>
    <tr >
     <th colspan="2" scope="col"> con.close();</th>
  </tr>
</table>

</body>

</html>