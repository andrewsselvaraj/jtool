
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
	<form method="get" action="show.jsp">

<%
String Driver,Database,username,password;
String Driver1,Database1,username1,password1;

			Driver= request.getParameter("Driver");
			Database= request.getParameter("Database");
			username= request.getParameter("username");
			password= request.getParameter("password");
		
			application.setAttribute("Driver",Driver);
			application.setAttribute("username",username);
			application.setAttribute("password",password);
			application.setAttribute("Database",Database);


			Driver1= request.getParameter("Driver1");
			Database1= request.getParameter("Database1");
			username1= request.getParameter("username1");
			password1= request.getParameter("password1");
		
			application.setAttribute("Driver1",Driver1);
			application.setAttribute("username1",username1);
			application.setAttribute("password1",password1);
			application.setAttribute("Database1",Database1);
			out.println(Driver);
			out.println(Database);
			out.println(username);
			out.println(password);
			out.println(Driver1);
			out.println(Database1);
			out.println(username1);
			out.println(password1);
			%>

			</form></td>
  </tr>
    <tr >
     <th colspan="2" scope="col"> con.close();</th>
  </tr>
</table>

</body>

</html>