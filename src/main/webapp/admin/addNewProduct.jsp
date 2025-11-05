<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "${pageContext.request.contextPath}/design/addProduct.css">
<meta charset="UTF-8">
<title>Add New Product</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class = "alert">Product Added Successfully </h3>
<% }%>
<%
if("wrong".equals(msg)){
%>	
<h3 class = "alert">Something went wrong! </h3>
<%}%>


<%
int id =1;

try{
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	ResultSet res = st.executeQuery("SELECT COALESCE(MAX(id),0) AS maxid FROM product");
	while(res.next()){
		 id = res.getInt("maxid") + 1;
	}
}catch(Exception e){
	
}
%>

<form action="addNewProductAction.jsp" method = "post">
<input type = "hidden" name = "id" value="<%= id%>"> 
<div class = "left-div">
<h3>Enter name</h3>
<input type = "text" name="name" placeholder = "Enter name ... " required>
<hr>
</div>

<div class = "right-div">
<h3> Enter Category</h3>
<input type = "text" name="category" placeholder = "Enter Category ..." required>
<hr>
</div>

<div class = "left-div">
<h3> Enter Price</h3>
<input type = "number" name="price" placeholder = "Enter Price ..." required>
<hr>
</div>

<div class = "right-div">
<h3>Active</h3>
<select class = "input-style" name="active">
<option value ="Yes">Yes </option>
<option value ="No">No </option>
</select>
<hr>
</div>
<button class = "Button">Save</button>
</form>
</body>
</html>