<%@ page import="project.ConnectProvider" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proceed to Order</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/addressPaymentForOrderStyle.css">
</head>
<body>

<div class="order-container">

<%
String email = (String) session.getAttribute("email");
int total = 0;
int sno = 0;

try (Connection con = ConnectProvider.getConnect()) {
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT sum(total) FROM cart WHERE email = '"+email+"' AND address IS NULL");
    while (rs.next()) {
        total = rs.getInt(1);
    }
%>

<div class="order-header">
    <a href="myCart.jsp" class="btn back-btn">Back to Cart</a>
    <h2>Your Order Summary</h2>
    <h3 class="total-label">Total: $<%= total %></h3>
</div>

<table class="order-table">
    <thead>
        <tr>
            <th>S.No</th>
            <th>Product Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Sub Total</th>
        </tr>
    </thead>
    <tbody>
<%
ResultSet res = st.executeQuery(
    "SELECT * FROM product INNER JOIN cart ON product.id = cart.product_id AND cart.email = '"+email+"' AND cart.address IS NULL"
);
while (res.next()) {
    sno++;
%>
        <tr>
            <td><%= sno %></td>
            <td><%= res.getString(2) %></td>
            <td><%= res.getString(3) %></td>
            <td>$<%= res.getInt(4) %></td>
            <td><%= res.getInt(8) %></td>
            <td>$<%= res.getInt(10) %></td>
        </tr>
<%
}
ResultSet rs1 = st.executeQuery("SELECT * FROM users WHERE email = '"+email+"'");
while (rs1.next()) {
%>
    </tbody>
</table>

<form action="addressPaymentForOrderAction.jsp" method="post" class="order-form">
    <div class="form-group">
        <h3>Address:</h3>
        <input type="text" name="address" value="<%= rs1.getString(7) %>" placeholder="Enter Address..." required>
    </div>

    <div class="form-group">
        <h3>City:</h3>
        <input type="text" name="city" value="<%= rs1.getString(8) %>" placeholder="Enter City..." required>
    </div>

    <div class="form-group">
        <h3>State:</h3>
        <input type="text" name="state" value="<%= rs1.getString(9) %>" placeholder="Enter State..." required>
    </div>

    <div class="form-group">
        <h3>Country:</h3>
        <input type="text" name="country" value="<%= rs1.getString(10) %>" placeholder="Enter Country..." required>
    </div>

    <div class="form-group">
        <h3>Payment Method:</h3>
        <select name="paymentMethod">
            <option value="Cash on Delivery">Cash on Delivery</option>
            <option value="Online Payment">Online Payment</option>
        </select>
    </div>

    <div class="form-group">
        <h3>Transaction ID (if online):</h3>
        <input type="text" name="transactionId" placeholder="Enter Transaction ID...">
    </div>

    <div class="form-group">
        <h3>Mobile Number:</h3>
        <input type="number" name="mobileNumber" value="<%= rs1.getString(3) %>" placeholder="Enter Phone Number..." required>
    </div>

    <p class="warning-text"> If you enter the wrong Transaction ID, your order may be canceled.</p>

    <button class="btn proceed-btn" type="submit">Proceed to Generate Bill & Save</button>
</form>

<%
}
} catch (Exception e) {
    out.println("<pre>ERROR: " + e + "</pre>");
}
%>

</div>
</body>
</html>
