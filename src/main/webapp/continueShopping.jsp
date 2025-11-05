<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>


<%
String email = session.getAttribute("email").toString();
String status = "processing";

try{
	Connection con = ConnectProvider.getConnect();
	PreparedStatement ps = con.prepareStatement("Update cart set status = ? where email =? and status = 'bill' ");
	ps.setString(1,status);
	ps.setString(2, email);
	ps.executeUpdate();
	response.sendRedirect("home.jsp");
}catch(Exception e){
	System.out.println(e);
}
%>
