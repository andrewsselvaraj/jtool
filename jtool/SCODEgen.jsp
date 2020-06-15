<%@ page import="java.io.*" %>
<%
File outFile = new File("xxxx.txt");
		BufferedWriter bw = new BufferedWriter(new FileWriter(outFile,true));

		bw.write("CHUNNNA");
		bw.close();
		System.out.println("file wrote");
%>