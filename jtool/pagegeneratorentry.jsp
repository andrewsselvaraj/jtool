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
<script languge="javascript">
function pagedisplayselect()
{
alert("jadajs");
}
</script>
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
  <td width=20%><table>
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
	<td bgcolor="#FFFFFF" align=center>
	<%@ page import="java.sql.*"%> 

<%	

		Connection conn = null;
		Statement stmt = null;
			String Driver=	(String)application.getAttribute("Driver");
			String username =(String)application.getAttribute("username");
			String password = (String)application.getAttribute("password");
			String Database= (String)application.getAttribute("Database");

		try
		{
			Class.forName(Driver);
			conn=DriverManager.getConnection(Database, username,password);
			 
			 
			stmt = conn.createStatement();
			String sql = "select * from "+request.getParameter("tablename");
			ResultSet rs = stmt.executeQuery(sql);
			ResultSetMetaData rsm =rs.getMetaData();
			int totcol= rsm.getColumnCount();
			int i=1;

			out.println("<form action=\"pagegenerator.jsp\">");
			String header="<table border=\"1\"><TR><td>Insert Page Creation</td><td>Column Name</td></tr>";
			while(i<=totcol)
				{

				header = header+"<td><input type=textbox name=field value="+rsm.getColumnName(i)+"></td>";
				header = header+"<TD><select name=datatype"+i+"><option value=textfield>TextField</option><option value=multibox>multibox</option><option value=textarea>Textarea</option><option value=radio>radio</option><option value=checkbox>checkbox</option><option value=submit>submit</option></select></td></tr>\n";
				i = i+1;
				}
				i = i -1;
			header=header + "<tr><td colspan=2><INPUT type='submit' name='getqry' onclick='pagedisplayselect()'></td></tr></table>\n";
			out.println(header);
			header = "";

			header= header+"<input type=hidden name=length value="+i+">\n";
			header= header+"</form>\n";

i=1;

			out.println("<form action=\"Viewpagegenerator.jsp\">");
			header="<table border=\"1\"><TR><td>View  Page Creation</td><td>Column Name</td></tr>";
			while(i<=totcol)
				{

				header = header+"<td><input type=checkbox name=field value="+rsm.getColumnName(i)+"></td>";
				header = header+"<TD>"+rsm.getColumnName(i)+"</td></tr>\n";
				i = i+1;
				}
				i = i -1;
			header=header + "<tr><td colspan=2><INPUT type='submit' name='getqry' onclick='pagedisplayselect()'></td></tr></table>\n";


			header= header+"<input type=hidden name=length value="+i+">\n";
			header= header+"</form>\n";
			rsm = null;			
			rs.close();


			System.out.println("<=============================Results OVER===========================>");
			out.println(header);
			// Close the statment & connection	
			stmt.close();			
			conn.close();
			conn = null;
		}
		catch (Throwable e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if ( stmt != null )
				{
					stmt.close();
				}
				
				if ( conn != null )
				{
					conn.close();
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
     <th colspan="2" scope="col"> Dev con.close();</th>
  </tr>
</table>

</body>

</html>
