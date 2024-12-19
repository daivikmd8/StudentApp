<%@page import="com.student.dto.student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pentagon Space Update Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            /* background-color: #f0f0f0; */
            background-color: #4a6b9c;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 40px auto;
            padding: 20px;
            /* background-color: #fff; */
            background-color: #D4EBF8;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="tel"],
        input[type="email"],
        input[type="password"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #336699;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: larger;
            font-weight: 700;
        }

        button:hover {
            background-color: #224466;
        }

        p {
            text-align: center;
            margin-top: 10px;
        }

        a {
            color: #336699;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
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
        <h1>Pentagon Space</h1>
        <h2>Application Form</h2>
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
        <form action="UpdateProfile" method="post">
            <label for="name">Enter your Name:</label>
            <input type="text" id="name" value="<%=s.getName() %>" name="name" required>

            <label for="phone">Enter the Phone Number:</label>
            <input type="tel" id="phone" value="<%=s.getPhone() %>" name="phone"  required>

            <label for="email">Enter the Mail ID:</label>
            <input type="email" id="email" value="<%=s.getEmail() %>" name="email"  required>

            <label for="branch">Enter the Branch:</label>
            <input type="text" id="branch" value="<%=s.getBranch() %>" name="branch"  required>

            <label for="location">Enter the Location:</label>
            <input type="text" id="location" value="<%=s.getLocation() %>" name="location"  required>

            <button type="submit" value="UpdateProfile">Update_Profile</button>
            <p>Want to Reset Passsword? <a href="forget.jsp">ResetPassword</a></p>
        </form>
    </div>
</body>
</html>