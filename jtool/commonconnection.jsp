<%@ page import="java.sql.*" %>
<%!
	Connection con=null;
	Statement st=null;
	ResultSet rs = null;
	Class.forName(Driver);
	con=DriverManager.getConnection(Database, username,password);
%>