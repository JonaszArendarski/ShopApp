<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products & Edit Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/allProducts.css">
</head>
<body>
<main class="content-area">
  <%
    String msg = request.getParameter("msg");
    if("done".equals(msg)){
  %>
    <div class="alert success"><i class="fa-solid fa-check-circle"></i> Product Updated Successfully</div>
  <% } else if("wrong".equals(msg)){ %>
    <div class="alert error"><i class="fa-solid fa-triangle-exclamation"></i> Something went wrong!</div>
  <% } %>

  <div class="table-container">
    <table class="product-table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Name</th>
          <th scope="col">Category</th>
          <th scope="col"><i class="fa fa-dollar-sign"></i> Price</th>
          <th scope="col">Status</th>
          <th scope="col">Edit</th>
        </tr>
      </thead>
      <tbody>
      <%
        try{
          Connection con = ConnectProvider.getConnect();
          Statement st = con.createStatement();
          ResultSet res  = st.executeQuery("Select * from product");
          while(res.next()){
            String status = res.getString(5); 
            boolean isActive = "Yes".equalsIgnoreCase(status) || "Active".equalsIgnoreCase(status);
      %>
        <tr>
          <td><%=res.getInt(1)%></td>
          <td><%=res.getString(2)%></td>
          <td><%=res.getString(3)%></td>
          <td>$<%=res.getInt(4)%></td>
          <td><span class="status <%= (isActive ? "active" : "inactive") %>"><%= status %></span></td>
          <td><a href="editProduct.jsp?id=<%= res.getInt(1) %>" class="btn edit-btn"><i class="fas fa-pen"></i> Edit</a></td>
        </tr>
      <%
          }
        } catch(Exception e){
          out.println("<tr><td colspan='6'>Error loading products.</td></tr>");
        }
      %>
      </tbody>
    </table>
  </div>
</main>
</body>
</html>
