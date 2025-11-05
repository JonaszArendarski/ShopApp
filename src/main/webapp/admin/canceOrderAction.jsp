<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>

<%
String id = request.getParameter("id");
int idd=0;
if( id!=null){
	id.trim();
	try{
		idd= Integer.parseInt(id);
	}catch(NumberFormatException e){
		System.out.println(e);
	}
}

String email = request.getParameter("email");
try{
	Connection con = ConnectProvider.getConnect();
	PreparedStatement ps = con.prepareStatement("Update cart set status = 'cancel' where product_id = ? and email = ? and address IS NOT NULL");
	ps.setInt(1,idd);
	ps.setString(2,email);
	ps.executeUpdate();
	response.sendRedirect("receivedOrders.jsp?msg=cancelled");
} catch(Exception e){
	System.out.println(e);
}
%>
