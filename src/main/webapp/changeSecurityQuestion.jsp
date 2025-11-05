<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file ="changeDetailsHeader.jsp" %>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>Change Security Question</title>
<link rel="stylesheet" href="design/changeSecurity.css">
</head>
<body>

<main class="content">
  <section class="form-container">

    <%
      String msg = request.getParameter("msg");
      if("done".equals(msg)){
    %>
      <div class="alert success"><i class="fa-solid fa-circle-check"></i> Security Question Changed Successfully</div>
    <% } else if("invalid".equals(msg)){ %>
      <div class="alert error"><i class="fa-solid fa-triangle-exclamation"></i> Wrong Password</div>
    <% } %>

    <h2><i class="fa-solid fa-shield-halved"></i> Change Security Question</h2>

    <form action="changeSecurityQuestionAction.jsp" method="post" class="styled-form">
      <label>Select new security question</label>
      <select name="securityQuestion" required>
        <option value="What is the name of your pet?">What is the name of your pet?</option>
        <option value="What is your favorite sport?">What is your favorite sport?</option>
        <option value="What was your childhood best friend's name?">What was your childhood best friend's name?</option>
        <option value="What was your first car?">What was your first car?</option>
      </select>

      <label>Enter new answer</label>
      <input type="text" name="newanswer" placeholder="Enter new answer..." required>

      <label>Enter password (for security)</label>
      <input type="password" name="password" placeholder="Enter password..." required>

      <button class="btn-primary" type="submit">
        <i class="fa-solid fa-floppy-disk"></i> Save
      </button>
    </form>

  </section>
</main>

</body>
</html>
