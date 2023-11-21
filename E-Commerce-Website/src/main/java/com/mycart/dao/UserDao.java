package com.mycart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.mycart.entities.User;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	//get user by email and password
	//when We have email and password we call this function "getUserByEmialAndPassword(String email, String password)" 
	//and if returns user record using  query as "select * from user where userEmail =: e and userPassword =: p";
	//then user it authenticated and present in the database
	//and if returns null that means user is not authenticated and not present in our DB	
	public User getUserByEmailAndPassword(String email, String password){
		User user = null;
		
		try {
			
			String query = "from User where userEmail =: e and userPassword =: p";
			
			Session session= this.factory.openSession();
			
			Query q = session.createQuery(query);
			
			//setting email value from constructor into e object
			q.setParameter("e", email);
			
			
			//setting password value from constructor into p object
			q.setParameter("p", password);
			
			
			//to get single result into User object
			user= (User) q.uniqueResult();
			
			
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	
}
