<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Online Shop — Header</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
  <link rel="stylesheet" href="design/Head.css">
</head>
<body>

  <header class="main-header" role="banner">
    <div class="header-inner">
      <i class="fa-solid fa-bag-shopping" aria-hidden="true"></i>
      <h1 class="brand">Online Shop</h1>
    </div>
  </header>
  <nav class="sub-nav" role="navigation" aria-label="Główna nawigacja">
    <div class="sub-inner">
      <div class="nav-left">
        <% 
          Object emailObj = session.getAttribute("email");
          String email = (emailObj != null) ? emailObj.toString() : null;
        %>
        <span class="nav-welcome">
          <i class="fa-regular fa-user" aria-hidden="true"></i>
          <% if (email != null) { %>
            Witaj, <strong><%= email %></strong>
          <% } else { %>
            Witaj
          <% } %>
        </span>

        <a class="nav-link" href="home.jsp">Home</a>
        <a class="nav-link" href="myCart.jsp">My Cart</a>
        <a class="nav-link" href="myOrders.jsp">My Orders</a>
        <a class="nav-link" href="messageUs.jsp">Message</a>
        <a class="nav-link" href="changeDetails.jsp">Change Details</a>
        <a class="nav-link" href="deliveredOrders.jsp">About</a>
        <a class="nav-link" href="logout.jsp">Logout</a>
      </div>

      <div class="nav-right">
        <form action="searchHome.jsp" method="post" class="search-form" role="search">
          <div class="input-wrap">
            <i aria-hidden="true"></i>
            <input name="search" type="text" placeholder="Search" aria-label="Search" />
          </div>
          <button type="submit" class="btn-sm">Search</button>
        </form>
      </div>
    </div>
  </nav>
</body>
</html>
