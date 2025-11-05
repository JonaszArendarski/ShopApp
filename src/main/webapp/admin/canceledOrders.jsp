<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/canceledOrders.css">
<meta charset="UTF-8">
<title>Canceled Orders</title>
</head>
<body>

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
	</tr>
	
	<%
int sno = 0 ;
try{
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	ResultSet res = st.executeQuery("Select * from cart inner join product on cart.product_id = product.id where cart.orderdate IS NOT NULL AND cart.status = 'cancel' ");
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
	</tr>
	</thead>
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