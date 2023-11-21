<%
//putting current-user in user object
	User user = (User) session.getAttribute("current-user");
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>

<!-- Adding bootsrap 4 which will used on all pages -->
<%@include file="components/common_css_js.jsp"%>
<!-- Ending of Bootstrap -->


</head>
<body>
<!-- Adding navbar on home page -->
<%@include file="components/navbar.jsp" %>

<div class="container lg-2">
	<div class="card">
		<h3 class="text-center mt-3">Contact Us</h3>
		<div class="card-body">
			<form action="!#">
				<div class="form-group">
   					 <label for="exampleInputEmail1">Name</label>
   					<input  type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
    			</div>
				
			
				<div class="form-group">
   					 <label for="exampleInputEmail1">Email address</label>
   					<input  type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
    				<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  				</div>
  				
  				<div class="form-group">
   					 <label for="exampleInputEmail1">Contact No</label>
   					<input  type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter contact no.">
    				<small id="emailHelp" class="form-text text-muted">We'll never share your contact with anyone else.</small>
  				</div>
  				
  				
				<label for="contact us" style="color: blue;" class="form-group">Select Purpose</label>
					<select id="contact" name="contact">
  						<option value="volvo">Know About Us</option>
  						<option value="saab">Know About Offerings</option>
  						<option value="fiat">Any Queries</option>
  						<option value="audi">Any Suggestion</option>
					</select>
				
				<div class="form-group">
    				<label for="exampleFormControlTextarea1">Enter Your Message</label>
    				<textarea class="form-control" id="exampleFormControlTextarea1" rows="2"></textarea>
  				</div>
				
				<div class="btn-group">
				<button type="button" class="btn btn-success" data-dismiss="modal" onclick="showToast('Your response has been placed successfully!!')">Send</button>
				</div>
				
			</form>
		</div>
	</div>
</div>

<!-- Adding common modal to show cart on this page -->
<%@include file="components/common_modals.jsp"%>

<!-- This div is used to give toast message -->
<div id="toast"></div>
</body>
</html>