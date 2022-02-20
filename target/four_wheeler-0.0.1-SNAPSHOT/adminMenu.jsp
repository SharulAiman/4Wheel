<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="adminMenu.css">
<meta charset="utf-8">
<title>4 WHEEL | ADMIN MENU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>



<div class="w3-sidebar w3-bar-block w3-silver w3-animate-left" style="display:none" id="mySidebar">
  <button class="w3-bar-item w3-button w3-large"
  onclick="w3_close()">Close &times;</button>
  <a href="listAdmin.jsp" class="w3-bar-item w3-button">ADD ADMIN</a>
  <a href="listCarAdmin.jsp" class="w3-bar-item w3-button">CAR LIST</a>
   <a href="receipt.jsp" class="w3-bar-item w3-button">PAYMENT LIST</a>
  <a href="login.jsp" class="w3-bar-item w3-button">LOG OUT</a>
</div>

<div id="main">

<div class="w3-teal">
  <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
  <div class="w3-container">
    <h1>Welcome Admin</h1>
  </div>
</div>
   
    </div>
    
    <script>
function w3_open() {
  document.getElementById("main").style.marginLeft = "25%";
  document.getElementById("mySidebar").style.width = "25%";
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("openNav").style.display = 'none';
}
function w3_close() {
  document.getElementById("main").style.marginLeft = "0%";
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("openNav").style.display = "inline-block";
}
</script>

<br>
 <div class="container">
                    <h3 class="text-center">RESERVATION LOG</h3>
                    <hr>
<p></p>
<a href='receipt.jsp' class="btn btn-success">View Payment</a>
<table class="table table-bordered table-striped table-hover">


   <thead>
       <tr>
         <th>Reservation Id ::</th>
         <th>Car Id</th>
         <th>Customer Ic :</th>
         <th>Start Date  :</th>
         <th>End Date :</th>
         <th>Pickup Location:</th>
         <th>Dropoff Location :</th>
        
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
       String data = "select * from reservation";
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
         

         <td class="text-center">
           <a href='Delete.jsp?u=<%=res.getString("ReservationId")%>' class="btn btn-danger">Delete</a>
           
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