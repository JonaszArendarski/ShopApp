<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>

<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String state = request.getParameter("state");
String city = request.getParameter("city");
String country = request.getParameter("country");
int i = 0;
try{
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	ResultSet res = st.executeQuery("Select * from users where email = '"+email+"'");
	while(res.next()){
		i=1;
		st.executeUpdate("Update users set address = '"+address+"' , state = '"+state+"' , city = '"+city+"' , country = '"+country+"' where email = '"+email+"' ");
		response.sendRedirect("changeAddress.jsp?msg=done");
	}
	if(i==0)
	{
		response.sendRedirect("changeAddress.jsp?msg=wrong");
	}
}catch(Exception e){
	System.out.println(e);
}


%>