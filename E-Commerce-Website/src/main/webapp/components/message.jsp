<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<!-- Message after Successful registration -->

<%
	String message =(String) session.getAttribute("message");

	
	if(message!=null){
		
		//printing messagge
		//out.println(message);	
%>	

<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><%=message%></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>	
		<% 
		//removing message from session
		session.removeAttribute("message");
	}
%>

</body>
</html>