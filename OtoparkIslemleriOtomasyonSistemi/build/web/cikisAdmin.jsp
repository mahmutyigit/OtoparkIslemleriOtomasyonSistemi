<%
session.setAttribute("email", null);
session.invalidate();
response.sendRedirect("adminGiris.jsp");
%>