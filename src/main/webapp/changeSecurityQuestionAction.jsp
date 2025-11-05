<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>

<%
String email = session.getAttribute("email").toString();
String securityquestion = request.getParameter("securityQuestion");
String newanswer = request.getParameter("newanswer");
String password = request.getParameter("password");
int check = 0;
try{
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	PreparedStatement ps = con.prepareStatement("Select * from users where email = ? and password = ?");
	ps.setString(1,email);
	ps.setString(2,password);
	ResultSet res = ps.executeQuery();
	while(res.next()){
		check = 1;
		PreparedStatement pes = con.prepareStatement("Update users set securityquestion = ? , answer = ? where email = ?");
		pes.setString(1,securityquestion);
		pes.setString(2,newanswer);
		pes.setString(3,email);
		pes.executeUpdate();
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
	}
	if(check == 0){
		response.sendRedirect("changeSecurityQuestion.jsp?msg=invalid");
	}
}catch(Exception e ){
	System.out.println(e);
}

%>