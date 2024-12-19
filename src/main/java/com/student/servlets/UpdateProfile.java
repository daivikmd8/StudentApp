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

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet{
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	   String name=req.getParameter("name");
		String phonenumber=req.getParameter("phone");
		long phone=Long.parseLong(phonenumber); 
		String email=req.getParameter("email");
		String branch=req.getParameter("branch"); 
		String location=req.getParameter("location"); 
		
		HttpSession session=req.getSession(false);
		
		
		PrintWriter out=resp.getWriter(); 
		
		//JDBC Implementation
		
		student s=(student)session.getAttribute("student");  
		studentDAO sdao=new StudentDAOImpl(); 
		if(s!=null) {
		
		s.setName(name);
		s.setPhone(phone);
		s.setEmail(email);
		s.setBranch(branch);
		s.setLocation(location);
		boolean result=sdao.updateStudentProfile(s);
		if(result) 
			 {  
				  req.setAttribute("success","Updated Successfull");
				  RequestDispatcher rd= req.getRequestDispatcher("UpdateProfile.jsp"); 
				   rd.forward(req, resp);
				   }
				   else {
				    req.setAttribute("failure","Update failed");
				    RequestDispatcher rd= req.getRequestDispatcher("UpdateProfile.jsp"); 
					rd.forward(req, resp);
				   } 
		}
		else {
		    req.setAttribute("failure","Update failed An error occured");
		    RequestDispatcher rd= req.getRequestDispatcher("UpdateProfile.jsp"); 
			rd.forward(req, resp);
		}
	}
   
}

