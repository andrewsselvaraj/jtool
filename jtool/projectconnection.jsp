<%@ page import="java.sql.*" %>
<%!
	Connection con1=null;
	Statement st1=null;
	ResultSet rs1 = null;
	Class.forName(Driver);
	con=DriverManager.getConnection("jdbc:odbc:esi", "esi","esi");
%>