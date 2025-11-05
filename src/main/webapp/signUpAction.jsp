<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<% 
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String number = request.getParameter("phoneNum");
	Integer num = Integer.parseInt(number);
	String securityQuestion = request.getParameter("securityQuestion");
	String answer = request.getParameter("answer");
	String password = request.getParameter("password");
	
	String address = "";
	String city = "";
	String country = "";
	String state = "";
	
	try{
		Connection con = ConnectProvider.getConnect();
		PreparedStatement ps = con.prepareStatement("insert into users values(?,? ,?,? ,?,?, ?,?, ?,?)");
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setInt(3,num);
		ps.setString(4,securityQuestion);
		ps.setString(5,answer);
		ps.setString(6,password);
		ps.setString(7,address);
		ps.setString(8,city);
		ps.setString(9,country);
		ps.setString(10,state);
		ps.executeUpdate();
		response.sendRedirect("signUp.jsp?msg=valid");
	}catch(Exception ex){
		System.out.println(ex);
		response.sendRedirect("signUp.jsp?msg=invalid");
	}


%>