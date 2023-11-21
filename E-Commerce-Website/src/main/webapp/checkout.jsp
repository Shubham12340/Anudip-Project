
<!-- This code is protecting checkout page from accessing without logged in -->
<%
//putting current-user in user object
	User user = (User) session.getAttribute("current-user");

	//this condition is used to protect when nobody is logged in neither admin nor normal user	
	if (user == null) {

		session.setAttribute("message", "You are not logged in, Login First to access checkout page!!!");
		response.sendRedirect("login.jsp");

		return;
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checkout Page</title>

<!-- Adding bootstrap 4 and style.css through common_css_js.jsp file which will used on all pages -->
<%@include file="components/common_css_js.jsp"%>
<!-- Ending of Bootstrap -->

</head>
<body>

<!-- Adding navbar on admin page -->
<%@include file="components/navbar.jsp"%>

<!-- Container to show order details and user details form -->
<div class="container">
	
	<!-- first row  -->
	<div class="row mt-5">
		
		<!-- first column of 6 grids -->
		<div class="col-md-6">
			<!-- Card -->
			<div class="card">
					<div class="card-body">
					<h3 class="text-center mb-5" style="color:blue">Your Order Details</h3>
			
						<div class="cart-body" style="background-color: white; color:black;">
							
			
						<!-- end of cart-body -->			
						</div>
			
					<!-- End of card  body -->
					</div>
			<!-- End of cart -->		
			</div>
		<!-- End of first column -->
		</div>
		
		<!-- Second column of 6 grids -->
		<div class="col-md-6">
			<!-- Form details -->
			
			<!-- Card -->
			<div class="card">
					<div class="card-body">
					<h3 class="text-center mb-4" style="color:blue">Your Details for Order, Check All details are correct or not</h3>
						<form action="!#">
							<div class="form-group">
    							<label for="exampleInputEmail1">Email address</label>
    							<input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    							<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  							</div>
  							
  							<div class="form-group">
    							<label for="exampleInputEmail1">Your Name</label>
    							<input value="<%= user.getUserName() %>"type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
  							</div>
  							
  							<div class="form-group">
    							<label for="exampleInputEmail1">Your Contact</label>
    							<input value="<%= user.getUserPhone() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter contact number">
  							</div>
  							
  							<div class="form-group">
    							<label for="exampleFormControlTextarea1">Enter Shipping Address</label>
    							<textarea value="<%= user.getUserAddress() %>" type="text" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter shipping address" required></textarea>
 		 					</div>
 		 					
 		 					<div class="container text-center">
 		 						<button class="btn btn-outline-success"><a href="#!" data-toggle="modal" data-target="#orderNow">Order Now </a></button>
 		 						<button class="btn btn-outline-primary" ><a href="index.jsp">Continue Shopping</a> </button>
 		 					
 		 					</div>
 		 					
 		 				<!-- End of form -->	
						</form>
					<!-- End of card body -->	
					</div>
			<!-- End of card -->
			</div>
		
		<!-- End of second row -->	
		</div>
		
	<!-- End of row -->
	</div>

<!-- End of container -->
</div>

<!-- Adding common modal to show cart on this page -->
<%@include file="components/common_modals.jsp"%>

<!-- Adding orderNow  modal to show cart on this page -->
<%@include file="components/orderNowModal.jsp"%>
</body>
</html>
