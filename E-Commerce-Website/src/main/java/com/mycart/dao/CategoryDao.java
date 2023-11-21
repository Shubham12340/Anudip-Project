package com.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mycart.entities.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	///it saves the category to DB
	public int saveCategory(Category cat){
		
		//Opening session object using factory object and stored it into Session object session
		Session session= this.factory.openSession();
		
		//Begin transaction using session object and stored it into tx variable
		Transaction tx=session.beginTransaction();
		
		//saving cat object and storing it's id into catId varibale returning it
		int catId= (Integer)session.save(cat);
		
		tx.commit();
		session.close();
		
		return catId;
	}
	
	//it will return all categories
	public List<Category> getCategories(){
		
		
		//Opening session object using factory object and stored it into Session object s
		Session s= this.factory.openSession();
		
		//from category will give all categories and stored result into variable query
		//this query is "Select * from category;"
		Query query=s.createQuery("from Category");
		
		//storing list returned from query variable query into list object
		List<Category> list= query.list();
		
		return list;
	
	}
	
	//It will return a single category
	public Category getCategoryById(int cid){
		Category cat=null;
		try {
			Session session =this.factory.openSession();
			//Passing class literal as Category.class and passing cid to fetch the Category with the help of hibernate
			
			//here we give catId on type integer from ProductOperationServlet and it will return the corresponding category from DB
			//And we will save the corresponding category ino variable cat and finall we will return it
			cat=session.get(Category.class, cid);
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return cat;
		
	}
	
	
}
