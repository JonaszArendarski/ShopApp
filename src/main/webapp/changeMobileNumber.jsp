<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file ="changeDetailsHeader.jsp" %>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>Change Mobile Number</title>
<link rel="stylesheet" href="design/changeMobile.css">
</head>
<body>

<main class="content">
  <section class="form-container">

    <%
      String msg = request.getParameter("msg");
      if("updated".equals(msg)){
    %>
      <div class="alert success"><i class="fa-solid fa-circle-check"></i> Phone Number Updated Successfully</div>
    <% } else if("wrong".equals(msg)){ %>
      <div class="alert error"><i class="fa-solid fa-triangle-exclamation"></i> Something went wrong!</div>
    <% } %>

    <h2><i class="fa-solid fa-phone"></i> Change Mobile Number</h2>

    <form action="changeMobileNumberAction.jsp" method="post" class="styled-form">
      <label>Enter New Mobile Number</label>
      <input type="number" name="mobileNumber" placeholder="Enter new phone number..." required>

      <button class="btn-primary" type="submit">
        <i class="fa-solid fa-floppy-disk"></i> Save
      </button>
    </form>

  </section>
</main>

</body>
</html>
