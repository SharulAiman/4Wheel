<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("u");

String DB_DRIVER = "com.mysql.jdbc.Driver"; //Drivername
	String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_9e3eec1049bc61a"; //Edit DATABASE LINK DENGAN ORACLE FORMAT (jdbc:oracle:thin:@hostname:portnumber:databasename)
String DB_USER = "b60aeb8a3d95c4"; // Username Oracle
	 String DB_PASSWORD = "13f26d04"; //Password Oracle

Class.forName(DB_DRIVER).newInstance();
Connection conn = DriverManager.getConnection(DB_HOST,DB_USER,DB_PASSWORD);
Statement stat = conn.createStatement();
stat.executeUpdate("delete from car where CarId='"+id+"'");
response.sendRedirect("listCarAdmin.jsp");
%>

