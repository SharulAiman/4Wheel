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
            <a href="index.jsp" class="navbar-brand"> GSS Car Rental </a>
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
       
       String DB_DRIVER = "com.mysql.jdbc.Driver";
       String DB_HOST = "jdbc:mysql://localhost/gss";
       String DB_USER = "root";
       String DB_PASSWORD = "";

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
       int u = Integer.parseInt(request.getParameter("u"));
       String data = "select * from car where CarId='"+u+"'";
       res = stat.executeQuery(data);
       while(res.next())
       {
       %>
            <input type="hidden" name="CarId" value='<%=res.getInt("CarId") %>'/>
            <div class="form-group">
                <label>Car Type</label><br>
                <select class="form-control" name="CarType" id="cars" >
                    <option value="" selected disabled hidden> <%=res.getString("CarType")%> </option>
                    <option value="Sedan">Sedan</option>
                    <option value="Coupe">Coupe</option>
                    <option value="Hatchback">Hatchback</option>
                    
                  </select>
            </div>

   			<div class="form-group">
     			<label>Car Name</label>
     			<input type="text" class="form-control" name="CarName" value='<%=res.getString("CarName") %>'/>
   			</div>

   			 <div class="form-group">
							<label>Car Brand</label>
							<select class="form-control" name="CarBrand" >
                                <option value="" selected disabled hidden> <%=res.getString("CarBrand")%></option>
                                <option value="Perodua">Perodua</option>
                                <option value="Proton">Proton</option>
                                <option value="Honda">Honda</option>
                                
                            </select>
			</div>

   			<div class="form-group">
							<label>Car Rate (RM / Day)</label>
							<input type="text" class="form-control" name="CarRate" value= '<%=res.getString("CarRate")%>'  />
			</div>

   			<div class="form-group">
     		<label>Car Plate No</label>
     		<textarea type="text" class="form-control" name="CarPlateNo" value='<%=res.getString("CarPlateNo") %>'/></textarea>
   			</div>

            <div class="form-group">
							<label>Car Passenger Quantity</label>
							<input type="text" class="form-control" name="CarPassengerQty" value='<%=res.getString("CarPassengerQty") %>' />
			</div>

            <div class="form-group">
							<label>Car Transmission</label>
							<select class="form-control" name="CarTransmission" id="cars">
                                <option value="" selected disabled hidden><%=res.getString("CarTransmission")%></option>
                                <option value="Auto">Auto</option>
                                <option value="Manual">Manual</option>
                                <input type="text" class="form-control" name="CarTransmission"/>
                            </select>
			</div>

            <div class="form-group">
							<label>Car Engine Capacity</label>
							<input type="text" class="form-control" name="CarEngineCapacity" value='<%=res.getString("CarEngineCapacity")%>' />
			</div>

   			<%
            }
   			%>

   			<button type="submit" class="btn btn-success">Update</button>
   			<a href="listCarAdmin.jsp" class="btn btn-warning">Back</a>
   			</form>
   			</div></div>
   			</body>
   			</html>
   			<%
   			String a = request.getParameter("CarId");
   			String b = request.getParameter("CarType");
   			String c = request.getParameter("CarName");
   			String d = request.getParameter("CarBrand");
   			String e = request.getParameter("CarRate");
   			String f = request.getParameter("CarPlateNo");
   			String g = request.getParameter("CarPassengerQty");
   			String h = request.getParameter("CarTransmission");
            String i = request.getParameter("CarEngineCapacity");
   			if(b!=null && c!=null && d!=null && e!=null && f!=null && g!=null && h!=null && i!=null){
   				String query = "update car set CarType=?, CarName=?, CarBrand=?, CarRate=?, CarPassengerQty=?, CarTransmission=?, CarEngineCapacity=? where CarId='"+u+"'";
   				stmt = conn.prepareStatement(query);
   		
   				stmt.setString(1,b);
   				stmt.setString(2,c);
   				stmt.setString(3,d);
   				stmt.setString(4,e);
   				stmt.setString(5,f);
                stmt.setString(6,g);
                stmt.setString(7,h);
                stmt.setString(8,i);
                
   				
   				stmt.executeUpdate();
   				response.sendRedirect("listCarAdmin.jsp");
   			}
   			%>
   			
   			
       
       
       
