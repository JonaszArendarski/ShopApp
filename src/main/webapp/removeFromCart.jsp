<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%
String email = (String) session.getAttribute("email");
String product_idParam = request.getParameter("id");
if (product_idParam== null || product_idParam.trim().isEmpty()) {
    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product id");
    return;
}

int product_id;
try {
    product_id = Integer.parseInt(product_idParam.trim());
} catch (NumberFormatException nfe) {
    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product id");
    return;
}

try{
	Connection con = ConnectProvider.getConnect();
	PreparedStatement ps = con.prepareStatement("Delete from cart where email = '"+email+"' and product_id = '"+product_id+"' ");
	ps.executeUpdate();
	response.sendRedirect("myCart.jsp?msg=remove");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("myCart.jsp?msg=wrong");
}
%>