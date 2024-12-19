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

@WebServlet("/forget")
public class forget extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=req.getSession(false);
		
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		long phoneNo = Long.parseLong(phone);
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirm");
		PrintWriter out = resp.getWriter();
		
	 
		
		student s =(student)session.getAttribute("student");

		
		studentDAO sdo = new StudentDAOImpl();
		
		
		if(s!=null && email.equals(s.getEmail()) && phoneNo==s.getPhone() && password.equals(confirmPassword)) {
		
//		s.setEmail(email);
//		s.setPhone(phoneNo);
		s.setPassword(password);
		
		boolean result = sdo.updateStudentpassword(s);
		
		if(result) {
			 req.setAttribute("success","Password Reset Successfull");
			  RequestDispatcher rd= req.getRequestDispatcher("forget.jsp"); 
			   rd.forward(req, resp);
			   } 
			   else {
			    req.setAttribute("failure"," Password Reset failed");
			    RequestDispatcher rd= req.getRequestDispatcher("forget.jsp"); 
				rd.forward(req, resp);
			   } 
		}
		else {
			req.setAttribute("failure"," Password Or Data MissMatched ");
		    RequestDispatcher rd= req.getRequestDispatcher("forget.jsp"); 
			rd.forward(req, resp);
		}
	}

}