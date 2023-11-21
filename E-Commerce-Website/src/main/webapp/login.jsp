<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>User Login - YourIndian.store</title>


<!-- Adding bootstrap 4 and style.css through common_css_js.jsp file which will used on all pages -->
<%@include file="components/common_css_js.jsp"%>
<!-- Ending of Bootstrap -->



</head>
<body>
	<!-- Adding navbar on login page -->
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">

		<div class="row mt-5">

			<div class="col-md-4 offset-md-4">


				<div class="card">

				
				<!--Adding Registration Sucessful message on card body   -->
				<%@include file="components/message.jsp" %>
				
				
		
					<div class="card-body px-5">
						<img src="img/login2.jpg" class="center">
						<div class="card-header">
					
							<h3 class="text-center my-2"
								  style="color:blue; font-weight: bold">Login Here!!!</h3>

						</div>

						<div class="body">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										name="email" type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										name="password" type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								
								<a href="register.jsp" class="text-center d-block mb-4">If Not Registered Click Here!!!</a>
										
								
									<div class="container text-center">
										<button type="submit" class="btn btn-primary border-0">Submit</button>
										<button type="reset" class="btn btn-primary border-0">Reset</button>
										
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