

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>


<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="menu.css">
<meta charset="utf-8">
<title>4 WHEEL | MENU</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div class="header">
  <img src="logo2.jpg" alt="Trulli" width="200" height="50">
  <div class="header-right">
    <a class="active" href="menu.jsp">Home</a>
    <a href="index.jsp">Logout</a>
  </div>
</div>

    <br>
     <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">Reservation History</h3>
                    <hr>
   
<p></p>
<table class="table table-bordered table-striped table-hover">
<form action="" method="post">
<div class="form-group">
     			<label>IC Number</label>
     			<input type="text" class="form-control" name="CustId"/>
   			</div>
   			<button type="submit" class="btn btn-success">Search</button>
   			</form>
   <thead>
       <tr>
         <th>Reservation ID</th>
         <th>Car ID</th>
         <th>Customer IC :</th>
         <th>Start Date  :</th>
         <th>End Date :</th>
         <th>Pickup Location:</th>
         <th>Dropoff Location :</th>
        </tr>
    </thead>
    <% String a = request.getParameter("CustId"); %>
    <tbody>
       <%
       String DB_DRIVER = "com.mysql.jdbc.Driver"; //Drivername
      	String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_9e3eec1049bc61a"; //Edit DATABASE LINK DENGAN ORACLE FORMAT (jdbc:oracle:thin:@hostname:portnumber:databasename)
       String DB_USER = "b60aeb8a3d95c4"; // Username Oracle
      	 String DB_PASSWORD = "13f26d04"; //Password Oracle
       
       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       Class.forName(DB_DRIVER);
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       stat = conn.createStatement();
       String data = "select * from reservation where CustId='"+a+"'";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
       <tr>
         <td><%=res.getInt("ReservationId")%></td>
         <td><%=res.getString("CarId")%></td>
         <td><%=res.getString("CustId")%></td>
         <td><%=res.getString("StartDate")%></td>
         <td><%=res.getString("EndDate")%></td>
         <td><%=res.getString("Pickup")%></td>
         <td><%=res.getString("DropOff")%></td>
         

         
        </tr>
        <%
       }
        %>
         
    </tbody>
</div>
</body>
</html>
