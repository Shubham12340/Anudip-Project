<%@page import="com.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>

<!-- Adding bootstrap 4 which will used on all pages -->
<%@include file="components/common_css_js.jsp"%>
<!-- Ending of Bootstrap -->


</head>

<body>
<!-- Adding navbar on home page -->
<%@include file="components/navbar.jsp"%>

<!--Adding  message on  body   -->
<%@include file="components/message.jsp" %>

<%@page import="com.mycart.dao.ProductDao"%>

<%@page import="java.util.List"%>

<%@page import="com.mycart.entities.Product"%>

<%@page import="com.mycart.dao.CategoryDao"%>

<%@page import="com.mycart.entities.Category"%>

<%@page import="com.mycart.helper.Helper"%>

<!-- container-fluid is used display content on center by covering  full screen by leaving little space from left and right -->
<div class="container-fluid">
<!-- First row of index page -->


<!-- mt is used to give margin from top and mx is give nargin from left -->
<div class="row mt-3 mx-2">
	
	<%
	//category will get the category id as 1,2,3,4 or all from url mapping
	//request.setAttribute("category", "all");
	String cat= request.getParameter("category");
	
	
	//out.println(cat);
	
	//creating object of PruductDao class and giving Factory
	ProductDao dao=new ProductDao(FactoryProvider.getFactory());
	
	
	
		//and store it into list variable of type Product(Generic)
		//list of type Product is declared as null now
		List<Product> list=null;
	
		
		//in this we are securing null exception and all products also
		if(cat==null ||cat.trim().equals("all")){
		//retrieving all data from product table through getAllProducts() method present in productDao 
		list=dao.getAllProducts();
		}else
		{
		int cid=Integer.parseInt(cat);
		list=dao.getAllProductsByCategoryId(cid);
		}
	
	//creating object of CategoryDao class and giving Factory
	CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
	
	//retrieving all data from category table through getCategories() method present in CategoryDao class
	//and store the data of Category Table into list variable clist of type Category(Generic)
	List<Category> clist= cdao.getCategories();
	
	
	%>
	
	
	<!-- Showing categories in first column in 2 grids -->
	<div class="col-md-2">
	<!-- Printing size of list i.e number of categories -->	
	<!--  <h1><% // =clist.size() %></h1> -->
	
	<!-- Printing category list wise using bootstrap List-group class -->
	<div class="list-group mt-4">
			
			<!-- Printing Active name i.e All Products -->
			<!-- Here in href we are setting category as all that means all products and passing value of key category as all  -->
			<a href="index.jsp?category=all" class="list-group-item list-group-item-action" onclick="this.style.backgroundColor='#212121' ">
			All Products
			</a>
	<!-- Traversing Products -->		
	<%
	//loop used to retrieve category one by one
	for(Category c:clist){
		
		//to product title
		//out.println(c.getCategoryTitle()+"<br>");
	%>
	<!-- Repeating anchor tag  using for loop i.e it will repeat until clist has items and will print all categories-->
	<!-- In href we are doing url mapping i.e  we are setting category id as 1,2,3,4 using setter method of category 
	and passing  the key value of category as 1,2,3,4 as per selection-->
	
	 <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action" onclick="this.style.backgroundColor='#212121'"><%=c.getCategoryTitle()%></a>
	
	<%
	}
	%>
	<!-- End of list-group div-->
	</div>
	<!-- End of first column -->
	</div>
	
	<!-- Showing products in second column in 8 grids -->
	<div class="col-md-10">	
		<!-- 
		<!-- List of products 
		<h1>Number of Products is <%//=list.size() %></h1>
		 -->
		<%/*
		for(Product p:list){
			
			//to print photo name
			out.println(p.getpPhoto()+"<br>");
			//to print product name
			out.println(p.getpName()+"<br><br>");
			}*/
		%>
		
		<!--First row of second column-->
		<div class="row mt-4">
			
			<!-- First column of first row having grid 12 -->
			<div class="col-md-12">
				<!-- card-columns is used to wrap column into card -->
				<div class="card-columns">
				
				<!-- Traversing Products -->
				<%
				for(Product p:list)
				{
				%>
				<!-- Showing Product in card structure which has product title,image and description -->
				<!-- Product Card -->
				<div class="card product-card">
					<div class="container text-center">
						<img src="img/products/<%=p.getpPhoto()%>"  class="card-img-top" >
					</div>
				
					<!-- Defining card Body -->
					<div class="card-body">
					
					
					
					<!--Giving Title to Product Card by extracting through setters-->
					<h4 class="card-title"><%=p.getpName() %></h4>
					
					<!-- Helper.get15Words will return 15 words from description after passing description as a Parameter ,
					this method present in Helper class -->
					<p class="text"><%=Helper.get15Words(p.getpDesc()) %></p>
					
					
					</div>
						<!-- Giving Add To Cart & price as a Button in card-footer -->
						<div class="card-footer text-center">
							<!-- Giving class name custom-bg to give background color -->
							<!-- giving function name add_to_cart on clicking the button Add To Cart  and passing product id,name,calculated price after subtracting discount to the function-->
							<button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId() %>, '<%= p.getpName() %>', <%= p.getPriceAfterApplyingDiscount() %>)">Add To Cart</button>
							
	<!-- Giving class name btn-outline-success is to give green color after hovering and this code is  used to give Rupee "&#8377;"-->
	<!-- btn-outline-success s used to give grey color -->						
	<button class="btn btn-outline-success"> &#8377;<%=p.getPriceAfterApplyingDiscount()%>/- <span class="discount-label" style="color:red; text-decoration: line-through;"> &#8377;<%=p.getpPrice()%>,</span> <span class="discount-label"> <%=p.getpDiscout()%>%</span>
	</button>
						<!-- End of card-footer-->
						</div>
				<!-- End of card -->		
				</div>	
				
				
				<%
				}
				//If the list is empty i.e particular category don't have any product then this will print 
				if(list.size()==0){
					out.println("<h3>No products in this category</h3>");
				}
				
				%>
				
				
				
				<!-- End of card-column class -->
				</div>
				
			<!-- end of first column-->	
			</div>
		
		<!-- End of first row of second column -->
		</div>
		
		
	<!-- End of 2nd  column -->
	</div>
	
	
</div>
</div>
<!-- Adding common modal to show cart on this page -->
<%@include file="components/common_modals.jsp"%>

</body>
</html>