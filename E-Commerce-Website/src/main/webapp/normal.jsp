<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Page</title>


<!-- Adding bootstrap 4 and style.css through common_css_js.jsp file which will used on all pages -->
<%@include file="components/common_css_js.jsp"%>
<!-- Ending of Bootstrap -->

</head>
<body>

<!-- Adding navbar on Normal user page -->
<%@include file="components/navbar.jsp"%>

<h1>This is Normal User Panel</h1>


<!-- Adding common modal to show cart on this page -->
<%@include file="components/common_modals.jsp"%>
</body>
</html>