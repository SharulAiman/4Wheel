
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>4 WHEEL | ADMIN LOGIN PAGE</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
 <div class="container">
            <div class="regbox box">
                <img class="avatar" src="logo.jpg">
                <h1>Login Admin Account</h1>
<form action="AdminLoginServlet" method="post">

    IC Number :<input type="text" name="AdminId"> <br>
    <br>
    Password :<input type="password" name="AdminPassword"><br>
    <input type="submit" value="LoginAdmin">
    <br>${message}
 
     <a href="login.jsp">Login As User</a>
</form>

</body>

</html>