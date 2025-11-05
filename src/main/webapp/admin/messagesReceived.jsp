<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Messages Received</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/messagesReceived.css">
</head>
<body>
<main class="content-area">
  <div class="table-container">
    <table class="message-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Email</th>
          <th>Subject</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        <%
          try {
            Connection con = ConnectProvider.getConnect();
            Statement st = con.createStatement();
            ResultSet res = st.executeQuery("SELECT * FROM message");
            while(res.next()) {
        %>
              <tr>
                <td><%=res.getInt(1)%></td>
                <td><%=res.getString(2)%></td>
                <td><%=res.getString(3)%></td>
                <td><%=res.getString(4)%></td>
              </tr>
        <%
            }
          } catch(Exception e) {
            out.println("<tr><td colspan='4'>Error loading messages.</td></tr>");
          }
        %>
      </tbody>
    </table>
  </div>
</main>
</body>
</html>
