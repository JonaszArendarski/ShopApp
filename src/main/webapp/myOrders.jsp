<%@ page import="project.ConnectProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>My Orders — Online Shop</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/myOrders.css">
</head>
<body>
  <main class="orders-container">
    <h2 class="page-title"><i class="fa-solid fa-box"></i> My Orders</h2>
    <table>
      <thead>
        <tr>
          <th>S.No</th>
          <th>Product Name</th>
          <th>Category</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Sub Total</th>
          <th>Expected Delivery</th>
          <th>Payment Method</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
      <%
        int sno = 0;
        try {
          Connection con = ConnectProvider.getConnect();
          Statement st = con.createStatement();
          ResultSet res = st.executeQuery(
            "SELECT * FROM cart INNER JOIN product ON cart.product_id = product.id " +
            "WHERE email = '"+email+"' AND cart.orderdate IS NOT NULL"
          );
          while (res.next()) {
            sno++;
      %>
        <tr>
          <td><%= sno %></td>
          <td><%= res.getString(17) %></td>
          <td><%= res.getString(18) %></td>
          <td><%= res.getString(19) %></td>
          <td><%= res.getString(3) %></td>
          <td><%= res.getString(5) %></td>
          <td><%= res.getString(12) %></td>
          <td><%= res.getString(13) %></td>
          <td class="status"><%= res.getString(15) %></td>
        </tr>
      <%
          }
        } catch(Exception e) {
          System.out.println(e);
        }
      %>
      </tbody>
    </table>
  </main>
</body>
</html>
