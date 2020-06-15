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
		<form method="get" action="cod.jsp">
	<%
	String CLASS_ID,METHOD_ID,METHOD_NAME,METHOD_INPUT,METHOD_OUTPUT,METHOD_OPERATION,METHOD_TABLE,METHOD_NAME1;
	String METHODTYPE="";
	String classcode1="";
	Connection con=null;
	String fields="";
	String operation="";
	String logic ="";
	Statement st=null;
	%>
		<%
							
			String Driver=	(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");
			
			
			CLASS_ID= request.getParameter("CLASS_ID1");
			METHOD_ID= request.getParameter("METHOD_ID1");
			METHOD_NAME= request.getParameter("METHOD_NAME1");
			METHOD_INPUT= request.getParameter("METHOD_INPUT1");
			METHOD_OUTPUT= request.getParameter("METHOD_OUTPUT1");
			METHOD_OPERATION= request.getParameter("METHOD_OPERATION1");
			METHOD_TABLE= request.getParameter("METHOD_TABLE1");
			
			/*
			out.println(""+CLASS_ID);   		 	
			out.println(""+METHOD_ID);
			out.println(""+METHOD_NAME);
			out.println(""+METHOD_INPUT);
			out.println(""+METHOD_OUTPUT);
			out.println(""+METHOD_OPERATION);
			out.println(""+METHOD_TABLE);
			*/
		classcode1="import java.io.*;<br>import.javax.servlet.http.servletRequest;<br>import.javax.servlet.http.servletResponse;<br>import.java.sql.*;<br>";


		classcode1 =classcode1+"public class " +METHOD_TABLE+"DAO" +"<br>{<br>";
	   	classcode1=classcode1+"&nbsp&nbsp&nbsp&nbsp &nbsp" +METHOD_OUTPUT +" "+METHOD_NAME+ "(" +METHOD_INPUT +" p_"+METHOD_INPUT+ ")<BR>&nbsp&nbsp&nbsp&nbsp{<BR>" ;
		classcode1=classcode1+"Connection con=null;<br>Statement st=null;<br>try<br>&nbsp&nbsp{<br>&nbsp&nbspClass.forName(sun.jdbc.odbc.JdbcOdbcDriver);<br>";
		classcode1=classcode1+"&nbsp&nbspcon=DriverManager.getConnection(jdbc:odbc:oracle, scott,tiger);<br>";
		classcode1=classcode1+"&nbsp&nbspst=con.createStatement();<br>";
	

		try
		{
			
			Class.forName(Driver);
			con=DriverManager.getConnection(Database, username,password);
			st=con.createStatement();

			String sql="select * from methoddetail where methodid='1122'";
			ResultSet rs=st.executeQuery(sql);
			
			out.println("<H1>DAO</h1>");
			

			String codegen_sql= "";
			if(METHOD_OPERATION.equalsIgnoreCase("select"))
			{
				codegen_sql="&nbsp&nbspselect * from "+METHOD_TABLE+" where ";
			}

			if(METHOD_OPERATION.equalsIgnoreCase("delete"))
			{
				codegen_sql="delete from "+METHOD_TABLE+" where ";
			}

			if(METHOD_OPERATION.equalsIgnoreCase("update"))
			{
				codegen_sql="update "+METHOD_TABLE+" set where ";
			}
			//out.println(username+codegen_sql);
				
			while(rs.next())
			{
				String column = rs.getString("methodtype");
				
				operation = operation +column +"= p_"+METHOD_TABLE+".get"+column +"() ";

			//out.println(""+operation +"<BR>");
			
			}
			
			logic = codegen_sql + operation ;
			classcode1=classcode1+fields;
			
			}
			catch(Exception e2)
			{e2.printStackTrace();}
		
	  //	classcode1=classcode1+"<br>&nbsp&nbsp&nbsp&nbsp;<a href=\"asdas.jsp?table="+METHOD_TABLE+"&operation="+METHOD_OPERATION+"\">bspclick here to get DAO CODE</a>"+METHOD_OPERATION+"<br>&nbsp&nbsp&nbsp&nbsp;"	;				
	  	classcode1 ="<br>"+classcode1+"<br>";
	  					String load="";
				load="ResultSet rs=st.executeQuery(sql)<br>&nbsp&nbspwhile(rs.next())<br>&nbsp&nbsp{<br>out.println(rs.getString());<br>&nbsp&nbsp}<br>";
			
	  					out.println("<br>"+classcode1);
	  					out.println("<br>"+logic +"<BR>");
						out.println(""+load);

			out.println("<H1>ACTION</h1>");
			String actionclass="import javax.servlet.http.HttpServletRequest;<br>import javax.servlet.http.HttpServletResponse;<br>import org.apache.struts.action.Action;<br>import org.apache.struts.action.ActionForm;<br>import org.apache.struts.action.ActionForward;<br>import org.apache.struts.action.ActionMapping;<br>";

			 actionclass=actionclass+" public class "+METHOD_TABLE+"Action"+ "extends ACTION ";
	actionclass=actionclass+"<br>{<br>&nbsp&nbsp&nbsp public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception <BR>&nbsp&nbsp{<BR>"+METHOD_TABLE+"Action"+"   obj"+METHOD_TABLE+"=new"+METHOD_TABLE+  "();<BR>";

			actionclass = actionclass+ "obj"+METHOD_TABLE+"Action"+"." +METHOD_NAME+"();<BR>";
			actionclass = actionclass+"mapping.findforward("+METHOD_NAME+"success)<br>&nbsp&nbsp&nbsp&nbsp&nbsp}<br>}";
			out.println(""+actionclass );
		

	  					
			
		%>
</form>
<p><b>ACTIONFORM<b><p>

<%
String codedb="";
		 codedb =" import org.apache.struts.action.ActionForm;<br>import org.apache.struts.action.ActionMapping;<br>import org.apache.struts.action.ActionErrors;<br>import org.apache.struts.action.ActionError;<br>import javax.servlet.http.HttpServletRequest;<br>";
		out.println(codedb);
String sql2="select * from "+"category"+"";


		ResultSet rs1=st.executeQuery(sql2);
		ResultSetMetaData rsm =rs1.getMetaData();
				int totcol= rsm.getColumnCount();
				int j=1;
	while(j<=totcol)
				{ 
		String colname=rsm.getColumnName(j);
		String coltype=rsm.getColumnTypeName(j);
		//out.println(""+colname);
		//out.println(""+coltype);
		
		//out.println(" public "+METHOD_TABLE+"Form{ <BR>");
		
		if(coltype.equalsIgnoreCase("varchar2"))
			{
				String code = "";
				//code =code +""+colname +"=null;";
				code="public "+METHOD_TABLE+" extends ActionForm<br>{<Br>&nbsp&nbsp";
				code = code + "public String get"+colname+"();<BR>&nbsp&nbsp{ <br>&nbsp&nbsp return "+colname+"<br>&nbsp&nbsp}<br>" ;
				code=code+"public"+METHOD_OUTPUT+"reset (ActionMapping actionMapping, HttpServletRequest request) <br>&nbsp&nbsp{<br>";
				code=code+"this."+colname+"<br>&nbsp&nbsp}<br>}";
				out.println(code);
				
			}
		j++;			
	}
while(rs1.next())
{
	out.println(""+rs1.getString(1));
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