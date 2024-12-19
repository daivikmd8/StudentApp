<%@page import="com.student.dto.student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
<style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #00bfff; /* Pentagon blue */
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 300px;
        }
        h1 {
            margin-bottom: 20px;
            color: #00bfff;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="email"],input[type="tel"], input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #00bfff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .back-to-login {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #00bfff;
        }
        .failure{
        background-color: #00bfff;
            color: red;
            border: none;
            padding: 10px 10px;
            border-radius: 5px;
        }
        .success{
        background-color: #00bfff;
            color: Green;
            border: none;
            padding: 10px 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Reset Password</h1>
        <center>
        <%student s=(student)session.getAttribute("student"); %>
        
        <%String success=(String)request.getAttribute("success");
        if(success!=null){%>
        <h3 class="success"><%=success%></h3>
        <%} %>
        
        <%String failure=(String)request.getAttribute("failure");
        if(failure!=null){%>
        <h3 class="failure"><%=failure%></h3>
        <%} %>
        </center>
        <form action="forget" method="post">
            <label for="email">Enter your email ID:</label>
            <input type="email" id="email" name="email" value="<%=s.getEmail() %>" required>
            
            <label for="phone">Enter the Phone Number:</label>
            <input type="tel" id="phone" name="phone" value="<%=s.getPhone() %>" required>

            <label for="new_password">Enter new password:</label>
            <input type="password" id="new_password" name="password"  required>

            <label for="confirm_password">Confirm new password:</label>
            <input type="password" id="confirm_password" name="confirm"   required>

            <input type="submit" value="Reset Password">
        </form>
       <a href="login.html" class="back-to-login">Back to Login</a>
    </div>
</body>
</html>