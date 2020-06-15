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
    <th colspan="2" scope="col"><span class="style4">Struts Tool Sample </span></th>
  </tr>
  <tr>
  <td width=20%>
	<table >
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
	<table align="center" BORDER=1>

<%
			String Driver=(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");
		String CLASS_ID,METHOD_ID,METHOD_NAME,METHOD_INPUT,METHOD_OUTPUT,METHOD_OPERATION,METHOD_TABLE;
		try
			{
			Class.forName(Driver);
			con=DriverManager.getConnection(Database, username,password);
			st=con.createStatement();

			ResultSet rs = st.executeQuery("select * from methodinfo ");
			
			while(rs.next())
			{
				 out.println("<form action=coderetrive2.jsp>");

									//t.println("<tr>");
				CLASS_ID=rs.getString("CLASS_ID");
				METHOD_ID=rs.getString("METHOD_ID");
				METHOD_NAME=rs.getString("METHOD_NAME");
				METHOD_INPUT=rs.getString("METHOD_INPUT");
				METHOD_OUTPUT=rs.getString("METHOD_OUTPUT");
				METHOD_OPERATION=rs.getString("METHOD_OPERATION");
				METHOD_TABLE=rs.getString("METHOD_TABLE");

				out.println("<td><input type=text name=CLASS_ID1 value="+CLASS_ID+"></td>");
				out.println("<td><input type=text name=METHOD_ID1 value="+METHOD_ID+"></td>");
				out.println("<td><input type=text name=METHOD_NAME1 value="+METHOD_NAME+"></td>");
				out.println("<td><input type=text name=METHOD_INPUT1 value="+METHOD_INPUT+"></td>");
				out.println("<td><input type=text name=METHOD_OUTPUT1 value="+METHOD_OUTPUT+"></td>");
				out.println("<td><input type=text name=METHOD_OPERATION1 value="+METHOD_OPERATION+"></td>");
				out.println("<td><input type=text name=METHOD_TABLE1 value="+METHOD_TABLE+"></td>");		
				
				//out.println("<td>"+rs.getString(i++)+"</td>");	
				//out.println("<td>"+rs.getString(i++)+"</td>");	
				//out.println("<td>"+rs.getString(i++)+"</td>");
				out.println("<td><input type=submit> </td>");	
				out.println("</tr>");	
				 out.println("</form>");
																	
			}
			
		
			
			}
			
			
			
		catch(Throwable e)
			{
			out.println("Excpeiotn"+e.getMessage());
			%>
		
			<script language=\"javascript\">alert("Error is");</script>
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

    </form>
	</table>
	</td>
  </tr>
    <tr >
     <th colspan="2" scope="col"> con.close();</th>
  </tr>
</table>

</body>

</html>
