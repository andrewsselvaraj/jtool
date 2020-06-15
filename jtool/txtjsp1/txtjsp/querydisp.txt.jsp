<%
	String[] parameters = request.getParameterValues("fieldname");
	for(int i=0; i<parameters.length; i++)
	{
		out.println(i+""+parameters[i]);
	}
	
%>