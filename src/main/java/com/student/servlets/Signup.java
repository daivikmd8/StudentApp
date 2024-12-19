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

@WebServlet("/signup")
 public class Signup extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		String phonenumber=req.getParameter("phone");
		String email=req.getParameter("email");
		String branch=req.getParameter("branch"); 
		String location=req.getParameter("location"); 
		String password=req.getParameter("password"); 
		String confirmPassword=req.getParameter("confirm-password"); 
		
		//converting the necessary datatypes
		
		 long phone=Long.parseLong(phonenumber); 
		PrintWriter out=resp.getWriter(); 
		
		//JDBC Implementation
		
		student s=new student();  
		studentDAO sdao=new StudentDAOImpl(); 
		if(password.equals(confirmPassword))  
		  { 
			   s.setName(name); 
			   s.setPhone(phone); 
			   s.setEmail(email); 
			   s.setBranch(branch); 
			   s.setLocation(location); 
			   s.setPassword(password); 
			   boolean result=sdao.insertStudent(s); 
			   if(result) 
			   {  
			  req.setAttribute("success","SignUp Successfull");
			  RequestDispatcher rd= req.getRequestDispatcher("Signup.jsp"); 
			   rd.forward(req, resp);
			   }
		  }
			   else {
			    req.setAttribute("failure","SignUp failed");
			    RequestDispatcher rd= req.getRequestDispatcher("Signup.jsp"); 
				rd.forward(req, resp);
			   } 
		  }  
	} 
		 