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
    <a class="active" href="#home">Home</a>
    <a href="#contact">History</a>
    <a href="#about">About</a>
    <a href="login.jsp">Logout</a>
  </div>
</div>


    <div style="text-align: center">
        <h1>Welcome to User Menu Page</h1>
    </div>
    <br>
     <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">List of Car </h3>
                    <hr>
   
<p></p>
<table class="table table-bordered table-striped table-hover">
   <thead>
       <tr>
         <th>Car Type :</th>
         <th>Car Name </th>
         <th>Car Brand :</th>
         <th>Car Rate :</th>
         <th>Car Plate Number :</th>
         <th>Car Quantity :</th>
         <th>Car Transmission :</th>
         <th>Car Engine Capacity :</th>
         <th class="text-center">Action</th>
        </tr>
    </thead>
    <tbody>
       <%
       String DB_DRIVER = "com.mysql.jdbc.Driver";
       String DB_HOST = "jdbc:mysql://localhost/gss";
       String DB_USER = "root";
       String DB_PASSWORD = "";

       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       Class.forName(DB_DRIVER);
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       stat = conn.createStatement();
       String data = "select * from car";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
       <tr>
         <td><%=res.getString("CarType")%></td>
         <td><%=res.getString("CarName")%></td>
         <td><%=res.getString("CarBrand")%></td>
         <td><%=res.getDouble("CarRate")%></td>
         <td><%=res.getString("CarPlateNo")%></td>
         <td><%=res.getString("CarPassengerQty")%></td>
         <td><%=res.getString("CarTransmission")%></td>
         <td><%=res.getString("CarEngineCapacity")%></td>

         <td class="text-center">
           <a href='booking.jsp?u=<%=res.getInt("CarId")%>' class="btn btn-warning">BOOKING</a>
         </td>
        </tr>
        <%
       }
        %>
         
    </tbody>
</table>
</div>
    
    
    
   
</body>
</html>