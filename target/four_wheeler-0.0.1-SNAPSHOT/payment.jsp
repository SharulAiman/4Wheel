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
      </header>
            <br>

            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">Payment Method</h3>
                    <hr>
		
					<form method="post" action="">

		<div>
			Payment Method<br> Debit Card
			<input type="radio" name="PaymentMethod" id="PaymentMethod" value="Debit_Card" onclick='myFunction("debit")' />
			 Online Bankin
			 <input type="radio"name="PaymentMethod" id="PaymentMethod" value="Online_Bankin" onclick="myFunction('bank')" /><br>
			<br>
		</div>
		<div id="Debit_Card" style="display: none">
			 Debit Card<br> <br> CardHolder's Name <br> 
			<input type="text" name="cardholdername" placeholder="Cardholder's name" /><br><br> 
			 Card Number <br> 
			<input type="number" name="cardNumber"placeholder="Card Number's"> <br><br>
			 End Date <br> 
			<input type="text" name="expiration" placeholder="mm/yy" /> <br> 
			<br> CVV <br>
			<input type="number" step=3 name="cvv" placeholder="CVV"><br>
			<br>
		</div>
		<div id="bank" style="display: none">
			Choose your bank <br>
			<select id="bankList" onChange="BankMethod('bankList')">
				<option value="Bank_Names" selected disabled>Bank Names</option>
				<option value="maybank">Maybank</option>
				<option value="cimb">cimb</option>
				<option value="bank_islam">Bank Islam</option>
				<option value="RHB">RHB</option>
			</select> <br><br>
		</div>
		<div id="LogBank" style="display: none">
				<a id="bankName"></a>'s Online banking<br> 
				<input type="text" name="PaymentId"placeholder="username" /> 
								
			</div>

		<div>
			Payment Date<br> <input type="date" name="PaymentDate" id="cal"><br>
		</div>
		<div>
			Customer Name<br> <input type="text"  name="CustName"  /><br>
		</div>
		<div>
			Card Name<br> <input type="text"  name="CardName"  /><br>
		</div>
		<div>
			Card Number<br> <input type="text"  name="CardNum"  /><br>
		</div>
		
		<input type="submit" value="Submit" name="submit">
	</form>   
	            </div>
</body>
</html>
<%
Integer a = null;
String b = request.getParameter("PaymentMethod");
String c = request.getParameter("PaymentDate");
String d = request.getParameter("CardName");
String e = request.getParameter("CardNum");
String f = request.getParameter("CustName");


String DB_DRIVER = "com.mysql.jdbc.Driver";
String DB_HOST = "jdbc:mysql://localhost/gss";
String DB_USER = "root";
String DB_PASSWORD = "";

Connection conn = null;
PreparedStatement stat = null;
Class.forName(DB_DRIVER).newInstance();
if( b!=null && c!=null && d!=null && e!=null && f!=null){
	conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	String data = "insert into payment(PaymentMethod,PaymentDate,CardName,CardNum,CustName) values(?,?,?,?,?)";
	stat = conn.prepareStatement(data);

	stat.setString(1,b);
	stat.setString(2,c);
	stat.setString(3,d);
	stat.setString(4,e);
	stat.setString(5,f);
	stat.executeUpdate();
	response.sendRedirect("printReceipt.jsp");
}
%>


