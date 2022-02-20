<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<html>
<head>
  <title>GSS Car Rental</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #4CAF50">
         <div>
            <a href="index.jsp" class="navbar-brand"> GSS Car Rental </a>
          </div>
            </nav>
      </header>
            <br>

            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">Payment Receipt</h3>
                    <hr>
   
<p></p>
<table class="table table-bordered table-striped table-hover">
   <thead>
       <tr>
       <th>Payment Method ::</th>
         <th>Payment Date ::</th>
         <th>Card Name</th>
         <th>Card Number :</th>
         <th>Customer Name  :</th>
        
        
    
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
       String data = "select * from payment";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
       <tr>
    	<td><%=res.getString("PaymentMethod")%></td>
         <td><%=res.getString("PaymentDate")%></td>
         <td><%=res.getString("CardName")%></td>
         <td><%=res.getString("CardNum")%></td>
         <td><%=res.getString("CustName")%></td>
         

  
        </tr>
        <%
       }
        %>
         
    </tbody>
</table>
</div>
</body>
</html>