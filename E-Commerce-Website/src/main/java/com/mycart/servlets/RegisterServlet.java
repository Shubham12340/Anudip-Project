package com.mycart.servlets;

import java.io.IOException;
import java.io.PrintStream;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;

import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mycart.entities.User;
import com.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	   
    /**
     * @see HttpServlet#HttpServlet()
     */
   
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();  
	    response.setContentType("text/html;charrset=UTF-8");
		
		try {
			
		String userName = request.getParameter("user_name");
		
		String userEmail =request.getParameter("user_email");
		
		String userPassword =request.getParameter("user_password");
		
		String userPhone =request.getParameter("user_phone");
		
		String userAddress =request.getParameter("user_address");
		
		HttpSession httpSession2= request.getSession();
		
		
		
		//validations
		if(userName.isEmpty()){
		
		httpSession2.setAttribute("message", "Name field is blank!!!");
		response.sendRedirect("register.jsp"); 	 	
		return;
		}
		
		if(userPassword.length()<6){

		httpSession2.setAttribute("message", "Password should contain 6 characters or more!!!");
		response.sendRedirect("register.jsp"); 	 	
			
		return;
		}
		
		User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg" , userAddress, "normal");
		
		//getting factory object and storing it into a Session object
		Session hibernateSession=FactoryProvider.getFactory().openSession(); 
		
		//begin the transaction
		Transaction tx = hibernateSession.beginTransaction();
		
		int userId= (Integer) hibernateSession.save(user);
		
		tx.commit();
		hibernateSession.close();
		
		 //getting http session to display message after registration
		 HttpSession httpSession = request.getSession();
		 
		 //Message will show to user using seAttribute("Key","Value")
		 httpSession.setAttribute("message", "Registration Successful !!! User Id is: " +userId);
		
		 //Redirecting user to register.jsp after Successful Registration
		 response.sendRedirect("register.jsp");
		 return;
		
		
		}
		catch (Exception e) {
			e.printStackTrace();
			
			HttpSession httpSession1= request.getSession();
			
			httpSession1.setAttribute("message", "Mail Id is Already Used By Someone!!!");
			
			response.sendRedirect("register.jsp");
			return;
	
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
		processRequest(request,response);
	}

}
