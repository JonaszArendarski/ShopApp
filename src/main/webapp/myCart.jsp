<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file ="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/design/cart.css">
<main class="content-area">
  <div class="cart-container">
  <%
    String msg = request.getParameter("msg");
    if("notPossible".equals(msg)){
  %>
    <div class="alert info"><i class="fa-solid fa-circle-info"></i> There is only one quantity, click to remove product.</div>
  <% } else if("inc".equals(msg)){ %>	
    <div class="alert success"><i class="fa-solid fa-check-circle"></i> Quantity increased.</div>
  <% } else if("dec".equals(msg)){ %>
    <div class="alert warning"><i class="fa-solid fa-minus-circle"></i> Quantity decreased successfully.</div>
  <% } else if("remove".equals(msg)){ %>	
    <div class="alert error"><i class="fa-solid fa-trash-can"></i> Product removed.</div>
  <% } %>

  <table class="cart-table">
    <thead>
      <%
        int total = 0;
        int sno = 0; 
        try {
          Connection con = ConnectProvider.getConnect();
          Statement st = con.createStatement();
          ResultSet rs = st.executeQuery("Select sum(total) from cart where email = '"+email+"' and address is NULL ");
          while(rs.next()){
            total = rs.getInt(1);
      %>
        <tr class="cart-summary">
          <th colspan="5">Total:</th>
          <th colspan="2">$<%=total%></th>
        </tr>
        <% if(total > 0){ %>
        <tr>
          <td colspan="7" class="order-button">
            <a href="addressPaymentForOrder.jsp" class="btn proceed-btn"><i class="fa-solid fa-credit-card"></i> Proceed to Order</a>
          </td>
        </tr>
        <% } %>
        <tr>
          <th>S.No</th>
          <th>Product Name</th>
          <th>Category</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Sub Total</th>
          <th>Remove</th>
        </tr>
      </thead>
      <tbody>
      <%
          ResultSet res = st.executeQuery("Select * from product inner join cart on product.id = cart.product_id and cart.email = '"+email+"' and cart.address is NULL");
          while(res.next()){
            sno++;
      %>
        <tr>
          <td><%=sno%></td>
          <td><%=res.getString(2)%></td>
          <td><%=res.getString(3)%></td>
          <td>$<%=res.getInt(4)%></td>
          <td>
            <a href="decQuantityAction.jsp?id=<%=res.getInt(1)%>&quantity=inc" class="qty-btn plus">+</a>
            <span class="qty-value"><%=res.getInt(8)%></span>
            <a href="decQuantityAction.jsp?id=<%=res.getInt(1)%>&quantity=dec" class="qty-btn minus"> ~ </a>
          </td>
          <td>$<%=res.getInt(10)%></td>
          <td><a href="removeFromCart.jsp?id=<%=res.getInt(1)%>" class="btn remove-btn"><i class="fa-solid fa-trash"></i> Remove</a></td>
        </tr>
      <%
          }
        }
      } catch(Exception e){
        out.println("<tr><td colspan='7'>Error loading cart items.</td></tr>");
      }
      %>
      </tbody>
    </table>
  </div>
</main>
</body>
</html>
