<%@page import="com.student.dao.StudentDAOImpl"%>
<%@page import="com.student.dao.studentDAO"%>
<%@page import="com.student.dto.student"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.student.dto.student"%>
<%@page import="com.student.dao.studentDAO"%>
<%@page import="com.student.dao.StudentDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initialscale=1.0"> 
<title>View Data</title> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"> 
</head>
<body>
<%student s = (student)session.getAttribute("student");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> 
<div class="container-fluid"> 
<a class="navbar-brand" href="#">Welcome Admin <%=s.getName() %></a> 
<button class="navbar-toggler" type="button" data-bstoggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"> 
        <span class="navbar-toggler-icon"></span> 
      </button> 
      <div class="collapse navbar-collapse" id="navbarNav"> 
        <ul class="navbar-nav ms-auto"> 
        
       
          <li class="nav-item"> 
            <a class="nav-link" href="forget.jsp">Reset Password</a> 
          </li> 
          <li class="nav-item"> 
            <a class="nav-link" href="updateAccount.jsp">Update Data</a> 
          </li> 
          <li class="nav-item"> 
            <a class="btn btn-danger" href="Logout">Logout</a> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </nav> 
 
 
  <div class="container mt-4"> 
    <h1 class="text-center mb-4">Dashboard</h1> 
</div> 
<!-- User Section --> 
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
    <div class="row"> 
      <div class="col-md-12"> 
        <h3>Customer Data</h3> 
        <table class="table table-hover"> 
          <thead> 
            <tr> 
              <th>Id</th> 
              <th>Name</th> 
              <th>Phone</th> 
              <th>Mail ID</th> 
              <th>Branch</th> 
          <th>Location</th>
           
            </tr> 
          </thead> 
          <tbody> 
          
          <%studentDAO sdao=new StudentDAOImpl(); %>
          <%List<student> students=sdao.getStudent(); %>
          <%Iterator<student> itr=students.iterator(); %>
          <%while(itr.hasNext()){ %>
          <%student ss=itr.next(); %>
          
          	<tr>
          	<td><%=ss.getId() %></td>
          	<td><%=ss.getName() %></td>
          	<td><%=ss.getPhone() %></td>
          	<td><%=ss.getEmail() %></td>
          	<td><%=ss.getBranch() %></td>
          	<td><%=ss.getLocation() %></td>
          	 <td>
                        <form action="DeleteUser" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= ss.getId() %>">
                            <button type="submit" class="btn btn-danger btn-sm" value="Delete">Delete</button>
                        </form>
                    </td>
          </tr>
          	<%} %>
         </tbody> 
        </table> 
</div> 
</div> 
</body>
</html>