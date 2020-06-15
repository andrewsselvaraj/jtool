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

%>	
<%
			String Driver=(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");

		try
			{
			Class.forName(Driver);
			con=DriverManager.getConnection(Database, username,password);
			st=con.createStatement();
			String class_id = request.getParameter("class_id");
			String classname = request.getParameter("classname");
			String method_name = request.getParameter("method_name");
			String method_input = request.getParameter("method_input");
			String method_output = request.getParameter("method_output");
			String method_operation = request.getParameter("method_operation");
			String method_table = request.getParameter("method_table");

			out.println("method_name"+method_name);



			String 	sql = "insert into METHODINFO  values (";
					sql = sql +"'"+class_id+"',";
					sql = sql +"METHOD_id_seq.nextval,";
					sql = sql +"'"+method_name+"',";
					sql = sql +"'"+method_table+"BO"+"',";
					sql = sql +"'"+method_output +"',";
					sql = sql +"'"+method_operation +"',";
					sql = sql +"'"+method_table+"')";					
			out.println("SQL Query :="+sql);
			int result=st.executeUpdate(sql);

			if(result>0)
				{
					out.println(class_id+" METHODINFO   Inserted Successfully");
				}

			String[] rowvalues = request.getParameterValues("fieldrowid");
				sql ="";
			for(int i=1;i<=rowvalues.length;i++)
			{
				String columnType = request.getParameter("datatype"+i);
				String columnname = request.getParameter("columnname"+i);

				out.println("sdfs????<BR>"+columnType);
				out.println("sdfasdasd  ??? <BR>"+columnname );
				sql = "insert into methodparamdetail values (";
				sql = sql +"METHOD_id_seq.currval,";
				sql = sql +"'"+columnType +"',";
				sql = sql +"'"+columnname +"')";

				out.println(sql);

				result=st.executeUpdate(sql);



			}
			
			}
		catch(Throwable e)
			{
			out.println("Error in classname data Not inserted");
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
</td>
  </tr>
    <tr >
     <th colspan="2" scope="col"> con.close();</th>
  </tr>
</table>

</body>

</html>