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
            <a href="index.jsp" class="navbar-brand"> 4Wheel Car Rental </a>
          </div>
            </nav>
      </header>
            <br>
         <a href="adminMenu.jsp" class="btn btn-warning">BACK</a>
            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">List of Admin </h3>
                    <hr>
    <div class="col-md-6">
         <a href="AddAdmin.jsp" class="btn btn-primary">Add Admin</a>
    </div>
<p></p>
<table class="table table-bordered table-striped table-hover">
   <thead>
       <tr>
         <th>Admin Id :</th>
         <th>Username :</th>
         <th>Password :</th>
         <th>Email :</th>
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
       String data = "select * from admin";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
       <tr>
       <td><%=res.getInt("AdminId")%></td>
         <td><%=res.getString("AdminUsername")%></td>
         <td><%=res.getString("AdminPassword")%></td>
         <td><%=res.getString("AdminEmail")%></td>
         
         <td class="text-center">
          <a href='UpdateAdmin.jsp?u=<%=res.getInt("AdminId")%>' class="btn btn-warning">Update</a>

           <a href='DeleteAdmin.jsp?u=<%=res.getInt("AdminId")%>' class="btn btn-danger">Delete</a>
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