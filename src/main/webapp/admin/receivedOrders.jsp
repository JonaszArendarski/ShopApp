<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "adminHeader.jsp" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/receivedOrders.css">
<meta charset="UTF-8">
<title>Orders Received</title>
</head>
<body>

<%
String msg = request.getParameter("msg");
if("cancelled".equals(msg)){
%>
<h3 class = "alert">Order cancelled successfully </h3>
<% }%>
<%
if("wrong".equals(msg)){
%>	
<h3 class = "alert">Something went wrong! </h3>
<%}%>
<%
if("delivered".equals(msg)){
%>	
<h3 class = "alert">Order changed to delivered</h3>
<%}%>
<table>
<thead>
	<tr>
		<th>Mobile Number</th>
		<th>Product Name </th>
		<th>Quantity </th>
		<th>Sub Total </th>
		<th>Address</th>
		<th>State </th>
		<th>City</th>
		<th>Country</th>
		<th>Order Date:</th>
		<th>Expected delivery Date:</th>
		<th>Payment Method</th>
		<th>T-ID</th>
		<th>Status</th>
		<th><a>Delete</a></th>
		<th><a>Delivered </a></th>
	</tr>
	
<%
int sno = 0 ;
try{
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	ResultSet res = st.executeQuery("Select * from cart inner join product on cart.product_id = product.id where cart.orderdate IS NOT NULL AND cart.status = 'processing' ");
	while(res.next()){
		sno++;
%>	
	<tr>
		<td><%=res.getInt(10)%></td>
		<td><%=res.getString(17) %> </td>
		<td><%=res.getString(3) %> </td>
		<td><%=res.getString(5) %> </td>
		<td><%=res.getString(6) %></td>
		<td><%=res.getString(7) %></td>
		<td><%=res.getString(8) %></td>
		<td><%=res.getString(9) %></td>
		<td><%=res.getString(11) %></td>
		<td><%=res.getString(12) %></td>
		<td><%=res.getString(13) %></td>
		<td><%=res.getString(14) %></td>
		<td><%=res.getString(15) %></td>
		<td><a href = "canceOrderAction.jsp?id=<%=res.getInt(2)%>&email=<%=res.getString(1)%>" >Delete</a></td>
		<td><a href = "deliveredOrderAction.jsp?id=<%=res.getInt(2)%>&email=<%=res.getString(1)%>">Delivered </a></td>
	</tr>
	</thead>
	<tbody>
	
</tbody>
<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</table>	
</body>
</html>