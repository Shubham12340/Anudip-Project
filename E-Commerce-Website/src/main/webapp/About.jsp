<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Page</title>

<!-- Adding bootsrap 4 which will used on all pages -->
<%@include file="components/common_css_js.jsp"%>
<!-- Ending of Bootstrap -->

</head>
<body>
<!-- Adding navbar on home page -->
<%@include file="components/navbar.jsp" %>


	<%@include file="components/common_modals.jsp"%>
	
	<div class="container">
		<div class="card">
			<h1 class="para text-center mt-3">About Us</h1>
			<div class="card-body">
			
				<p class="para mt-2">E-commerce (electronic commerce) is the buying and selling of goods and services, or the transmitting of funds or data, over an electronic network, primarily the internet. These business transactions occur either as business-to-business (B2B), business-to-consumer (B2C), consumer-to-consumer or consumer-to-business. The terms e-commerce and e-business are often used interchangeably. The term e-tail is also sometimes used in reference to the transactional processes for online shopping.</p>
				
				
				
				<p><span style="padding-left:40px">E-commerce, which can be conducted over computers, tablets, or smartphones may be thought of like a digital version of mail-order catalog shopping. Nearly every imaginable product and service is available through e-commerce transactions, including books, music, plane tickets, and financial services such as stock investing and online banking. As such, it is considered a very disruptive technology.</span></p>
			</div>
		</div>
	</div>
<!-- Adding common modal to show cart on this page -->
<%@include file="components/common_modals.jsp"%>
</body>
</html>