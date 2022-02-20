<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html>
<head>
  <title>GSS MY Car Rental System</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #4CAF50">
			<div>
				<a href="index.jsp" class="navbar-brand"> GSS Car Rental </a>
			</div>
       	</nav>
    </header><br>

            <div class="row">

                <div class="container">
                    <h3 class="text-center">Add Admin</h3>
                    <hr>
					<form action="" method="post">


						<div class="form-group">
							<label>Admin Id</label>
							<input type="text" class="form-control" name="AdminId" required/>
					   </div>

						<div class="form-group">
							<label>Username</label>
							<input type="text" class="form-control" name="AdminUsername" required/>
					   </div>
					   
					   <div class="form-group">
							<label>Password</label>
							<input type="text" class="form-control" name="AdminPassword" required/>
					   </div>
					   
						<div class="form-group">
							<label>Email</label>
							<input type="text" class="form-control" name="AdminEmail" required/>
					   </div>
				   
				
                        <div style="text-align: center;">
                            <button type="submit" class="btn btn-primary">Add Admin</button>
                            <a href="listAdmin.jsp" class="btn btn-secondary">Back</a>
                        </div>

					</form>
            </div>
	</body>
</html>


<%
    String a =request.getParameter("AdminId");
    String b = request.getParameter("AdminUsername");
    String c = request.getParameter("AdminPassword");
    String d = request.getParameter("AdminEmail");

    String DB_DRIVER = "com.mysql.jdbc.Driver"; //Drivername
    String DB_HOST = "jdbc:mysql://localhost/gss"; //Edit DATABASE LINK DENGAN ORACLE FORMAT (jdbc:oracle:thin:@hostname:portnumber:databasename)
    String DB_USER = "root"; // Username Oracle
    String DB_PASSWORD = ""; //Password Oracle

        Connection conn = null;
        PreparedStatement stat = null;
        Class.forName(DB_DRIVER).newInstance();
        if(a!=null && b!=null && c!=null && d!=null)
        {

            conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);

            String data = "insert into ADMIN (AdminId,AdminUsername,AdminPassword,AdminEmail) values(?,?,?,?)";
            stat = conn.prepareStatement(data);

            stat.setString(1,a);
            stat.setString(2,b);
            stat.setString(3,c);
            stat.setString(4,d);

            stat.executeUpdate();
            response.sendRedirect("listAdmin.jsp"); //dashboard admin carlist
        }
%>


