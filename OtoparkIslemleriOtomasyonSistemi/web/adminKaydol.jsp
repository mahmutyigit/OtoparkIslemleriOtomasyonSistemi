<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V19</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>




<%   
            Connection con;     
            String msg = "";
            String color = "";
   	    if(request.getMethod().compareToIgnoreCase("post")==0)
   		{
                try
                {
                    String isimA = request.getParameter("isimA");
                    String soyisimA = request.getParameter("soyisimA");
                    String telNoA = request.getParameter("telNoA");
                    String tcNoA = request.getParameter("tcNoA");
                    String emailA = request.getParameter("emailA");
                    String sifreA = request.getParameter("sifreA");
            


                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/otopark","root","root");
                    String query = "INSERT INTO adminKaydol(isimA,soyisimA,telNoA,tcNoA,emailA,sifreA) VALUES (?,?,?,?,?,?)";

                    PreparedStatement pst = con.prepareStatement(query);

                    pst.setString(1, isimA);
                    pst.setString(2, soyisimA);
                    pst.setString(3, telNoA);
                    pst.setString(4, tcNoA);
                    pst.setString(5, emailA);
                    pst.setString(6, sifreA);

                    pst.executeUpdate();

                    color = "green";
                    msg = "Admin Olarak Kaydolma Isleminiz Basariyla Gerceklestirilmistir, Artık Giris Yapabilirsiniz...";
	
   			}catch(Exception ex){
   				ex.printStackTrace();
   				color = "red";
   				msg = "Beklenmeyen Bir Durum Olustu, Kayıt Isleminiz Basarisiz Oldu... Lutfen Daha Sonra Tekrar Deneyiniz...";
   			}
   		}
            %>       

            
             <div class="form-group col-12 p-0">
                <h4 style="color:<%= color %>"><%= msg %></h4>
            </div>
        
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form class="login100-form validate-form" method="post" action="adminKaydol.jsp" >
					<span class="login100-form-title p-b-33">
						admin Olarak Kaydol
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" id="isimA" name="isimA" placeholder="Isminizi Yaziniz">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="text" id="soyisimA" name="soyisimA" placeholder="Soyisminizi yaziniz">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
                                    
                                        <div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="text" id="telNoA" name="telNoA" placeholder="Telefon numaranizi yaziniz">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

                                        <div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="text" id="tcNoA" name="tcNoA" placeholder="TC Kimlik Numaranizi yaziniz">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

                                        <div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="text" id="emailA" name="emailA" placeholder="E-mail adresinizi yaziniz">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
                                    
                                        <div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="password" id="sifreA" name="sifreA" placeholder="sifrenizi yaziniz">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

                                                                      

					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn">
							Kaydol
						</button>
					</div>

					<div class="text-center p-t-45 p-b-4">
						<span class="txt1">
							Abone Olarak Kaydolmak Icin
						</span>

						<a href="aboneKaydol.jsp" class="txt2 hov1">
							Buraya Tiklayin!
						</a>
					</div>

					<div class="text-center">
						<span class="txt1">
							Zaten Bir Hesabiniz Varsa
						</span>

						<a href="adminGiris.jsp" class="txt2 hov1">
							Buradan Giris Yapabilirsiniz!
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>