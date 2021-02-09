<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
             
            Connection con;     
 
                String kayitNo = request.getParameter("id");
                
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/otopark","root","root");
                String query = "delete from  aboneler where aboneid = ?";

                PreparedStatement pst = con.prepareStatement(query);


                pst.setString(1, kayitNo);
                pst.executeUpdate();

    %>   
    
    <script>
        
          window.location.replace("aboneGoruntule.jsp");       
        
    </script>