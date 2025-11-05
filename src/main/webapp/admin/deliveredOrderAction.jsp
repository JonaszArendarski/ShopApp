<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>

<%
String id = request.getParameter("id");
String email = request.getParameter("email");
int idd=0;
if( id!=null){
	id.trim();
	try{
		idd= Integer.parseInt(id);
	}catch(NumberFormatException e){
		System.out.println(e);
	}
}

try{
	Connection con = ConnectProvider.getConnect();
	PreparedStatement ps = con.prepareStatement("Update cart set status = 'delivered' where product_id = ? and email = ? and address IS NOT NULL");
	ps.setInt(1,idd);
	ps.setString(2,email);
	ps.executeUpdate();
	response.sendRedirect("receivedOrders.jsp?msg=delivered");	
}
catch(Exception e){
	System.out.println(e);
}

%>
