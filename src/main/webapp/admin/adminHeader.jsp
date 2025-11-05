<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
<link rel = "stylesheet" href = "${pageContext.request.contextPath}/design/adminHead.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<br>
	<div class = "topnav sticky" >
	<%String email = session.getAttribute("email").toString(); %>
	<center><h2> Admin Page</h2></center>
	<a href = "addNewProduct.jsp">Add new product</a>
	<a href = "allProductEditProduct.jsp">All Products & Edit Products</a>
	<a href = "messagesReceived.jsp">Messages Received</a>
	<a href = "canceledOrders.jsp">Cancel Orders</a>
	<a href = "receivedOrders.jsp">Orders Received</a>
	<a href = "deliveredOrders.jsp">Delivered Orders</a>
	<a href = "../logout.jsp">Logout</a>
	</div>
	<br>
<body>

</body>
</html>