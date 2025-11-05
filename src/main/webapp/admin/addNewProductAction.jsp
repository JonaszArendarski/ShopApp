<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<% 
	String idParam = request.getParameter("id");
	Integer id = Integer.parseInt(idParam);
    String name = request.getParameter("name");
	String category = request.getParameter("category");
	String price = request.getParameter("price");
	Integer pr = Integer.parseInt(price);
	String active = request.getParameter("active");
	
	try{
		Connection con = ConnectProvider.getConnect();
		PreparedStatement ps = con.prepareStatement("Insert into product values(?,?,?,?,?)");
		ps.setInt(1,id);
		ps.setString(2,name);
		ps.setString(3,category);
		ps.setInt(4,pr);
		ps.setString(5,active);
		ps.executeUpdate();
		response.sendRedirect("addNewProduct.jsp?msg=done");
	}catch(Exception e){
		response.sendRedirect("addNewProduct.jsp?msg=wrong");
	}

%>