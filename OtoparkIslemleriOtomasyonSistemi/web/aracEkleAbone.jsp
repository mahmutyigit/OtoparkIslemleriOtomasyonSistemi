
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
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Web UI Kit &amp; Dashboard Template based on Bootstrap">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, web ui kit, dashboard template, admin template">

	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<title>ANASAYFA</title>


	<link href="css/app.css" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="anasayfaAbone.jsp">
          <span class="align-middle">OTOPARK ISLEMLERI</span>
        </a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						Kolay Erisim
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="anasayfaAbone.jsp">
                                                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Anasayfa</span>
                                                </a>
					</li>
                                    
                                        <li class="sidebar-item active">
						<a class="sidebar-link" href="aracEkleAbone.jsp">
                                                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Arac Ekle</span>
                                                </a>
                                        </li><!-- comment -->
                                        
                                        <li class="sidebar-item active">
						<a class="sidebar-link" href="aracGoruntuleAbone.jsp">
                                                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Araclari Goruntule</span>
                                                </a>
                                        </li><!-- comment -->
                                        
                                        <li class="sidebar-item active">
						<a class="sidebar-link" href="sifreDegisAbone.jsp">
                                                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Sifremi Degistir</span>
                                                </a>
					</li>

					
				</ul>

			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle d-flex">
          <i class="hamburger align-self-center"></i>
        </a>

				<form class="form-inline d-none d-sm-inline-block">
					<div class="input-group input-group-navbar">
						<input type="text" class="form-control" placeholder="Search?" aria-label="Search">
						<div class="input-group-append">
							<button class="btn" type="button">
                                                        <i class="align-middle" data-feather="search"></i>
                                                      </button>
						</div>
					</div>
				</form>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						
						
						<li class="nav-item dropdown">
							
                                                        
                                                        <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown">
                                                        <i class="align-middle" data-feather="settings"></i>
                                                      </a>

							<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                                                           <span class="text-dark">Abone Paneli</span>
                                                          </a>
							<div class="dropdown-menu dropdown-menu-right">
								
								<div class="dropdown-divider"></div>
								
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="cikisAbone.jsp">Cikis Yap</a>
							</div>
                                                    
                                                    
						</li>
					</ul>
				</div>
			</nav>

			
                    
                    
                    <%   
                            Connection con;     
                            String msg = "";
                            String color = "";
                            if(request.getMethod().compareToIgnoreCase("post")==0)
                            {
                                    try
                                    {       
                                            String kayitNo = request.getParameter("kayitNo");
                                            String aboneIsim = request.getParameter("aboneIsim");
                                            String aboneSoyisim = request.getParameter("aboneSoyisim");
                                            String abonePlaka = request.getParameter("abonePlaka");
                                            String aboneMail = request.getParameter("aboneMail");
                                            String aboneTel = request.getParameter("aboneTel");
                                            String kayitTarihi = request.getParameter("kayitTarihi");


                                             Class.forName("com.mysql.jdbc.Driver");
                                             con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/otopark","root","root");
                                             String query = "INSERT INTO araclar(kayitNo,aboneIsim,aboneSoyisim,abonePlaka,aboneMail,aboneTel,kayitTarihi) VALUES (?,?,?,?,?,?,?)";

                                            PreparedStatement pst = con.prepareStatement(query);

                                            pst.setString(1, kayitNo);
                                            pst.setString(2, aboneIsim);
                                            pst.setString(3, aboneSoyisim);
                                            pst.setString(4, abonePlaka);
                                            pst.setString(5, aboneMail);
                                            pst.setString(6, aboneTel);
                                            pst.setString(7, kayitTarihi);

                                            pst.executeUpdate();

                                            color = "green";
                                            msg = "Yeni Arac Başarıyla Eklendi...";

                                    }catch(Exception ex){
                                            ex.printStackTrace();
                                            color = "red";
                                            msg = "Yeni Arac Ekleme Islemi başarısız...";
                                    }
                            }
                    %>       
    
    <div class="form-group col-12 p-0">
        <h4 style="color:<%= color %>"><%= msg %></h4>
    </div>
    
 
    
            

           <div class="col-12 col-md-6 offset-md-3 "  >        
                <div class="form-group col-12 p-0">
                        <div class="card-header">
                                <h5 class="card-title">Yeni Arac Ekle</h5>
                        </div>
                    <div class="card-body"   >
                            
                            
                            
                                <form id="form" method="post" action="aracEkleAbone.jsp">
                                    
                                        
                                        <div class="form-group">
                                                <label class="form-label">Arac Sahibinin Ismi</label>
                                                <input type="aboneIsim" name="aboneIsim" id="aboneIsim" class="form-control" placeholder="Adiniz">
                                        </div>
                                    
                                        <div class="form-group">
                                                <label class="form-label">Arac Sahibinin Soyismi</label>
                                                <input type="aboneSoyisim" name="aboneSoyisim" id="aboneSoyisim"  class="form-control" placeholder="Soyadiniz">
                                        </div>
                                    
                                        <div class="form-group">
                                                <label class="form-label">Aracin Plakasi</label>
                                                <input class="form-control" name="abonePlaka" id="abonePlaka"  placeholder="Plaka numaraniz" rows="1">
                                        </div>
                                        
                                         <div class="form-group">
                                                <label class="form-label">Arac Sahibinin Mail Adresi</label>
                                                <input class="form-control"  name="aboneMail" id="aboneMail" placeholder="Mail Adresiniz" rows="1">
                                         </div><!-- comment -->
                                         
                                          <div class="form-group">
                                                <label class="form-label">Arac Sahibinin Telefon Numarasi</label>
                                                <input class="form-control" name="aboneTel" id="aboneTel"  placeholder="Telefon Numaraniz" rows="1">
                                        </div>
                                         
                                           <div class="form-group">
                                                <label class="form-label">Arac Kayit Tarihi</label>
                                                <input class="form-control" name="kayitTarihi" id="kayitTarihi"  placeholder="Kayit Tarihi" rows="1">
                                        </div>
                                    
                                        
                                        
                                        <button type="submit" class="btn btn-primary">Kaydet</button>
                                </form>
                        </div>
                </div>
        </div>
                    
                    
                    
                    
                    

		</div>
	</div>

	<script src="/js/vendor.js"></script>
	<script src="/js/app.js"></script>

	
</body>

</html>