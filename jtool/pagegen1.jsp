<%@ page import="java.sql.*" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%!
	Connection con=null;
	Statement st=null;
	ResultSet rs = null;

%>
<html>
	<script language="javascript">
	function projectChange()
	{
		alert("1-1");
		var project_id =document.classEntryFrm.project_id.options(document.classEntryFrm.project_id.selectedIndex).value;
alert("1-2");
		
		
		alert("1");
		document.classEntryFrm.project_id.value = project_id;

		alert("2");
		document.classEntryFrm.action = "MethodEntry.jsp";
		document.classEntryFrm.method = "get";
		document.classEntryFrm.submit();
	}
	function useCaseChange()
	{
		
		var project_id =document.classEntryFrm.project_id.options(document.classEntryFrm.project_id.selectedIndex).value;
		var usecase_id =document.classEntryFrm.project_id.options(document.classEntryFrm.usecase_id.selectedIndex).value;
		
		alert("usecase_id_id"+usecase_id);
		alert("project_id"+project_id);

		document.classEntryFrm.project_id.value = project_id;
		document.classEntryFrm.usecase_id .value = usecase_id;
		document.classEntryFrm.action = "MethodEntry.jsp";
		document.classEntryFrm.method = "get";
		document.classEntryFrm.submit();
	}
	</script>
<body>



<form action="MethodProcess.jsp" name="classEntryFrm">

	</select>

	</td>
	</tr>
	
	<tr>
	<td>
	UseCase Name
	</td>
	
	<td>
	<select name=usecase_id onChange="projectChange()">
	
	</select>

	</td>
	</tr>
	
	
		<tr>
	<td>
	Class Name
	</td>
	
	<td>
	<select name=class_id>

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

	</select>
	</td>
	</tr>
	
	<tr>
	<td>
	Input 
	</td>
	<td>

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
</body>
</html>