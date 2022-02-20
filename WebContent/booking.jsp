<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="menu.css">
  <title>4 WHEEL | BOOKING</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
       <div class="header">
  <img src="logo2.jpg" alt="Trulli" width="200" height="50">
  <div class="header-right">
    <a class="active" href="menu.jsp">Home</a>
    <a href="ViewReservation.jsp">History</a>
    <a href="login.jsp">Logout</a>
  </div>
</div>
      </header>
            <br>


            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">Add Booking Details</h3>
                    <hr>
					<form action="" method="post">
				
					<div class="form-group">
					   <label>Car ID Number</label>
					     <input type="text" class="form-control" name="CarId" placeholder=""/>
					   </div>
					   <div class="form-group">
					   <label>Your IC Number</label>
					     <input type="text" class="form-control" name="CustId" placeholder=""/>
					   </div>
					<div class="form-group">
					   <label>Start Date</label>
					     <input type="date" class="form-control" name="StartDate" placeholder=""/>
					   </div>
					   <div class="form-group">
					   <label>End Date</label>
					     <input type="date" class="form-control" name="EndDate" placeholder=""/>
					   </div>
					 	   
					   <div class="form-group">
					   <label>Pickup Location</label>
					     <input type="text" class="form-control" name="Pickup" placeholder=""/>
					   </div>
					   <div class="form-group">
					   <label>Drop Off Location</label>
					     <input type="text" class="form-control" name="DropOff" placeholder=""/>
					   </div>
				
					

		
				 <button type="submit" class="btn btn-primary">Proceed</button>
					   <a href="menu.jsp" class="btn btn-danger">Back</a>
					</form>
                </div>
</body>
</html>

<%

Integer a = null;
String b =request.getParameter("CarId");
String c =request.getParameter("CustId");
String d =request.getParameter("StartDate");
String e =request.getParameter("EndDate");
String f =request.getParameter("Pickup");
String g =request.getParameter("DropOff");


String DB_DRIVER = "com.mysql.jdbc.Driver"; //Drivername
	String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_9e3eec1049bc61a"; //Edit DATABASE LINK DENGAN ORACLE FORMAT (jdbc:oracle:thin:@hostname:portnumber:databasename)
String DB_USER = "b60aeb8a3d95c4"; // Username Oracle
	 String DB_PASSWORD = "13f26d04"; //Password Oracle

Connection conn = null;
PreparedStatement stat = null;
Class.forName(DB_DRIVER).newInstance();
if( b!=null && c!=null && d!=null && e!=null && f!=null && g!=null){
	conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	String data = "insert into reservation(CarId,CustId,StartDate,EndDate,Pickup,DropOff) values(?,?,?,?,?,?)";
	stat = conn.prepareStatement(data);
	
	stat.setString(1,b);
	stat.setString(2,c);
	stat.setString(3,d);
	stat.setString(4,e);
	stat.setString(5,f);
	stat.setString(6,g);
	stat.executeUpdate();
	response.sendRedirect("payment.jsp");
}
%>



