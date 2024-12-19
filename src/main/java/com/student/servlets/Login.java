package com.student.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.student.dao.StudentDAOImpl;
import com.student.dao.studentDAO;
import com.student.dto.student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet{

 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	
	
	HttpSession session=req.getSession();
	
	PrintWriter out=resp.getWriter();
	student s=new student();
	
	String email =req.getParameter("email");
	String password =req.getParameter("password");

	
	studentDAO sdao=new StudentDAOImpl();
	
	s.setEmail(email);
	s.setPassword(password);
	
	s=sdao.getStudent(email, password);
	
	if(s!=null) {
		 session.setAttribute("student",s);
		  RequestDispatcher rd= req.getRequestDispatcher("dashboard.jsp"); 
		   rd.forward(req, resp);
		   }
		   else {
		    req.setAttribute("failure","login failed");
		    RequestDispatcher rd= req.getRequestDispatcher("login.jsp"); 
			rd.forward(req, resp);
		   } 
     }
}