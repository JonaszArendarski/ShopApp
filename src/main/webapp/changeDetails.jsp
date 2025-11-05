<%@ page import="project.ConnectProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="changeDetailsHeader.jsp" %>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>Change Details</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/accountDetails.css">
</head>
<body>

<main class="content">
  <section class="details-card">
    <h2><i class="fa-solid fa-user-pen"></i> Your Profile Details</h2>

    <%
      try {
        Connection con = ConnectProvider.getConnect();
        Statement st = con.createStatement();
        ResultSet res = st.executeQuery("SELECT * FROM users WHERE email='" + email + "'");
        while (res.next()) {
    %>

    <div class="detail-item">
      <span class="label"><i class="fa-solid fa-id-card"></i> Name:</span>
      <span class="value"><%= res.getString(1) %></span>
    </div>

    <div class="detail-item">
      <span class="label"><i class="fa-solid fa-envelope"></i> Email:</span>
      <span class="value"><%= res.getString(2) %></span>
    </div>

    <div class="detail-item">
      <span class="label"><i class="fa-solid fa-location-dot"></i> Address:</span>
      <span class="value"><%= res.getString(7) %></span>
    </div>

    <div class="detail-item">
      <span class="label"><i class="fa-solid fa-shield-halved"></i> Security Question:</span>
      <span class="value"><%= res.getString(4) %></span>
    </div>

    <%
        }
        res.close();
        st.close();
        con.close();
      } catch (Exception e) {
        System.out.println(e);
      }
    %>
  </section>
</main>

</body>
</html>
