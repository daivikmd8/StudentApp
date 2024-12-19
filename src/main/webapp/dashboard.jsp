<%@page import="com.student.dto.student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style type="text/css">
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
        }
        /* Header Styling */
        header {
            background-color: #2f3b52;
            color: white;
            padding: 15px 30px;
            text-align: center;
        }
        header h1 {
            margin: 0;
            font-size: 24px;
        }
        /* Sidebar Styling */
        .sidebar {
            width: 200px;
            background-color: #2f3b52;
            color: white;
            position: fixed;
            height: 100%;
            top: 0;
            left: 0;
            padding-top: 50px;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 18px;
        }
        .sidebar a:hover {
            background-color: #575d6b;
        }

        /* Main Content Styling */
        .main-content {
            margin-left: 220px;
            padding: 20px;
        }
        .dashboard-greeting {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }
        .card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .card h3 {
            margin-top: 0;
        }
        .card p {
            font-size: 16px;
            color: #555;
        }
        /* Navigation Links */
        .logout-btn {
            background-color: #e74c3c;
            color: white;
            padding: 10px 15px;
            text-align: center;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            width: 61%;
            margin-top: 20px;
        }
        .logout-btn:hover {

            background-color: #c0392b;
        }
        .log-bn{
         background-color: #e74c3c;
            color: white;
            padding: 10px 15px;
            text-align: center;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            width: 10%;
            margin-left: 1350px;
        }
        .log-bn:hover{
        background-color: #c0392b;
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                position: relative;
                height: auto;
            }
            .main-content {
                margin-left: 0;
            }
            header h1 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>

<h1>Welcome to Your Dashboard</h1>           <form action="Logout">
          <input class="log-bn" type="submit" name="Logout" value="Logout">
          </form>
</header>
	<%student s=(student)session.getAttribute("student");%>
 
    <!-- Sidebar -->
    
    <div class="sidebar">
        <a href="#">Home</a>
         <a href="#">Settings</a>
        <a href="#">Notifications</a>
        <a href="#">Reports</a>
        <%if(s.getId()==13){ %>
        <a href="ViewUser.jsp" class="logout-btn">View Data</a>
        <%} %>
        <a href="UpdateProfile.jsp" class="logout-btn">Update Profile</a>
       
        <label><a href="forget.jsp" class="logout-btn">Reset Password</a></label>
    </div>

    <!-- Main Content -->

    <div class="main-content">
        <div class="dashboard-greeting">
            <p>Hello, <%=s.getName()%>! Welcome back to your dashboard.</p>
        </div>

        <div class="card">
            <h3>Quick Stats</h3>
            <table>
            	<thead>
            	<tr>
            		<th>ID</th>
            		<th>Name</th>
            		<th>Phone</th>
            		<th>MailID</th>
            		<th>Branch</th>
            		<th>Location</th>
            		</tr>
            	</thead>
            	<tbody>
            	<tr>
            		<td><%= s.getId() %> </td>
            		<td><%= s.getName() %> </td>
            		<td><%= s.getPhone() %> </td>
            		<td><%= s.getEmail() %> </td>
            		<td><%= s.getBranch() %> </td>
            		<td><%= s.getLocation() %> </td>
            		</tr>
            	</tbody>
            </table>
        </div>

        <div class="card">
            <h3>Recent Activities</h3>
        </div>
       <div class="card">
            <h3>Upcoming Tasks</h3>
        </div>
    </div>
</body>
</html>