<%@ page import ="java.sql.*" %>

        <%
            String email = request.getParameter("email");    
            String sifre = request.getParameter("sifre");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/otopark","root","root");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from aboneKaydol where email='" + email + "' and sifre='" + sifre + "'");
            if (rs.next()) {
                session.setAttribute("email", email);
                
                response.sendRedirect("anasayfaAbone.jsp");
            } else {
                out.println("<a href='aboneGiris.jsp'>Lutfen tekrar deneyin...</a>");
            }
        %>