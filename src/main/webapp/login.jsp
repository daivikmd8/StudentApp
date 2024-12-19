<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pentagon Space Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #89A8B2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 100px auto;
            padding: 20px;
            background-color: #D4EBF8;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            color: #1e4267;
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

        input[type="email"],
        input[type="password"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        #forgot {
            margin-bottom: 10px;
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
        <h2>Login</h2>
         <center>
        <%String success=(String)request.getAttribute("success");
        if(success!=null){%>
        <h3 class="success"><%=success%></h3>
        <%} %>
        
        <%String failure=(String)request.getAttribute("failure");
        if(failure!=null){%>
        <h3 class="failure"><%=failure%></h3>
        <%} %>
        </center>
        <form action="login" method = "post">
            <label for="email">Enter your mail ID:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Enter the password:</label>
            <input type="password" id="password" name="password" required>
            
            <from action="Logout" method="post">
            

            <a href="forget.jsp" id="forget">forgotPassword?</a>
             </br>
            <button type="submit">Login</button>
            <p>Don't have an account? <a href="Signup.jsp">Signup</a></p>
        </form>
    </div>
</body>
</html>