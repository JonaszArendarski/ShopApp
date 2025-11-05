<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Bill</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/bill.css">
</head>
<body>
<%
String email = session.getAttribute("email").toString();
try{
	int sno = 0;
	int total=0;
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	ResultSet res = st.executeQuery("Select sum(total) from cart where email = '"+email+"' and status = 'bill'");
	while(res.next()){
		total = res.getInt(1);
	}
	ResultSet res2 = st.executeQuery("Select * from users inner join cart on users.email = cart.email where cart.email = '"+email+"' and cart.status = 'bill' ");
	while(res2.next()){
		

%>

<h3>Online Shopping  Bill</h3>
<hr>
<div class = left-div><h3> Name : <%out.println(res2.getString(1));%></h3> </div>
<div class = right-div-right><h3> Email : <%out.println(email);%></h3> </div>
<div class = right-div><h3> Mobile Number : <%out.println(res2.getString(20));%></h3> </div>

<div class = left-div><h3> Order Date : <%out.println(res2.getString(21));%></h3> </div>
<div class = right-div-right><h3> Payment Method: <%out.println(res2.getString(23));%></h3> </div>
<div class = right-div><h3> Expected Delivery : <%out.println(res2.getString(22));%></h3> </div>

<div class = left-div><h3> Transaction ID : <%out.println(res2.getString(24));%></h3> </div>
<div class = right-div-right><h3> City : <%out.println(res2.getString(17));%></h3> </div>
<div class = right-div><h3> Address : <%out.println(res2.getString(16));%></h3> </div>

<div class = left-div><h3> State : <%out.println(res2.getString(18));%></h3> </div>
<div class = right-div><h3> Country : <%out.println(res2.getString(19));%></h3> </div>
<hr>
<% break;} %>

 <br>
 <table id="customers">

	<tr>
		<th>S.No</th>
		<th>Product Name</th>
		<th>Category</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Sub Total</th>
	</tr>
<%
ResultSet res1 = st.executeQuery("Select * from cart inner join product on cart.product_id = product.id where cart.email = '"+email+"' and cart.status='bill' ");
while(res1.next()){
	sno = sno+1;	

	%>
	<tr>
		<td><%out.println(sno);%></td>
		<td><%out.println(res1.getString(16));%></td>
		<td><%out.println(res1.getString(17));%></td>
		<td><%out.println(res1.getString(18));%></td>
		<td><%out.println(res1.getString(3));%></td>
		<td><%out.println(5);%></td>
	</tr>
	<tr>
	<%
	}
	%>
</table>
<h3>Total : <%= total%></h3>
<div class = "Buttons">
<a href = "continueShopping.jsp"><button>Continue Shopping</button></a>
<a onclick = "window.print();"><button>Print</button></a>
</div>
<%
}catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>