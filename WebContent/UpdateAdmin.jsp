<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>GSS Car Rental</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #4CAF50">
         <div>
            <a href="adminMenu.jsp" class="navbar-brand"> GSS Car Rental </a>
          </div>
         </nav>
      </header>
            <br>
			<div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">View Admin Details</h3>
                    <hr>
       <%
       
       String DB_DRIVER = "com.mysql.jdbc.Driver"; //Drivername
   	String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_9e3eec1049bc61a"; //Edit DATABASE LINK DENGAN ORACLE FORMAT (jdbc:oracle:thin:@hostname:portnumber:databasename)
    String DB_USER = "b60aeb8a3d95c4"; // Username Oracle
   	 String DB_PASSWORD = "13f26d04"; //Password Oracle

       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       PreparedStatement stmt = null;
       Class.forName(DB_DRIVER).newInstance();
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       %>
       <form action="" method="post">
       <%
       stat = conn.createStatement();
       String u = request.getParameter("u");
       String data = "select * from admin where AdminId='"+u+"'";
       res = stat.executeQuery(data);
       while(res.next())
       {
       %>
            

   			<div class="form-group">
     			<label>Admin Id</label>
     			<input type="text" class="form-control" name="AdminId" value='<%=res.getString("AdminId") %>'/>
   			</div>
   			
   			<div class="form-group">
     			<label>Username</label>
     			<input type="text" class="form-control" name="AdminUsername" value='<%=res.getString("AdminUsername") %>'/>
   			</div>
   			
   			<div class="form-group">
     			<label>Password</label>
     			<input type="text" class="form-control" name="AdminPassword" value='<%=res.getString("AdminPassword") %>'/>
   			</div>
   			
   			<div class="form-group">
     			<label>Email</label>
     			<input type="text" class="form-control" name="AdminEmail" value='<%=res.getString("AdminEmail") %>'/>
   			</div>
   			
   			<%
            }
   			%>

   			<button type="submit" class="btn btn-success">Update</button>
   			<a href="listAdmin.jsp" class="btn btn-warning">Back</a>
   			</form>
   			</div></div>
   			</body>
   			</html>
   			<%
   			String a = request.getParameter("AdminId");
   			String b = request.getParameter("AdminUsername");
   			String c = request.getParameter("AdminPassword");
   			String d = request.getParameter("AdminEmail");
   			if(a!=null && b!=null && c!=null && d!=null){
   				String query = "update admin set AdminId=?, AdminUsername=?, AdminPassword=?, AdminEmail=? where AdminId='"+u+"'";
   				stmt = conn.prepareStatement(query);
   		
   				stmt.setString(1,a);
   				stmt.setString(2,b);
   				stmt.setString(3,c);
   				stmt.setString(4,d);

   				
   				stmt.executeUpdate();
   				response.sendRedirect("listAdmin.jsp");
   			}
   			%>
   			
   			
       
       
       
