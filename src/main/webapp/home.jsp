<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file ="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/design/home.css">
<main class="content-area">
  <%
    String msg = request.getParameter("msg");
    if("added".equals(msg)){
  %>
    <div class="alert success"><i class="fa-solid fa-check-circle"></i> Product Added Successfully</div>
  <% } else if("exist".equals(msg)){ %>	
    <div class="alert info"><i class="fa-solid fa-circle-info"></i> Product already in cart, quantity increased.</div>
  <% } else if("invalid".equals(msg)){ %>
    <div class="alert error"><i class="fa-solid fa-triangle-exclamation"></i> Something went wrong, please try again.</div>
  <% } %>

  <div class="table-container">
    <table class="product-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Category</th>
          <th><i class="fa fa-dollar-sign"></i> Price</th>
          <th>Status</th>
          <th>Add to Cart</th>
        </tr>
      </thead>
      <tbody>
        <%
          try {
            Connection con = ConnectProvider.getConnect();
            Statement st = con.createStatement();
            ResultSet res = st.executeQuery("Select * from product where active = 'Yes'");
            while(res.next()) {
        %>
              <tr>
                <td><%=res.getInt(1)%></td>
                <td><%=res.getString(2)%></td>
                <td><%=res.getString(3)%></td>
                <td>$<%=res.getInt(4)%></td>
                <td><span class="status active">Active</span></td>
                <td><a href="addToCartAction.jsp?id=<%=res.getInt(1)%>" class="btn add-btn"><i class="fa-solid fa-cart-plus"></i> Add</a></td>
              </tr>
        <%
            }
          } catch(Exception e) {
            out.println("<tr><td colspan='6'>Error loading products.</td></tr>");
          }
        %>
      </tbody>
    </table>
  </div>
</main>
</body>
</html>
