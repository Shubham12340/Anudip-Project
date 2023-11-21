package com.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();  
	    response.setContentType("text/html;charrset=UTF-8");
	    try {
		
	    //getting session
	    HttpSession httpSession= request.getSession();
		
	    //removing attribute to logout
	    httpSession.removeAttribute("current-user");
	    
	    
	    //Giving message after logged out
	    httpSession.setAttribute("message", "YOU HAVE BEEN LOGGED OUT FROM YOUR ACCOUNT!!!");
	    
	    //and redirecting to index.jsp after log out
	    response.sendRedirect("login.jsp");
	    
	    
	    
	    } catch (Exception e) {
	    	e.printStackTrace();
		}
		
	}
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
		
	}

}
