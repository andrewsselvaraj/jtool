<%@ page import="java.sql.*"%> 
<%
	String JDBC_DRIVER 		= "com.ibm.as400.access.AS400JDBCDriver";
	String DB_URL 			= "jdbc:as400:3.144.232.106;libraries=ECS,*LIBL";
	String USER_ID 			= "ECS";
	String PASSWORD 		= "ECS";	
	String sql = request.getParameter("sql");
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
			String header="<table border=\"1\"><TR><TD>&nbsp;</td>";
			while(i<=totcol)
				{
				
				header = header+"<td>"+rsm.getColumnName(i)+"</td>";

				i = i+1;
				}
			header=header + "</TR>";
			rsm = null;			
			rs.close();


			String data = "";
						
			ResultSet rs1 = stmt.executeQuery(sql);
			System.out.println("<===========================gettting results=================================================================>");
			int row=1;
			while(rs1.next())
			{
									data = data+"<tr><td>"+row+"th row </td>";
									row=row+1;
			for(int j=1; j<=totcol; j++)
				{

				data = data+"<td>&nbsp;"+rs1.getString(j)+"</td>";
										
				} 
				data = data+"</tr>";
			}
			data = data+"</table>";
			System.out.println("<=============================Results OVER===========================>");
			out.println(header+data);
			rs1.close();
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
