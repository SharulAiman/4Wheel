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
                    <h3 class="text-center">Add Car</h3>
                    <hr>
					<form action="" method="post">

					   <div class="form-group">
                        <label>Car Type</label><br>
                        <select class="form-control" name="CarType" id="cars" required focus>
                            <option value="" selected disabled hidden>Choose here</option>
                            <option value="Sedan">Sedan</option>
                            <option value="Coupe">Coupe</option>
                            <option value="Hatchback">Hatchback</option>
                          </select>
					   </div>

						<div class="form-group">
							<label>Car Name</label>
							<input type="text" class="form-control" name="CarName" required/>
					   </div>

					    <div class="form-group">
							<label>Car Brand</label>
							<select class="form-control" name="CarBrand" required>
                                <option value="" selected disabled hidden>Choose here</option>
                                <option value="Perodua">Perodua</option>
                                <option value="Proton">Proton</option>
                                <option value="Honda">Honda</option>
                                <input type="text" class="form-control" name="CarBrand" placeholder="Other"/>
                            </select>
					   </div>

					   <div class="form-group">
							<label>Car Rate (RM / Day)</label>
							<input type="text" class="form-control" name="CarRate" required />
					   </div>

					   <div class="form-group">
							<label>Car Plate No</label>
							<input type="text" class="form-control" name="CarPlateNo" required/>
					   </div>

					   <div class="form-group">
							<label>Passenger Quantity</label>
							<input type="text" class="form-control" name="CarPassengerQty" required/>
					   </div>

					   <div class="form-group">
							<label>Car Transmission</label>
							<select class="form-control" name="CarTransmission" id="cars"required>
                                <option value="" selected disabled hidden>Choose here</option>
                                <option value="Auto">Auto</option>
                                <option value="Manual">Manual</option>
                            </select>
					   </div>
					   
					   <div class="form-group">
							<label>Car Engine Capacity</label>
							<input type="text" class="form-control" name="CarEngineCapacity" required/>
					   </div>

                        <div style="text-align: center;">
                            <button type="submit" class="btn btn-primary">Add Car</button>
                            <a href="listCarAdmin.jsp" class="btn btn-secondary">Back</a>
                        </div>

					</form>
            </div>
	</body>
</html>


<%
    String a =request.getParameter("CarType");
    String b = request.getParameter("CarName");
    String c = request.getParameter("CarBrand");
    String d = request.getParameter("CarRate");
    String e = request.getParameter("CarPlateNo");
    String f = request.getParameter("CarPassengerQty");
    String g = request.getParameter("CarTransmission");
    String h = request.getParameter("CarEngineCapacity");


   String DB_DRIVER = "com.mysql.jdbc.Driver"; //Drivername
	String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_9e3eec1049bc61a"; //Edit DATABASE LINK DENGAN ORACLE FORMAT (jdbc:oracle:thin:@hostname:portnumber:databasename)
 String DB_USER = "b60aeb8a3d95c4"; // Username Oracle
	 String DB_PASSWORD = "13f26d04"; //Password Oracle
	

        Connection conn = null;
        PreparedStatement stat = null;
        Class.forName(DB_DRIVER).newInstance();
        if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null && h!=null )
        {

            conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);

            String data = "insert into CAR (CarType,CarName,CarBrand,CarRate,CarPlateNo,CarPassengerQty,CarTransmission,CarEngineCapacity) values(?,?,?,?,?,?,?,?)";
            stat = conn.prepareStatement(data);

            stat.setString(1,a);
            stat.setString(2,b);
            stat.setString(3,c);
            stat.setString(4,d);
            stat.setString(5,e);
            stat.setString(6,f);
            stat.setString(7,g);
            stat.setString(8,h);

            stat.executeUpdate();
            response.sendRedirect("listCarAdmin.jsp"); //dashboard admin carlist
        }
%>


