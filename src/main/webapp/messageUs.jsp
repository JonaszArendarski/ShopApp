<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file ="header.jsp" %>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>Message Us</title>
<link rel="stylesheet" href="design/message.css">
</head>
<body>

<main class="content">
  <section class="form-container">

    <%
      String msg = request.getParameter("msg");
      if("valid".equals(msg)){
    %>
      <div class="alert success"><i class="fa-solid fa-circle-check"></i> Message sent successfully, our team will contact you soon.</div>
    <% } else if("invalid".equals(msg)){ %>
      <div class="alert error"><i class="fa-solid fa-triangle-exclamation"></i> Something went wrong! Please try again.</div>
    <% } %>

    <h2><i class="fa-solid fa-envelope"></i> Message Us</h2>

    <form action="messageUsAction.jsp" method="post" class="styled-form">
      <label for="title">Subject</label>
      <input type="text" id="title" name="title" placeholder="Enter subject of your message..." required>

      <label for="body">Your Message</label>
      <textarea id="body" name="body" placeholder="Enter your message..." required></textarea>

      <button class="btn-primary" type="submit">
        <i class="fa-solid fa-paper-plane"></i> Send Message
      </button>
    </form>

  </section>
</main>

</body>
</html>
