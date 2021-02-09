<%
session.setAttribute("email", null);
session.invalidate();
response.sendRedirect("aboneGiris.jsp");
%>