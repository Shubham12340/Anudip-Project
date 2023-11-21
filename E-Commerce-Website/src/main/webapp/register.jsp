<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User</title>


<style>

</style>

<!-- Adding bootstrap 4 which will used on all pages -->
<%@include file="components/common_css_js.jsp"%>
<!-- Ending of Bootstrap -->

</head>
<body>

	<!-- Adding navbar on home page -->
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid">
	
	<div class="row mt-5">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				
				<!--Adding Registration Sucessful message on card body   -->
				<%@include file="components/message.jsp" %>
				
				<div class="card-body px-5">
				<img src="img/signup.jpg" class="center">
				<h3 class="text-center my-2" style="color: blue; font-weight: bold">Sign Up Here!!!</h3>
		
				
			<form action="RegisterServlet" method="post">
				
				<div class="form-group">
					
					<label for="name">User Name</label> 
					<input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp"
						placeholder="Enter Your Name">
				</div>
				
				<div class="form-group">
					<label for="email">User Email</label> <input name="user_email" type="email"
						class="form-control" id="email" aria-describedby="emailHelp"
						placeholder="Enter Your Email">
						<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				</div>
				
				<div class="form-group">
					<label for="password">User Password</label> <input name="user_password" type="password"
						class="form-control" id="password" aria-describedby="emailHelp"
						placeholder="Enter Strong password">
					<small id="emailHelp" class="form-text text-muted">Password should contain 6 characters or more.</small>	
				</div>
				
				<div class="form-group">
					<label for="phone">User Phone</label> <input name="user_phone" type="number"
						class="form-control" id="phone" aria-describedby="emailHelp"
						placeholder="Enter Phone Number">
				</div>
				
				<div class="form-group">
					<label for="name">User Address</label> 
					<textarea name="user_address" style="height: 100px" class="form-control" placholder="Ebnter your address"></textarea>
				</div>
				
				<div class="container text-center">
				<button class="btn btn-outline-success">Register</button>
				<button class="btn btn-outline-warning">Reset</button>
				</div>
				
			</form>
				
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Adding common modal to show cart on this page -->
<%@include file="components/common_modals.jsp"%>
</body>
</html>