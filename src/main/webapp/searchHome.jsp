<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file ="header.jsp" %>

<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<link rel="stylesheet" href="design/home.css">
</head>
<body>

<main class="content-area">
  <div class="table-container">
    <table class="product-table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Name</th>
          <th scope="col">Category</th>
          <th scope="col"><i class="fa fa-dollar-sign"></i> Price</th>
          <th scope="col">Status</th>
          <th scope="col">Add to Cart <i class="fas fa-cart-plus"></i></th>
        </tr>
      </thead>
      <tbody>

<%
int z = 0;
String search = request.getParameter("search");
try {
    Connection con = ConnectProvider.getConnect();
    Statement st = con.createStatement();
    ResultSet res = st.executeQuery("SELECT * FROM product WHERE (name LIKE '%"+search+"%' OR category LIKE '%"+search+"%') AND active = 'Yes'");
    while(res.next()) {
        z = 1;
%>
        <tr>
          <td><%= res.getInt(1) %></td>
          <td><%= res.getString(2) %></td>
          <td><%= res.getString(3) %></td>
          <td><i class="fa fa-dollar-sign"></i> <%= res.getInt(4) %></td>
          <td><span class="status active">Active</span></td>
          <td>
            <a href="addToCartAction.jsp?id=<%= res.getInt(1) %>" class="btn add-btn">
              <i class="fas fa-cart-plus"></i> Add to Cart
            </a>
          </td>
        </tr>
<%
    }
} catch(Exception e) {
    System.out.println(e);
}
%>
      </tbody>
    </table>

<%
if(z == 0) {
%>
    <div class="alert info">
      <i class="fa-solid fa-circle-info"></i> Nothing to show
    </div>
<%
}
%>

  </div>
</main>

</body>
</html>
