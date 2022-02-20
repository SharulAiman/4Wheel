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
<script type="text/javascript">
function myFunction() {
	  confirm("Are you want to delete?");
	}
</script>
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
       String data = "select * from admin";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
       <tr>
       <td><%=res.getString("AdminId")%></td>
         <td><%=res.getString("AdminUsername")%></td>
         <td><%=res.getString("AdminPassword")%></td>
         <td><%=res.getString("AdminEmail")%></td>
         
         <td class="text-center">
          <a href='UpdateAdmin.jsp?u=<%=res.getString("AdminId")%>' class="btn btn-warning">Update</a>

           <a onclick="myFunction()" href='DeleteAdmin.jsp?u=<%=res.getString("AdminId")%>' class="btn btn-danger">Delete</a>
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