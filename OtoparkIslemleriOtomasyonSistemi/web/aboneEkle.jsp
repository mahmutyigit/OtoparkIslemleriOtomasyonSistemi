
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
						<a class="sidebar-link" href="anasayfaAdmin.jsp">
                                                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Anasayfa</span>
                                                </a>
					</li>
                                    
                                        <li class="sidebar-item active">
						<a class="sidebar-link" href="aboneEkle.jsp">
                                                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Abone Ekle</span>
                                                </a>
                                        </li><!-- comment -->
                                        
                                        <li class="sidebar-item active">
						<a class="sidebar-link" href="aboneGoruntule.jsp">
                                                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Aboneleri Görüntüle</span>
                                                </a>
                                        </li><!-- comment -->
                                        
                                        <li class="sidebar-item active">
						<a class="sidebar-link" href="uyeGoruntule.jsp">
                                                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Sisteme Uye Olan Aboneleri Goruntule</span>
                                                </a>
                                        </li><!-- comment -->
                                        
                                        <li class="sidebar-item active">
						<a class="sidebar-link" href="sifreDegisAdmin.jsp">
                                                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Sifremi Degistir</span>
                                                </a>
					</li>

					
				</ul>

			</div>
		</nav>

		<div class="main">
			<<nav class="navbar navbar-expand navbar-light navbar-bg">
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
                                                           <span class="text-dark">Admin Paneli</span>
                                                          </a>
							<div class="dropdown-menu dropdown-menu-right">
								
								<div class="dropdown-divider"></div>
								
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="cikisAdmin.jsp">Cikis Yap</a>
							</div>
                                                    
                                                    
						</li>
					</ul>
				</div>
			</nav>

			
                    
                    
                    <%   
                            Connection con;     
                      
                            if(request.getMethod().compareToIgnoreCase("post")==0)
                            {
                                    try
                                    {       
                                            String aboneid = request.getParameter("aboneid");
                                            String aboneisim = request.getParameter("aboneisim");
                                            String abonesoyisim = request.getParameter("abonesoyisim");
                                            String abonemail = request.getParameter("abonemail");
                                            String abonetel = request.getParameter("abonetel");
                                            String aboneplaka = request.getParameter("aboneplaka");
                                            String abonetarih = request.getParameter("abonetarih");


                                             Class.forName("com.mysql.jdbc.Driver");
                                             con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/otopark","root","root");
                                             String query = "INSERT INTO aboneler(aboneid,aboneisim,abonesoyisim,abonemail,abonetel,aboneplaka,abonetarih) VALUES (?,?,?,?,?,?,?)";

                                            PreparedStatement pst = con.prepareStatement(query);

                                            pst.setString(1, aboneid);
                                            pst.setString(2, aboneisim);
                                            pst.setString(3, abonesoyisim);
                                            pst.setString(4, abonemail);
                                            pst.setString(5, abonetel);
                                            pst.setString(6, aboneplaka);
                                            pst.setString(7, abonetarih);

                                            pst.executeUpdate();


                                    }catch(Exception ex){
                                            ex.printStackTrace();
                                           
                                    }
                            }
                    %>       
    
            

           <div class="col-12 col-md-6 offset-md-3 "  >        
                <div class="form-group col-12 p-0">
                        <div class="card-header">
                                <h5 class="card-title">Yeni Abone Ekle</h5>
                        </div>
                    <div class="card-body"   >
                            
                            
                            
                                <form id="form" method="post" action="aboneEkle.jsp">
                                    
                                        
                                        <div class="form-group">
                                                <label class="form-label">Kayit Numarasi</label>
                                                <input type="aboneid" name="aboneid" id="aboneid" class="form-control" placeholder="Kayit Numarasini yaziniz">
                                        </div>
                                        
                                        <div class="form-group">
                                                <label class="form-label">Abonenin Adi</label>
                                                <input type="aboneisim" name="aboneisim" id="aboneisim" class="form-control" placeholder="Abonenin adini yaziniz">
                                        </div>
                                    
                                        <div class="form-group">
                                                <label class="form-label">Abonenin Soyadi</label>
                                                <input type="abonesoyisim" name="abonesoyisim" id="abonesoyisim"  class="form-control" placeholder="Abonenin soyadini yaziniz">
                                        </div>
                                    
                                        <div class="form-group">
                                                <label class="form-label">Aboneye Ait Mail Adresi</label>
                                                <input class="form-control" name="abonemail" id="abonemail"  placeholder="Abonenin mail adresini yaziniz" rows="1">
                                        </div>
                                        
                                         <div class="form-group">
                                                <label class="form-label">Aboneye Ait Telefon Numarasi</label>
                                                <input class="form-control"  name="abonetel" id="abonetel" placeholder="Abonenin telefon numarasini yaziniz" rows="1">
                                         </div><!-- comment -->
                                         
                                          <div class="form-group">
                                                <label class="form-label">Aboneye Ait Plaka Numarasi</label>
                                                <input class="form-control" name="aboneplaka" id="aboneplaka"  placeholder="abonenin plasini yaziniz" rows="1">
                                        </div>
                                         
                                           <div class="form-group">
                                                <label class="form-label">Abonenin Giris Tarihi</label>
                                                <input type="date" class="form-control" name="abonetarih" id="abonetarih"  placeholder="Abonenin otoparka giris saaitini yaziniz" rows="1">
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