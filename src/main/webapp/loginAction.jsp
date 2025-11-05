<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<% 
String email = request.getParameter("email");
String password = request.getParameter("password");

if("admin@wp.pl".equals(email) && "admin".equals(password)){
	session.setAttribute("email",email);
	response.sendRedirect("admin/adminHeader.jsp");
}
else{
try{
	int z = 0;
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	ResultSet res = st.executeQuery("Select 1 from users where email = '"+email+"' and password = '"+password+"' ");
	while(res.next()){
		z=1;
		session.setAttribute("email",email);
		response.sendRedirect("home.jsp");
	}
	if(z==0){
		response.sendRedirect("login.jsp?msg=notexist");
	}
	
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("login.jsp?msg=invalid");
}
}

%>