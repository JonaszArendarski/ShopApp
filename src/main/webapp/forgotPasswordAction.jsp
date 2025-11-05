<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<% 
String email = request.getParameter("email");
String number = request.getParameter("number");
Integer num = Integer.parseInt(number);
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

int check = 0;
try{
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	ResultSet res = st.executeQuery("Select * from users where email = '"+email+"' and mobilenumber = '"+num+"' and securityquestion = '"+securityQuestion+"' and answer = '"+answer+"'");
	while(res.next()){
		check = 1;
		st.executeUpdate("Update users set password = '"+newPassword+"' where email = '"+email+"' ");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	if(check == 0){
		response.sendRedirect("forgotPassword.jsp?msg=wrong");
	}
}catch(Exception e){
	System.out.println(e);
	
}
%>
