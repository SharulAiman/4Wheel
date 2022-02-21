<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>4 WHEEL | REGISTER ACCOUNT</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="regbox box"  style="top:75%;height:800px"
          >
                <img class="avatar" src="logo.jpg">
                <h1>
Register Account</h1>
<form action="registerServlet" method="post">
                   <p>
IC Number</p>
<input type="text" placeholder="IC Number" name="CustIc" required>
                   <p>
Name</p>
<input type="text" placeholder="Username" name="CustName" required>
                   <p>
Phone Number</p>
<input type="text" placeholder="Phone Number" name="CustPhoneNum" required>
                   <p>
Email</p>
<input type="text" placeholder="Useremail" name="CustEmail" required>
                   <p>
Address</p>
<input type="text" placeholder="Address" name="CustAddress" required>
                   <p>
                   
Postcode</p>
<input type="text" placeholder="Postcode" name="CustPostcode" required>
                   <p>
City</p>
<input type="text" placeholder="City" name="CustCity" required>
                   <p>
Password</p>
<input type="password" placeholder="Password" name="CustPassword" required>
                   <input type="submit" value="Register">
                   <a href="index.jsp">Already have Account?</a>
                </form>
</div>
</div>
</body>
</html>






