<%@page import="com.mycart.entities.User" %>

<!-- Fetching user details using  to show him navbar as per his login 
1. If user is not logged in i.e user1==null we will show him login and register buttons on navbar
2. If user is logged in we will show him logout button and his name on navbar 

-->

<%
//this line is used to get the current user in object user1	
User user1 = (User) session.getAttribute("current-user");
	
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark custom-bg"> 
	
	<div class="container">
	
	<!--Giving Website name as  YourIndian.store-->
	<a class="navbar-brand" href="index.jsp" >YourIndian.store</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp" >Home<span class="sr-only">(current)</span></a>
			<li class="nav-item active"><a class="nav-link" href="About.jsp">About Us<span class="sr-only">(current)</span></a>
			<li class="nav-item active"><a class="nav-link" href="contactUs.jsp">Contact Us<span class="sr-only">(current)</span></a>
			</li>	
		</ul>
		
	
	<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2"  type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
		
		<ul class="navbar-nav ml-auto">
		
		<!-- Showing cart using font awesome bootstrap vr 4.7.0-->
		<!-- in icon tag we are giving class name as "fa fa-cart-plus" to show the cart icon and to show count we uses class name as "ml-0 cart-items"-->
		<li class="nav-item active">
			<a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 20px;" ></i><span class="ml-0 cart-items"> ( 0 ) </span></a>
			</li>
		
		<%
		//if nobody is logged in we will show him login and Register buttons
		if(user1==null){
		%>
			
			<li class="nav-item active">
			<a class="nav-link" href="login.jsp">login</a>
			</li>
			
			<li class="nav-item active">
			<a class="nav-link" href="register.jsp">Register</a>
			</li>
		</ul>
			 
			
	<%}
		//if someone is logged in we will show his name and logout button
		else{
	%>
		
		
	<li class="nav-item active">
			<a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp":"normal.jsp"%>"><%=user1.getUserName()%></a>
			</li>
			
			<li class="nav-item active">
			<a class="nav-link" href="LogoutServlet">logout</a>
			</li>
		</ul>
		
		
		<% 
		
		}
		
		%>


	</div>
	

	</div>
	
	</nav>


</body>
</html>