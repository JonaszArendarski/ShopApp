<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>

<% 
String email = session.getAttribute("email").toString();
String oldPassword = request.getParameter("oldPassword");
String newPassword  = request.getParameter("newPassword");
String confirm  = request.getParameter("newPassword2");

if(!confirm.equals(newPassword)){
	response.sendRedirect("changePassword.jsp?msg=notMatch");
}
else{
	int check = 0;
	try{
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	ResultSet res = st.executeQuery("Select * from users where password = '"+oldPassword+"' and email = '"+email+"' ");
	while(res.next()){
		check = 1;
		st.executeUpdate("Update users set password = '"+newPassword+"' where email = '"+email+"' ");
		response.sendRedirect("changePassword.jsp?msg=valid");
	}
	if(check == 0){
		response.sendRedirect("changePassword.jsp?msg=invalid");
	}
	}catch(Exception e){
		System.out.println(e);
	}
}
%>
