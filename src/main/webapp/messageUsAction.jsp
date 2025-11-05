<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%
 	String email = session.getAttribute("email").toString();
	String title = request.getParameter("title");
	String body = request.getParameter("body");
	
	try{
		Connection con = ConnectProvider.getConnect();
		PreparedStatement ps = con.prepareStatement("Insert into message(email,subject,body) values(?,?,?)");
		ps.setString(1,email);
		ps.setString(2,title);
		ps.setString(3,body);
		ps.executeUpdate();
		response.sendRedirect("messageUs.jsp?msg=valid");
	}catch(Exception e){
		System.out.println(e);
		response.sendRedirect("messageUs.jsp?msg=invalid");
	}

%>
