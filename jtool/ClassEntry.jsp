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
<html>
	<script language="javascript">
	function doSubmit()
	{
		var x =document.classEntryFrm.project_id.options(document.classEntryFrm.project_id.selectedIndex).value;

		document.classEntryFrm.project_id.value = x;
		document.classEntryFrm.action = "ClassEntry.jsp";
		document.classEntryFrm.method = "get";
		document.classEntryFrm.submit();
	}
	</script>
<body>



<form action="ClassProcess.jsp" name="classEntryFrm">
<%
			String Driver=(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");

	Class.forName(Driver);
			con=DriverManager.getConnection(Database, username,password);

	st=con.createStatement();
%>
	<table>
	<tr>
	<td>
	Project Name
	</td>
	<td>
	<select  name="project_id" onChange="doSubmit()">
	<%
	rs = st.executeQuery("select * from projectMaster");	
	while(rs.next())
	{
	String project_id = rs.getString("project_id");
	String project_name = rs.getString("project_name");
	
	String req_project_id = request.getParameter("project_id");
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
	<select name=usecase_id>
	<%
    String project_id =	request.getParameter("project_id");
	if(project_id!=null)
	{
		rs = st.executeQuery("select * from usecaseMaster where project_id = '"+project_id+"'");	
		while(rs.next())
		{
		String usecase_id = rs.getString("usecase_id");
		String usecase_name = rs.getString("usecase_name");
		%>
		<option value="<%=usecase_id%>">  <%=usecase_name%> </option>";
		<%
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
	<input type=text name="classname" >
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