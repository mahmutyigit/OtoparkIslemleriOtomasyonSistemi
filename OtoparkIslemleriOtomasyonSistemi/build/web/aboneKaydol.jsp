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
                    String isim = request.getParameter("isim");
                    String soyisim = request.getParameter("soyisim");
                    String telNo = request.getParameter("telNo");
                    String plakaNo = request.getParameter("plakaNo");
                    String email = request.getParameter("email");
                    String sifre = request.getParameter("sifre");
            


                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/otopark","root","root");
                    String query = "INSERT INTO aboneKaydol(isim,soyisim,telNo,plakaNo,email,sifre) VALUES (?,?,?,?,?,?)";

                    PreparedStatement pst = con.prepareStatement(query);

                    pst.setString(1, isim);
                    pst.setString(2, soyisim);
                    pst.setString(3, telNo);
                    pst.setString(4, plakaNo);
                    pst.setString(5, email);
                    pst.setString(6, sifre);

                    pst.executeUpdate();

                    color = "green";
                    msg = "Abone Olarak Kaydolma Isleminiz Basariyla Gerceklestirilmistir, Artık Giris Yapabilirsiniz...";
	
   			}catch(Exception ex){
   				ex.printStackTrace();
   				color = "red";
   				msg = "Beklenmeyen Bir Durum Olustu, GKayıt Isleminiz Basarisiz Oldu... Lutfen Daha Sonra Tekrar Deneyiniz...";
   			}
   		}
            %>       

            
             <div class="form-group col-12 p-0">
                <h4 style="color:<%= color %>"><%= msg %></h4>
            </div>
        
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form class="login100-form validate-form" method="post" action="aboneKaydol.jsp" >
					<span class="login100-form-title p-b-33">
						Abone Olarak Kaydol
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" id="isim" name="isim" placeholder="IsminiziYaziniz">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="text" id="soyisim" name="soyisim" placeholder="Soyisminizi yaziniz">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
                                    
                                        <div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="text" id="telNo" name="telNo" placeholder="Telefon numaranizi yaziniz">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

                                        <div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="text" id="plakaNo" name="plakaNo" placeholder="Plakanizi yaziniz">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

                                        <div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="text" id="email" name="email" placeholder="E-mail adresinizi yaziniz">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
                                    
                                        <div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="password" id="sifre" name="sifre" placeholder="sifrenizi yaziniz">
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
							Admin Olarak Kaydolmak Icin
						</span>

						<a href="adminKaydol.jsp" class="txt2 hov1">
							Buraya Tiklayin!
						</a>
					</div>

					<div class="text-center">
						<span class="txt1">
							Zaten Bir Hesabiniz Varsa
						</span>

						<a href="aboneGiris.jsp" class="txt2 hov1">
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