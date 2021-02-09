<%@ page import ="java.sql.*" %>

        <%
            String emailA = request.getParameter("emailA");    
            String sifreA = request.getParameter("sifreA");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/otopark","root","root");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from adminKaydol where emailA='" + emailA + "' and sifreA='" + sifreA + "'");
            if (rs.next()) {
                session.setAttribute("emailA", emailA);
                
                response.sendRedirect("anasayfaAdmin.jsp");
            } else {
                out.println("<a href='adminGiris.jsp'>Lutfen tekrar deneyin...</a>");
            }
        %>