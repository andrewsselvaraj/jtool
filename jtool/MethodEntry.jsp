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
		Connection con1=null;
	Statement st1=null;
	ResultSet rs = null;

%>
<html>
	<script language="javascript">
	function projectChange()
	{
		var project_id =document.classEntryFrm.project_id.options(document.classEntryFrm.project_id.selectedIndex).value
		
		document.classEntryFrm.project_id.value = project_id;
		document.classEntryFrm.action = "MethodEntry.jsp";
		document.classEntryFrm.method = "get";
		document.classEntryFrm.submit();
	}
	function useCaseChange()
	{
		
		var project_id =document.classEntryFrm.project_id.options(document.classEntryFrm.project_id.selectedIndex).value;
		var usecase_id =document.classEntryFrm.project_id.options(document.classEntryFrm.usecase_id.selectedIndex).value;
		

		document.classEntryFrm.project_id.value = project_id;
		document.classEntryFrm.usecase_id .value = usecase_id;
		document.classEntryFrm.action = "MethodEntry.jsp";
		document.classEntryFrm.method = "get";
		document.classEntryFrm.submit();
	}
	</script>
<body>



<form action="MethodProcess.jsp" name="classEntryFrm">

<%
			String Driver=(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");

			String Driver1=(String)application.getAttribute("Driver1");
			String username1 =(String)application.getAttribute("username1");
			String password1 = (String)application.getAttribute("password1");
			String Database1= (String)application.getAttribute("Database1");

	Class.forName(Driver);
	con=DriverManager.getConnection(Database, username,password);
	st=con.createStatement();
	
	con1=DriverManager.getConnection(Database1, username1,password1);
	st1=con1.createStatement();
%>
<%
	String req_project_id = request.getParameter("project_id");
	String req_project_name = request.getParameter("project_name");
	String req_usecase_id = request.getParameter("usecase_id");
	String req_tablename = request.getParameter("method_table");
%>
	<table>
	<tr>
	<td>
	Project Name
	</td>
	<td>
	<select  name="project_id" onChange="projectChange()">
	<%
	rs = st.executeQuery("select * from projectMaster");	
	while(rs.next())
	{

	String 	project_id  = rs.getString("project_id");
		String 	project_name  = rs.getString("project_name");

		if(req_project_id!=null && req_project_id.equalsIgnoreCase(project_id))
		{
		%>
			<option value="<%=project_id%>" selected>  <%=project_name%> </option>";
		<%
		}
		else	
		{
		%>
		<option value="<%=project_id%>">  <%=project_name%> </option>";
		<%
		}
	}//while
	%>
	</select>

	</td>
	</tr>
	
	<tr>
	<td>
	UseCase Name
	</td>
	
	<td>
	<select name=usecase_id onChange="projectChange()">
	<%


		rs = st.executeQuery("select * from usecaseMaster where project_id = '"+req_project_id+"'");	
		while(rs.next())
		{
		String usecase_id = rs.getString("usecase_id");
		String usecase_name = rs.getString("usecase_name");
			if(req_usecase_id!=null && req_usecase_id.equalsIgnoreCase(usecase_id))
			{
						out.println("<option value="+usecase_id+" selected>"+  usecase_name+" </option>");
			}
			else
			{
out.println("<option value="+usecase_id+" >"+  usecase_name+" </option>");
			}
		}
	
	%>
	</select>

	</td>
	</tr>
	
	
		<tr>
	<td>
	Class Name
	</td>
	
	<td>
	<select name=class_id>
	<option value=""> Select ClassName</option>";

	<%

	if(req_usecase_id != null)
	{
		rs = st1.executeQuery("select * from classMaster where usecase_id = '"+req_usecase_id+"'");	
		while(rs.next())
		{
		String class_id = rs.getString("class_id");
		String class_name = rs.getString("class_name");
		%>
		<option value="<%=class_id%>">  <%=class_name%> </option>";
		<%
		}
	}
	
	%>
	</select>

	</td>
	</tr>
	
	
	<tr>
	<td>
	Method Name
	</td>
	<td>
	<input type=text name="method_name" >
	</td>
	</tr>
	
	<tr>
	<td>
	Table Name 
	</td>
	<td>
	<select name="method_table" onChange="projectChange()">
	<%
		rs = st1.executeQuery("select * from tab");
		
		while(rs.next())
		{
			String tablename = rs.getString("TNAME");		
			if(req_tablename!=null && req_tablename.equalsIgnoreCase(tablename))
			{
				out.println("<option value="+tablename+" selected>"+  tablename+" </option>");
			}
			else
			{
				out.println("<option value="+tablename+" >"+ tablename+" </option>");
			}
		}		
	%>
	</select>
	</td>
	</tr>
	
	<tr>
	<td>
	Input 
	</td>
	<td>
	<%
	if(req_tablename!=null)
	{
		rs = st1.executeQuery("Select * from "+req_tablename);
		ResultSetMetaData rsm =rs.getMetaData();
		int totcol= rsm.getColumnCount();
		int j=1;
		while(j<=totcol)
		{ 
		out.println("<input type=checkbox name=fieldrowid value="+j+">");
		out.println("<input type=Text name=columnname"+j+" value="+rsm.getColumnName(j)+">");
		out.println("<input type=Text name=datatype"+j+"  value="+rsm.getColumnTypeName(j)+"><Br>");
		j=j+1;
		}	
	}
	%>
	</td>
	</tr>
	
	<tr>
	<td>
	Output
	</td>
	<td>
	<select name="method_output">
		<option name="insert"> void</option>
	<option name="insert"> int </option>
		<option name="update">collection</option>
			<option name="delete"> true</option>

	</select>
	</td>
	</tr>
	
	
	<tr>
	<td>
	Operation 
	</td>
	<td>
	<select name="method_operation">
		<option name="insert"> Select</option>
	<option name="insert"> Insert</option>
		<option name="update">Update</option>
			<option name="delete"> Delete</option>

	</select>
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