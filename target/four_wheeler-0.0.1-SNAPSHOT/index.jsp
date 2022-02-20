
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>4 WHEEL | LOGIN PAGE</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
 <div class="container">
            <div class="regbox box">
                <img class="avatar" src="logo.jpg">
                <h1>Login Account</h1>
<form action="loginServlet" method="post">

    IC Number :<input type="text" name="CustIc"> <br>
    <br>
    Password :<input type="password" name="CustPassword"><br>
    <input type="submit" value="Login">
    <br>${message}
     <a href="register.jsp">Does not have Account?</a>
     <br>
     <a href="login2.jsp">Login As Admin</a>
</form>

</body>

</html>