package com.mycart.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mycart.dao.CategoryDao;
import com.mycart.dao.ProductDao;
import com.mycart.dao.UserDao;
import com.mycart.entities.Category;
import com.mycart.entities.Product;
import com.mycart.entities.User;
import com.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */

//@MultipartConfig this annotation enables our form to accept files i.e mutipartconfig, it enables to store image in our form
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();  
	    response.setContentType("text/html;charrset=UTF-8");

	    try {
			
	    		//operation comes from admin that returns value either as "addcategory" or "addproduct"
	    		String op = request.getParameter("operation");
	    		
	    		//if we get op==addcategory then we perform add category operation
	    		if(op.trim().equals("addcategory")){
	    	
	    			//add category
	    			String title=request.getParameter("catTitle");
		    		
		    		String 	description=request.getParameter("catDescription");
		    		
		    		//Creating object of category class to set values in properties
		    		Category category = new Category();
		    		
		    		category.setCategoryTitle(title);
		    		category.setCategoryDescription(description);
	    			
		    		//Saving category data in Database
		    		
		    		//getting factory from helper class i.e FactoryProvider and creating object of CategoryDao class
		    		CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
		    		
		    		//saving data into DB using catrgoryDao object and passing object as category 
		    		//to saveCateory Method present in CatrgoryDao class
		    		//it will return id which we have stored in catId variable
		    		
		    		//passing object category to saveCategory method to perform transaction
		    		int catId= categoryDao.saveCategory(category);
		    		
		    		//out.println("Catrogy Saved");
		    		
		    		
		    		HttpSession httpSession = request.getSession();
		    		
		    		//Printing message after category added
		    		httpSession.setAttribute("message", "Category Added Successfully, Catgroy Id is: " +catId);
		    		response.sendRedirect("admin.jsp");
		    		return;
		    	
		    		
	    		}
	    		//if we get op==addproduct then we perform add product operation
	    		else if(op.trim().equals("addproduct")){
	    			
	    		//add product
	    			
	    		//work 
	    		//Fetching data from add Product form
	    		String pName = request.getParameter("pName");
	    		
	    		String pDesc = request.getParameter("pDesc");
	    		
	    		//parseInt will convert the value into integer
	    		int pPrice= Integer.parseInt(request.getParameter("pPrice"));
	    		
	    		int pDiscount= Integer.parseInt(request.getParameter("pDiscount"));
	    		
	    		int pQuantity= Integer.parseInt(request.getParameter("pQuantity"));
	    		
	    		//Getting catId from admin page i.e <select name="catId" class="form-control" id="">
	    		//and passing this catId to getCategoryById() method of CategoryDao class
	    		int catId= Integer.parseInt(request.getParameter("catId"));
	    		
	    		Part part= request.getPart("pPic");
	    		
	    		//storing image name in variable fileName and this method extractFileName is present below
	    		String fileName = extractFileName(part);
	    		
	    		System.out.println(fileName);
	    			
	    		//String fileName = part.getSubmittedFileName();
	    		//the above method is present in java EE 8 with Tomacat 7 and version of servlet greater than 3.0
	    		
	    		
	    		//request.getPart(fileName);
	    
	    		Product p= new Product();
	    		//setting values to all the properties
	    		p.setpName(pName);
	    		p.setpDesc(pDesc);
	    		p.setpPrice(pPrice);
	    		p.setpDiscout(pDiscount);
	    		p.setpQuantity(pQuantity);
	    		p.setpPhoto(fileName);
	    		
	    		
	    		//get category by ID
	    		CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
	    		
	    		//Passing catId to getCategoryById method which returns category from Category Table
	    		//For e.g if we pass catId as 1 i.e if we choose from dropdown category as laptop
	    		//then it will return category of Laptop(having categoryId as 1) from Category table and stored it into Product table
	    		//as categoryId as 1
	    		Category category = cdao.getCategoryById(catId);
	    		
	    		//We saved the category and in Category object
	    		//And setting the category object in Category property of product table
	    		p.setCategory(category);
	    		
	    		
	    		//product should be save
	    		
	    		//Creating object of ProductDao class to call it's method
	    		ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
	    		
	    		//calling the method and passing object to the method
	    		pdao.saveProduct(p);
	    		//out.println("Product Saved Sucessfully!!!");
	    		
	    		//Uploading Pic
	    		//finding path to upload photo
	    		//seperator is used to add \ with the help of getRealPath we reach till img folder but with separator 
	    		// we reach exactly the folder where we want to upload images
	    		//here we are finding path to our photo
	    		String path=request.getRealPath("img")+ File.separator + "products" + File.separator+ extractFileName(part);
	    		
	    		//String path= request.getRealPath("products_images")+ File.separator+ extractFileName(part);
	    		System.out.println(path);
	    		
	    		
	    		//code of uploading image into DB
	    		
	    		//Try catch block is used to print error on console if any issue happens during uploading
	    		
				 //The fos will redirect on the above path
	    		FileOutputStream fos= new FileOutputStream(path);
	    		
	    		//reading data from InputDtream i.e file present in part i.e photo is coming from is
	    		InputStream is= part.getInputStream();
	    		
	    		//reading data from InputStream
	    		byte[] data= new byte[is.available()];
	    		
	    		//reading data from InputStream i.e reading photo
	    		is.read();
	    		
	    		//Writing data from InputStream i.e content of photo is present in data and we are writing it in fos  
	    		fos.write(data);
	    		
	    		
	    		is.close();
	    		fos.close();
	    		
	    	
	    		HttpSession httpSession = request.getSession();
	    		
	    		//Printing message after Product added
	    		httpSession.setAttribute("message", "Product is  Added Successfully!!!");
	    		response.sendRedirect("admin.jsp");
	    		return;
	    	
	    		}
	    
	    } catch (Exception e) {
			e.printStackTrace();
		
		}
	}
	
	private String extractFileName(Part part) {
		
		String contentDisp = part.getHeader("content-disposition");
	    String[] items = contentDisp.split(";");
	    for (String s : items) {
	        if (s.trim().startsWith("filename")) {
	            return s.substring(s.indexOf("=") + 2, s.length()-1);
	        }
	    }
		return "";
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
