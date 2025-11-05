<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>

<% 
String email = session.getAttribute("email").toString();
String mobileNumber = request.getParameter("mobileNumber");
int mobile = 0;
if(mobileNumber != null){
	mobileNumber.trim();
	try{
		mobile = Integer.parseInt(mobileNumber);
	}catch(NumberFormatException e){
		System.out.println(e);
	}
}
try{
	Connection con = ConnectProvider.getConnect();
	PreparedStatement ps  = con.prepareStatement("Update users set mobilenumber = ? where email = ?");
	ps.setInt(1,mobile);
	ps.setString(2,email);
	int rows = ps.executeUpdate();
	if(rows>0){
		
		response.sendRedirect("changeMobileNumber.jsp?msg=updated");
	}
	else{
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
	}
}catch(Exception e){
	System.out.println(e);
}
%>