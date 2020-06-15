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
<%!
	Connection con1 = null;
	Statement st1=null;
	ResultSet rs = null;
%>
<%

			String Driver1=(String)application.getAttribute("Driver1");
			String username1 =(String)application.getAttribute("username1");
			String password1 = (String)application.getAttribute("password1");
			String Database1= (String)application.getAttribute("Database1");

	Class.forName(Driver1);
	
	con1=DriverManager.getConnection(Database1, username1,password1);
	st1=con1.createStatement();
	%>
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
	<tr><td class="style5"><a href="displayalltable.jsp ">Page Generation </a></td></tr><tr><td class="style5"><a href="daocreation.jsp ">DAO creation </a></td></tr>
	<tr><td class="style5"><a href="vogenerate.jsp">VO generation</a>
	<tr><td class="style5"><a href="integeration.jsp ">Integeration & Deployment</a></td></tr>

	</table>
	</td>
	<td bgcolor="#FFFFFF">
	 <form action="vocreation.jsp" method="post" class="style5">
	<table align="center">





	<tr>

	<td>
	<table>
	<%
	String[] tablename=request.getParameterValues("tablename");
	for(int i=0;i<tablename.length;i++)
	{
		String req_tablename=tablename[i];
		if(req_tablename!=null)
		{
			rs = st1.executeQuery("Select * from "+req_tablename);
			ResultSetMetaData rsm =rs.getMetaData();
			int totcol= rsm.getColumnCount();
			int j=1;
			out.println("Table Name : "+req_tablename+"<BR>");
			while(j<=totcol)
			{ 
			out.println("<input type=checkbox name=fieldrowid value="+j+">");
			out.println("<input type=Text name=columnname value="+rsm.getColumnName(j)+">");
			out.println("<input type=Text name=datatype  value="+rsm.getColumnTypeName(j)+">");
			out.println("<select name=javadatatype><option>int</option><option>float</option><option>String</option><option>date</option></select><Br>");
			j=j+1;
			}	
		}
	}
	%>
	</table>
	</td>
	</tr>

		<tr>
	<td colspan=2>
	Enter VO name : <input type=textfield name=voname>


	</td>
	</tr>



	
	<tr>
	<td colspan=2>
	<input type=submit value="Create Value Object">

	<input type=reset>
	</td>
	</tr>
	</table>

    </form></td>
  </tr>
    <tr >
     <th colspan="2" scope="col"> con.close();</th>
  </tr>
</table>

</body>

</html>

