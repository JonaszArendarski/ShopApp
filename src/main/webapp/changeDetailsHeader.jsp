<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>Online Shop — Change Details</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
<link rel="stylesheet" href="design/changeDetails.css">
</head>
<body>

  <nav class="sub-nav" role="navigation" aria-label="Zmiana danych">
    <div class="sub-inner">
      <div class="nav-left">
        <% String email = (String) session.getAttribute("email"); %>
        <span class="nav-welcome">
          <i class="fa-regular fa-user"></i>
          Witaj, <strong><%= email %></strong>
        </span>

        <a class="nav-link" href="home.jsp">Home</a>
        <a class="nav-link" href="changePassword.jsp">Change Password</a>
        <a class="nav-link" href="changeAddress.jsp">Change Address</a>
        <a class="nav-link" href="changeMobileNumber.jsp">Change Mobile</a>
        <a class="nav-link" href="changeSecurityQuestion.jsp">Security Question</a>
        <a class="nav-link" href="logout.jsp">Logout</a>
      </div>
    </div>
  </nav>


</body>
</html>
