package com.mycart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mycart.entities.Product;

import java.util.List;
public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	//In this we are passing product object p from ProductOperationServlet class
	public boolean saveProduct(Product product){
		boolean f=false;
		try {
			
			Session session=this.factory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(product);
			
			tx.commit();
			session.close();
			f=true;
			System.out.println("Product Added Sucessfully by savePoroduct method");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
	
	}
	//Getting all categories to home page i.e index.jsp
	//Get all products
	public List<Product> getAllProducts(){
		
		Session s=this.factory.openSession();
		
		//Getting all products i.e select * from product it will give table items as a list
		Query query=s.createQuery("from Product");
		
		//getting all categories in variable list
		List<Product> list=query.list();
		
		return list;
	}

	//Get all products of  given category id
	public List<Product> getAllProductsByCategoryId(int cid){
		
		Session s=this.factory.openSession();
		
		//Getting all products i.e select * from product it will give table items as a list
		//In query we are targeting category field of product table which is referencing categoryId of category table;  
		Query query=s.createQuery("from Product as p  where p.category.categoryId =: id");
		
		//in id value of cid get copied and passed to the  above query
		query.setParameter("id", cid);
		//getting all products according to the selected category and stored it in variable list
		List<Product> list=query.list();
		
		//And Finally returning list
		return list;
	}

		
	
}
