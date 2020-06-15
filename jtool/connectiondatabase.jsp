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
	<tr><td class="style5"><a href="displayalltable.jsp">Page Generation </a></td></tr>
	<tr><td class="style5"><a href="integeration.jsp">Integeration & Deployment</a></td></tr>

	</table>
	</td>
	<td bgcolor="#FFFFFF">
	<form method="get" action="connectiondbentery.jsp">
<table  align="center">
<tr>
<th align="center"> Driver:
<td><input type="text" name="Driver" value=sun.jdbc.odbc.JdbcOdbcDriver>
<tr>
<th align="center">Database:
<td><input type="text" name="Database" value=Database>
<tr>
<th align="center">Username:
<td><input type="text" name="username" value=username>
<tr>
<th align="center">Username:
<td><input type="text" name="password" value=username>
<tr>

<tr>
<th align="center"> Driver1:
<td><input type="text" name="Driver1" value=sun.jdbc.odbc.JdbcOdbcDriver>
<tr>
<th align="center">Database1:
<td><input type="text" name="Database1" value="jdbc:odbc:esi">
<tr>
<th align="center">Username1:
<td><input type="text" name="username1" value="esi">
<tr>
<th align="center">password1:
<td><input type="text" name="password1" value="esi">
<tr>
<td><input type=Submit value="Sign in">
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