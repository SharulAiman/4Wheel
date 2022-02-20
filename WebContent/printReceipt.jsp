<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Receipt</title>
</head>
<body>

<h1>Payment Receipt</h1>

<p>


<b>Payment Method:</b>
   <%= request.getParameter("PaymentMethod>")%>
   <br>
<b>Payment Date:</b>
<%= request.getParameter("PaymentDate")%>
   <br>
  <b>Card Name:</b>  
   <%= request.getParameter("CardName")%>
   <br>
   <b>Card Number:</b>
   <%= request.getParameter("CardNum")%>
   <br>
   
   <b>Customer Name:</b>
   <%= request.getParameter("CustName")%>
</p>


</body>
</html>
<%
Integer a = null;
String b = request.getParameter("PaymentMethod");
String c = request.getParameter("PaymentDate");
String d = request.getParameter("CardName");
String e = request.getParameter("CardNum");
String f = request.getParameter("CustName");



String DB_DRIVER = "com.mysql.jdbc.Driver"; //Drivername
	String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_9e3eec1049bc61a"; //Edit DATABASE LINK DENGAN ORACLE FORMAT (jdbc:oracle:thin:@hostname:portnumber:databasename)
String DB_USER = "b60aeb8a3d95c4"; // Username Oracle
	 String DB_PASSWORD = "13f26d04"; //Password Oracle

Connection conn = null;
PreparedStatement stat = null;
Class.forName(DB_DRIVER).newInstance();
if( b!=null && c!=null && d!=null && e!=null && f!=null){
	conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	String data = "insert into payment(PaymentMethod,PaymentDate,CardName,CardNum,CustName) values(?,?,?,?,?)";
	stat = conn.prepareStatement(data);

	stat.setString(1,b);
	stat.setString(2,c);
	stat.setString(3,d);
	stat.setString(4,e);
	stat.setString(5,f);
	stat.executeUpdate();
	response.sendRedirect("printReceipt.jsp");
}
%>



