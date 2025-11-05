<%@ page import="project.ConnectProvider" %>
<%@ page import="java.sql.*" %>

<%
String email = (String) session.getAttribute("email");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String paymentMethod = request.getParameter("paymentMethod");
String status = "bill";

String mobileNumberParam = request.getParameter("mobileNumber");
String transactionIdParam = request.getParameter("transactionId");

Long mobileNumberLong = null;
Long transactionIdLong = null;
String transactionIdString = null;

if (mobileNumberParam != null) {
    mobileNumberParam = mobileNumberParam.trim();
    if (!mobileNumberParam.isEmpty()) {
        try {
            mobileNumberLong = Long.parseLong(mobileNumberParam);
        } catch (NumberFormatException ex) {
            
            System.out.println("WARN: Nieprawidłowy numer telefonu: '" + mobileNumberParam + "'. Zapiszę NULL.");
        }
    }
}

if (transactionIdParam != null) {
    transactionIdParam = transactionIdParam.trim();
    if (!transactionIdParam.isEmpty()) {
        if (transactionIdParam.matches("\\d+")) {
            try {
                transactionIdLong = Long.parseLong(transactionIdParam);
            } catch (NumberFormatException ex) {
                System.out.println("WARN: transactionId wygląda na liczbę, ale parsowanie nie powiodło się: '" + transactionIdParam + "'");
            }
        } else {
            transactionIdString = transactionIdParam;
        }
    }
}

try{
	Connection con = ConnectProvider.getConnect();
    String upUser = "UPDATE users SET address = ?, city = ?, state = ?, country = ?,mobilenumber=? WHERE email = ?";
   	PreparedStatement p = con.prepareStatement(upUser);
        p.setString(1, address);
        p.setString(2, city);
        p.setString(3, state);
        p.setString(4, country);
        p.setLong(5, transactionIdLong);
        p.setString(6, email);
        p.executeUpdate();
    

    String upCart = ""
        + "UPDATE cart SET "
        + "address = ?, "
        + "city = ?, "		
        + "state = ?, "
        + "country = ?, "
        + "mobilenumber = ?, "
        + "orderdate = now(), "
        + "deliverydate = now() + interval '7 days', "
        + "paymentmethod = ?, "
        + "transactionid = ?, "
        + "status = ? "
        + "WHERE email = ? AND address IS NULL"; 
    PreparedStatement ps = con.prepareStatement(upCart);
    ps.setString(1,address);
    ps.setString(2,city);
    ps.setString(3,state);
    ps.setString(4,country);
    ps.setLong(5, mobileNumberLong);
    ps.setString(6,paymentMethod);
    ps.setLong(7, transactionIdLong);
    ps.setString(8,status);
    ps.setString(9,email);
    ps.executeUpdate();
    response.sendRedirect("bill.jsp");

} catch (Exception e) {
    out.println("<pre>ERROR: " + e + "</pre>");
    e.printStackTrace();
}
%>
