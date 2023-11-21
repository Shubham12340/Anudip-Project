package com.mycart.helper;


import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {

	//this method will return 10 words of description
	public static String get15Words(String desc){
		
			//this string will count words as soon as space get encountered
			String[] strs = desc.split(" ");
		
		if(strs.length>15){
			
			String res="";
			//this for loop will traverse 15 words of strs and will add those 15 words in res and return res with three dots
			for(int i=0;i<15;i++)
			{
				
				//extra empty " " string is added to give space otherwise description will get printed without space 
				res= res+ strs[i]+" ";
			}
			
			return (res+"...");
		}
		//if the description contains less than 15 word then it will print as it is with three dots
		else{
			return (desc+"...");
			}
		
		}
	//this function gives number of users and number of products
	public static Map<String,Long> getCounts(SessionFactory factory){
		//opening session and storing it into Session varibale
		Session session=factory.openSession();
	
		//HQL query to count rows from user
		String q1= "Select count(*) from User";
		
		//HQL query to count rows from product
		String q2= "Select count(*) from Product";
		
		//creating query through session and storing it into variable
		Query  query1=session.createQuery(q1);
		//creating query through session and storing it into variable
		Query query2=session.createQuery(q2);
		
		//firing query
		
		//this will return count and storing it into Long variable
		Long userCount=(Long) query1.list().get(0);
		
		Long productCount=(Long) query2.list().get(0);
		
		Map<String,Long> map= new HashMap<String,Long>();
		
		map.put("userCount", userCount);
		map.put("productCount", productCount);
		
		
		//closing session
		session.close();
		
		//since map contains user and product count we retun map here
		return map;
		
	}
}
