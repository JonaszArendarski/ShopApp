<%@ page import="project.ConnectProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="changeDetailsHeader.jsp" %>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<link rel="stylesheet" href="design/changePassword.css">
</head>
<body>

<main class="content">
  <section class="form-container">

    <%
      String msg = request.getParameter("msg");
      if("notMatch".equals(msg)){
    %>
      <div class="alert error"><i class="fa-solid fa-circle-exclamation"></i> New password and confirm password do not match.</div>
    <% } else if("invalid".equals(msg)){ %>
      <div class="alert error"><i class="fa-solid fa-triangle-exclamation"></i> Old password is incorrect.</div>
    <% } else if("valid".equals(msg)){ %>
      <div class="alert success"><i class="fa-solid fa-circle-check"></i> Password changed successfully!</div>
    <% } else if("wrong".equals(msg)){ %>
      <div class="alert error"><i class="fa-solid fa-bug"></i> Something went wrong! Please try again.</div>
    <% } %>

    <h2><i class="fa-solid fa-key"></i> Change Password</h2>

    <form action="changePasswordAction.jsp" method="post" class="change-form">
      <label>Enter Old Password</label>
      <input type="password" name="oldPassword" placeholder="Enter old password..." required>

      <label>Enter New Password</label>
      <input type="password" name="newPassword" placeholder="Enter new password..." required>

      <label>Confirm New Password</label>
      <input type="password" name="newPassword2" placeholder="Confirm new password..." required>

      <button class="btn-primary" type="submit">
        <i class="fa-solid fa-rotate"></i> Change Password
      </button>
    </form>
  </section>
</main>

</body>
</html>
