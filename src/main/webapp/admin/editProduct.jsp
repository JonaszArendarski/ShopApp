<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<link rel = "stylesheet" href = "${pageContext.request.contextPath}/design/addProduct.css">
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
</head>
<body>


<h2><a class = "back" href="allProductEditProduct.jsp"></a>Back</h2>

<%  String idParam = request.getParameter("id");
if (idParam == null || idParam.trim().isEmpty()) {
    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product id");
    return;
}

int id;
try {
    id = Integer.parseInt(idParam.trim());
} catch (NumberFormatException nfe) {
    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product id");
    return;
}
try{
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	ResultSet res = st.executeQuery("Select * from product where id = '"+id+"'");
	while(res.next()){
%>
<form action = "editProductAction.jsp" method = "post">
<input type = "hidden" name ="id" value =<%= id%>>
<div class = "left-div">
<h3>Enter Name</h3>
<input class="input-style" type="text" name= "name" value="<%=res.getString(2)%>" required>
<hr>
</div>

<div class = "right-div">
<h3>Enter Category</h3>
<input class="input-style" type="text" name= "category" value="<%=res.getString(3)%>" required>
<hr>
</div>


<div class = "left-div">
<h3>Enter Price</h3>
<input class="input-style" type="number" name= "price" value="<%=res.getInt(4)%>" required>
<hr>
</div>

<div class = "right-div">
<h3>Active</h3>
<select class = "input-style" name="active">
<option value ="Yes">Yes</option>
<option value ="No">No</option>
</select>
<hr>
</div>
<button class = "Button">Save</button>
</form>
<%
}
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("");
}
%>
</body>
</html>