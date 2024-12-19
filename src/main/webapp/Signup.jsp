<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pentagon Space Signup</title>
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
        <%String success=(String)request.getAttribute("success");
        if(success!=null){%>
        <h3 class="success"><%=success%></h3>
        <%} %>
        
        <%String failure=(String)request.getAttribute("failure");
        if(failure!=null){%>
        <h3 class="failure"><%=failure%></h3>
        <%} %>
       </center>
        <form action="signup" method="post">
            <label for="name">Enter your Name:</label>
            <input type="text" id="name" name="name" placeholder="Username" required>

            <label for="phone">Enter the Phone Number:</label>
            <input type="tel" id="phone" name="phone" placeholder="Phone" required>

            <label for="email">Enter the Mail ID:</label>
            <input type="email" id="email" name="email" placeholder="Email" required>

            <label for="branch">Enter the Branch:</label>
            <input type="text" id="branch" name="branch" placeholder="Branch" required>

            <label for="location">Enter the Location:</label>
            <input type="text" id="location" name="location" placeholder="Location" required>

            <label for="password">Enter the password:</label>
            <input type="password" id="password" name="password" placeholder="Password" required>

            <label for="confirm-password">Confirm the password:</label>
            <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm_Password" required>

            <button type="submit">SignUp</button>
            <p>Already have an account? <a href="login.jsp">Login</a></p>
        </form>
    </div>
</body>
</html>