package com.student.servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/Logout")
public class Logout extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	
	String log=req.getParameter("Logout"); 
	HttpSession s=req.getSession(false); 
	while(log.equals("Logout")) 
	{ 
	s.invalidate(); 
	req.setAttribute("success","Logged out successfully"); 
	RequestDispatcher rd=req.getRequestDispatcher("login.jsp");  
	rd.forward(req, resp); 
	} 
	} 
	}
