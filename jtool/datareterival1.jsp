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
	<form method="get" action="codedatabase.jsp">
<%!
String STATUS,PROJECTNAME,USECASES,INPUT,OUTPUT,DBFUNCTIONNAME,CLASSNAME,FUNCTIONNAME,DAONAME,TABLENAME;
%>
<%

	Connection con = null;
	Statement st = null;
	
	String classcode1="";	
		try
		{
		
			
		
			String Driver=	(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");
			
			Class.forName(Driver);
		 	con= DriverManager.getConnection(Database,username,password);
			st = con.createStatement();
			
			
			
			PROJECTNAME= request.getParameter("PROJECTNAME");
			USECASES= request.getParameter("USECASES");

			INPUT= request.getParameter("INPUT");
			OUTPUT= request.getParameter("OUTPUT");
			DBFUNCTIONNAME= request.getParameter("DBFUNCTIONNAME");
			CLASSNAME  = request.getParameter("CLASSNAME");
			FUNCTIONNAME= request.getParameter("FUNCTIONNAME");
			DAONAME= request.getParameter("DAONAME");
			TABLENAME= request.getParameter("TABLENAME");
			STATUS= request.getParameter("STATUS");
		           %><br><br><br><br><br><br><br><br><br><br>
				
				<center>
			<% 
			out.println(""+PROJECTNAME);   		 	
			out.println(""+USECASES);
			out.println(""+INPUT);
			out.println(""+OUTPUT);
			out.println(""+DBFUNCTIONNAME);
			out.println(""+CLASSNAME);
			out.println(""+FUNCTIONNAME);
			out.println(""+DAONAME);
			out.println(""+TABLENAME);
			%>
			</center>
			<h3>CODE GEN.FOR JAVA</h3>
			<%
	  	classcode1 ="public class " +TABLENAME+"DAO" +"<br>{<br>";
	    classcode1=classcode1+"&nbsp&nbsp&nbsp&nbsp &nbsp" +OUTPUT +" "+FUNCTIONNAME+ "(" +INPUT +" p_"+INPUT+ ")<BR>&nbsp&nbsp&nbsp&nbsp{" ;
	  	classcode1=classcode1+"<br>&nbsp&nbsp&nbsp&nbsp;<a href=\"asdas.jsp?table="+TABLENAME+"&operation="+DBFUNCTIONNAME+"\">bspclick here to get DAO CODE</a>"+DBFUNCTIONNAME+"<br>&nbsp&nbsp&nbsp&nbsp;}"	;				
	  	classcode1 ="<br>"+classcode1+"<br>}";
	  					
	  					out.println("<br>"+classcode1);
	  					
	  		}
			
		catch(Exception e)
		{
			e.printStackTrace();
		}
			try
			{
			Class.forName(Driver);
			con=DriverManager.getConnection("jdbc:odbc:name","scott","tiger");
			st=con.createStatement();
	String sql="insert into dblistsec values('"+ PROJECTNAME+"','"+USECASES+"','"+ INPUT  +"','"+ OUTPUT +"','"+  FUNCTIONNAME+"','"+TABLENAME+"','"+  DBFUNCTIONNAME+"','"+DAONAME+"','"+"1"+"')";
	int rs=st.executeUpdate(sql);
	
	
			con.close();
			st.close();
			}
			catch(Exception e1)
		{
			e1.printStackTrace();
		}	
	%>
	<BR>
		<input type="submit" value="submit">
</form>	</td>
  </tr>
    <tr >
     <th colspan="2" scope="col"> con.close();</th>
  </tr>
</table>

</body>

</html>