<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>

<%
	String email = (String) session.getAttribute("email");
	String id = request.getParameter("id");
	if (id== null || id.trim().isEmpty()) {
	    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product id");
	    return;
	}

	int product_id;
	try {
	    product_id = Integer.parseInt(id.trim());
	} catch (NumberFormatException nfe) {
	    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product id");
	    return;
	}
	//System.out.println(product_id);
	int quantity = 1;
	int price = 0 ;
	int product_total = 0;
	int cart_total = 0;
	
	int z = 0;
	
	try{
		Connection con = ConnectProvider.getConnect();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select * from product where id = '"+product_id+"' ");
		while(rs.next()){
			price = rs.getInt(4);
			product_total = price;
		}
		ResultSet rs1 = st.executeQuery("Select * from cart where product_id = '"+product_id+"' and email = '"+email+"' and address is NULL");
		while(rs1.next()){
			cart_total = rs1.getInt(5);
			cart_total = product_total+cart_total;
			quantity = rs1.getInt(3);
			quantity=quantity+1;
			z=1;
		}
		if(z==1){
			st.executeUpdate("Update cart set total = '"+cart_total+"' , quantity = '"+quantity+"' where product_id = '"+product_id+"' and email = '"+email+"' and address is NULL");
			response.sendRedirect("home.jsp?msg=exist");
		}
		if(z==0){
			PreparedStatement ps = con.prepareStatement("Insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
			ps.setString(1,email);
			ps.setInt(2,product_id);
			ps.setInt(3,quantity);
			ps.setInt(4,price);
			ps.setInt(5,product_total);
			ps.executeUpdate();
			response.sendRedirect("home.jsp?msg=added");
		}
	}catch(Exception e){
		System.out.println(e);
		response.sendRedirect("home.jsp?msg=invalid");
	}

%>
