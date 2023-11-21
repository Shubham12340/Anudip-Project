package com.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycart.dao.UserDao;
import com.mycart.entities.User;
import com.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();  
	    response.setContentType("text/html;charrset=UTF-8");
	    try {
			//getting email and password from login form
	    	String email= request.getParameter("email");
	    	String password= request.getParameter("password");
	    	
	    	//doing validations 
	    	
	    	HttpSession httpSession= request.getSession();
    		
	    	
	    	if(email==null || "".equals(email) || password==null || "".equals(password))
	    	{
	    		
	    		httpSession.setAttribute("message", "Email Or Password Can't blank");
	    		
	    		response.sendRedirect("login.jsp");
	    		return;
	    	}
	    	
	    	//Authentication
	    	
	    	//Giving Session factory to UserDao object
	    	UserDao userDao = new UserDao(FactoryProvider.getFactory());
	    	 
	    	//returning user to the User object using method defined in UserDao class
	    	User user= userDao.getUserByEmailAndPassword(email, password);
	    		
	    	//System.out.println(user);
	    	
	    	//if user is present then welcome message is print if user is not present in database then Invalid Details will print
	    	if(user==null){
	    		httpSession.setAttribute("message", "Invalid Details Try with Another one!!!");
	    		response.sendRedirect("login.jsp");
	    		return;
	    	}
	    	else{
	    		out.println("<h1> Welcome " +user.getUserName()+ "</h1>");
	    		
	    		//login
	    		httpSession.setAttribute("current-user", user);
	    		
	    		if(user.getUserType().equals("admin")){
	    			
	    			//admin.jsp will call after admin has logged in
	    			
	    			httpSession.setAttribute("message", "WELCOME ADMIN, YOU CAN SEE DYNAMIC COUNT OF USERS,PRODUCTS AND CATEGORIES");
		    		response.sendRedirect("admin.jsp");
	    		} else if(user.getUserType().equals("normal")){
	    			
	    			//index.jsp will call after after normal has logged in
		    		
	    			
		    		response.sendRedirect("index.jsp");
		    		httpSession.setAttribute("message", "WELCOME, YOU HAVE BEEN SUCCESFULLY LOGGED IN!");
		    		
	    		}else {
	    			out.println("We have not identified user type");
	    		}
	    		
	    		//normal.jsp will call after after normal has logged in
	    	}
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
