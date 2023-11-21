
<!-- 
1. This java code is used to protect the admin page from accessing it without login 
   and simply change the URL by manually typing admin.jsp.

2. If normal person is logged in and change the URL manually and try to access the admin page then protect him.    
 
3. If the user(admin / normal) is login  then in key "current-user" there will be some value as normal or admin 
   and if nobody is logged in then it contains null

4. If current-user contains some value as admin or normal that means somebody is logged in and if contains null that nobody 
   is logged in

-->

<%@page import="com.mycart.helper.FactoryProvider"%>
<%@page import="com.mycart.entities.User"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import ="java.util.List"%>
<%@page import ="com.mycart.entities.Category"%>
<%@page import = "com.mycart.helper.Helper" %>
<%@page import ="java.util.Map"%>


<%
	//putting current-user in user object
	User user = (User) session.getAttribute("current-user");

	//this condition is used to protect when nobody is logged in neither admin nor normal user	
	if (user == null) {

		session.setAttribute("message", "You are not logged in, Login First!!!");
		response.sendRedirect("login.jsp");

		return;
	}

	//we will come in else part that means someone is logged in, some value is present in key current-value
	//And we will check which kind of user is logged in whether he is admin or normal user
	//If normal user is logged in and trying to access admin page then block him by giving message
	//And If admin is logged in then allow him to acess the admon page
	else {

		//If normal user is logged in and trying to access admin page then block him by giving message
		if (user.getUserType().equals("normal")) {

			session.setAttribute("message",
					"You do not have priviledges to access admin page, Do not access this page!!!");
			response.sendRedirect("login.jsp");

			return;
		}

	}
	//If not an If condition works and else part work that means the logged in person is a admin allow hoim to access the page
%>

<!-- This tag is used to count categories -->
<%
					
					//getting count of category
					CategoryDao categoryDao1= new CategoryDao(FactoryProvider.getFactory());
					
					//calling getCategories method from categoryDao class
					
					List<Category> list1= categoryDao1.getCategories();
					
					//getting count of users and products
					Map<String,Long> m =Helper.getCounts(FactoryProvider.getFactory());
										
%>
					
					
					
					
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>

<!-- Adding bootstrap 4 and style.css through common_css_js.jsp file which will used on all pages -->
<%@include file="components/common_css_js.jsp"%>
<!-- Ending of Bootstrap -->



</head>
<body>
	<!-- Adding navbar on admin page -->
	<%@include file="components/navbar.jsp"%>


	<!-- Creating Admin Page -->

	<!-- Container is used to left some space from left and right  -->
	<div class="container admin">
	
		<!-- Printing message above the row -->
		<div class="container-fluid mt-4">
		<%@include file="components/message.jsp" %>
		</div>
		
		<!-- This row will get 12 units of GRID-->
		<div class="row mt-4">
		

			<!-- This is used to give 4 GRID to 1st column from 12 GRID i.e box of Users -->
			<div class="col-md-4">

				<!--Card is nothing but a BOX -->
				<!-- This is 1st box -->
				<div class="card">

					<div class="card-body text-center">

						<div class="container">
							<img class="img-fluid" src="img/Users.png" alt="Users_icon" />
						</div>
						<!-- Dynamic count of users -->
						<h1><%=m.get("userCount") %></h1>
						<h1 class="text-uppercase text-muted">Users</h1>

						<!-- End of 1st BOX -->
					</div>

					<!-- End of 1st column -->
				</div>
			</div>


			<!-- This is used to give 4 GRID to 2nd column from 12 GRID i.e box of Categories -->
			<div class="col-md-4">

				<!-- This is 2nd box -->
				<div class="card">

					<!-- This is 1st box -->
					<div class="card-body text-center">


						<div class="container">
							<img class="img-fluid" src="img/Categories.png"
								alt="Categories_icon" />
						</div>

						<!-- Dynamic count of categories -->
						<h1><%=list1.size() %></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>

					</div>

					<!-- End of 2nd BOX -->
				</div>

				<!-- End of 2nd column-->
			</div>



			<!-- This is used to give 4 GRID to 3rd column from 12 GRID i.e box of Products -->
			<div class="col-md-4">

				<!-- This is 3rd box -->
				<div class="card">

					<div class="card-body text-center">

						<div class="container">
							<img class="img-fluid" src="img/Products.png" alt="Products_icon" />
						</div>

						<!-- Dynamic count of products -->
						<h1><%=m.get("productCount") %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>

					</div>

					<!-- End of 3rd BOX -->
				</div>

				<!-- End of 3rd column -->
			</div>
			<!-- End of first row -->
		</div>

		<!-- second row-->
		<div class="row mt-2">
			<!-- 1st Column -->
			<div class="col-md-6">
				<!-- This is 1st box of Add Category-->
				
				<!-- Adding data-toggle="modal" data-target="#add-category-modal" to open modal-->
				<div class="card" data-toggle="modal" data-target="#add-category-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								src="img/Add Category.png" alt="AddCategory_icon" />
						</div>

						<p class="mt-2">Click Here To Add Category</p>
						<h1 class="text-uppercase text-muted">Add Categories</h1>

					</div>
					<!-- End of 1st BOX-->
				</div>
				<!-- End of 1st Column-->
			</div>

			<!-- 2nd Column-->
			<div class="col-md-6">
				<!-- This is 2nd box of Add Product-->
				
				<!-- Adding data-toggle="modal" data-target="#add-product-modal" to open modal-->
				<div class="card" data-toggle="modal" data-target="#add-product-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								src="img/Add Product.jpg" alt="AddCategory_icon" />
						</div>

						<p class="mt-2">Click Here To Add Product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>

					</div>
					<!-- End of 2nd BOX-->
				</div>

				<!-- End of 2nd Column-->
			</div>


			<!-- End of row 2nd row-->
		</div>

		<!-- End of Container-->
	</div>


	<!-- Add Category Modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				
				<!-- Creating form to Add Category -->
				<div class="modal-body">
				<!-- Redirecting on ProductOperationServlet after clicking Add Category Button -->
				<form action="ProductOperationServlet" method="post">
				
				
					<!-- This field is used to tell the servlet "ProductOperationServlet" that op==addcategory-->
					<input type="hidden" name="operation" value="addcategory"/>
				
					<!-- Using class form-group inside form as per rule of bootstrap-->
					
					<!-- Category Title -->
					<div class="form-group form-lg">
					<input type="text" class="form-control" name="catTitle" placeholder="Enter Catrgory Title" required/>
					</div>
				
					<!-- Category Description -->
					<div class="form-group form-lg">
					<textarea style="height:250px;" class="form-control" name="catDescription" placeholder="Enter Catrgory Description" required></textarea>
					</div>
				
					<div class="container text-center">
					
						<button class="btn btn-outline-success">Add Category</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		
					</div>
				
				</form>
				
				</div>
				
			</div>
		</div>
	</div>

	<!-- End of Category Modal -->


