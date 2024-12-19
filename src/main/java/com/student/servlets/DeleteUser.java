package com.student.servlets;

import java.io.IOException;
import java.net.http.HttpConnectTimeoutException;

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
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String id=req.getParameter("id"); 
	
	int sid=Integer.parseInt(id); 

	
	studentDAO sdao=new StudentDAOImpl(); 
	
	if(sid!=13) 
	{ 
	 boolean result=sdao.deleteStudent(sid); 
	if(result) 
	{ 
	req.setAttribute("success","Data deleted successfully"); 
	RequestDispatcher rd=req.getRequestDispatcher("ViewUser.jsp"); 
	rd.forward(req, resp); 
	} 
	else 
	{ 
	req.setAttribute("failure","Failed to delete the data"); 
	RequestDispatcher rd=req.getRequestDispatcher("ViewUser.jsp"); 
	rd.forward(req, resp); 
	} 
	} 
	else 
	{ 
	req.setAttribute("failure","Admin data cannot be deleted"); 
	RequestDispatcher rd=req.getRequestDispatcher("ViewUser.jsp"); 
	rd.forward(req, resp); 
	} 
	} 
	} 
