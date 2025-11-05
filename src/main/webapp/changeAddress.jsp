<%@ page import="project.ConnectProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="changeDetailsHeader.jsp" %>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>Update Address</title>
<link rel="stylesheet" href="design/changeAddress.css">
</head>
<body>

<main class="content">
  <section class="form-container">

    <%
      String msg = request.getParameter("msg");
      if("done".equals(msg)){
    %>
      <div class="alert success"><i class="fa-solid fa-circle-check"></i> Address updated successfully!</div>
    <% } else if("wrong".equals(msg)){ %>
      <div class="alert error"><i class="fa-solid fa-triangle-exclamation"></i> Something went wrong. Please try again.</div>
    <% } %>

    <h2><i class="fa-solid fa-map-location-dot"></i> Update Address</h2>

    <form action="changeAddressAction.jsp" method="post" class="address-form">
      <label>Enter Address</label>
      <input type="text" name="address" placeholder="Enter address..." required>

      <label>Enter State</label>
      <input type="text" name="state" placeholder="Enter state..." required>

      <label>Enter City</label>
      <input type="text" name="city" placeholder="Enter city..." required>

      <label>Enter Country</label>
      <input type="text" name="country" placeholder="Enter country..." required>

      <button class="btn-primary" type="submit">
        <i class="fa-solid fa-floppy-disk"></i> Save
      </button>
    </form>
  </section>
</main>

</body>
</html>
