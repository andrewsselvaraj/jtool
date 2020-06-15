<%@ page import="java.sql.*"%> 
<%
	String JDBC_DRIVER 		= "com.ibm.as400.access.AS400JDBCDriver";
	String DB_URL 			= "jdbc:as400:3.144.232.106;libraries=ECS,*LIBL";
	String USER_ID 			= "ECS";
	String PASSWORD 		= "ECS";	
	String sql = request.getParameter("sql");
	sql="select * from "+sql;
	out.println(""+sql);
%>
<%
		Connection conn = null;
		Statement stmt = null;
		
		try
		{
			Class.forName( JDBC_DRIVER );
			conn = DriverManager.getConnection( DB_URL, USER_ID, PASSWORD );		

			stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(sql);
			ResultSetMetaData rsm =rs.getMetaData();
			int totcol= rsm.getColumnCount();
			int i=1;
			String header="<table border=\"1\"><TR><td>Column Name</td><td>Width</td><td>Type</td></tr>";
			while(i<=totcol)
				{

				header = header+"<td>"+rsm.getColumnName(i)+"</td><td>"+rsm.getColumnDisplaySize(i)+"</td><td>"+rsm.getColumnTypeName(i)+"</td></tr>";

				i = i+1;
				}
			header=header + "</table>";
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