<!-- ********************************************************************************************************************** -->
	<!-- Add Product Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				
				<!-- Creating form to Add Product -->
				<div class="modal-body">
				
				<!-- Redirecting on ProductOperationServlet after clicking Add Category Button -->
				
				<!--1. The enctype attribute lets you specify an encoding type for your form.
					2. multipart/form-data is necessary if your users are required to upload a file through the form,
					 this is used beacuse we allow user to upload image through file 
				 -->
				<form action="ProductOperationServlet"  method="post"  enctype="multipart/form-data">
				
					<!-- This field is used to tell the servlet "ProductOperationServlet" that op==addcategory-->
					<input type="hidden" name="operation" value="addproduct"/>
				
					<!-- Using class form-group inside form as per rule of bootstrap-->
					
					<!-- Product name -->
					<div class="form-group form-lg">
					<input type="text" class="form-control" name="pName" placeholder="Enter title of product" required/>
					</div>
					
					<!-- Product Description -->
					<div class="form-group form-lg">
					<textarea style="height:150px;" class="form-control" name="pDesc" placeholder="Enter Product Description" required></textarea>
					</div>
					
					
					<!-- Product price -->
					<div class="form-group form-lg">
					<input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required/>
					</div>
					
					
					<!-- Product Discount -->
					<div class="form-group form-lg">
					<input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required/>
					</div>
					
					
					<!-- Product Quantity -->
					<div class="form-group form-lg">
					<input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required/>
					</div>
					
					<!-- Product Category id -->
					<%
					CategoryDao categoryDao= new CategoryDao(FactoryProvider.getFactory());
					
					//calling getCategories method from categoryDao class
					
					List<Category> list= categoryDao.getCategories();
					
					%>
					<div class="form-group">
						<select name="catId" class="form-control" id="">
							
							<%
							for(Category c:list){
							%>
							
						<!-- When we  store Product and  selects the Category Title from drop down the corresponding categoryId
						will get stored as a foreign key in product table i.e value -->	
						<option value ="<%=c.getCategoryId()%>"> <%=c.getCategoryTitle()%> </option>
							
						<%} %>
						
						</select>
					</div>
					
				
					<div class="form-group form-lg">
					
					<lable for="pPic">Select Picture of Product</lable><br>
					<input type="file" id="pPic" name="pPic" required/>
					
					</div>
								
	
					<div class="container text-center">
					
						<button class="btn btn-outline-success">Add Product</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		
					</div>
				
				</form>
				<!-- End of form -->
				
				</div>
				
			</div>
		</div>
	</div>
	

	<!-- End Of Product Modal -->
	
<!-- Adding common modal to show cart on this page -->
<%@include file="components/common_modals.jsp"%>	
</body>
</html>