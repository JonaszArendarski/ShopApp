<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>

<% 
String email =  session.getAttribute("email").toString();
String idParam = request.getParameter("id");
Integer id = Integer.parseInt(idParam);
String incdec = request.getParameter("quantity");
int price = 0;
int total = 0;
int quantity = 0;
int final_total = 0;
try{
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("Select * from cart where email= '"+email+"' and product_id = '"+id+"' and address is NULL");
	while(rs.next()){
		price = rs.getInt(4);
		total = rs.getInt(5);
		quantity = rs.getInt(3);
	}
	if(quantity == 1 && incdec.equals("dec")){
		response.sendRedirect("myCart.jsp?msg=notPossible");
	}
	else if(quantity != 1 && incdec.equals("dec")){
		quantity--;
		total -= price;
		st.executeUpdate("Update cart set total = '"+total+"' , quantity = '"+quantity+"' where email = '"+email+"' and product_id ='"+id+"' and address is NULL");
		response.sendRedirect("myCart.jsp?msg=dec");
	}
	else if (incdec.equals("inc")){
		quantity++;
		total += price;
		st.executeUpdate("Update cart set total = '"+total+"' , quantity = '"+quantity+"' where email = '"+email+"' and product_id ='"+id+"'and address is NULL");
		response.sendRedirect("myCart.jsp?msg=inc");
	}
	
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("myCart.jsp?msg=wrong");
}



%>