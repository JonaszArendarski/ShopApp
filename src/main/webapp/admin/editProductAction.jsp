<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<% 
String idParam = request.getParameter("id");
Integer id = Integer.parseInt(idParam);
String category = request.getParameter("category");
String priceParam = request.getParameter("price");
Integer price = Integer.parseInt(priceParam);
String active = request.getParameter("active");
String name = request.getParameter("name");

try{
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	st.executeUpdate("Update product set  name='"+name+"', category='"+category+"', price ='"+price+"', active ='"+active+"' where id ='"+id+"'");
	if(active.equals("No")){
		st.executeUpdate("Delete from cart where product_id ='"+id+"' and address is NULL");
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=updt");
	
}catch(Exception e){
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>