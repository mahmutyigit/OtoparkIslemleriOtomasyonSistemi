




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
                                                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Aboneleri Goruntule</span>
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
                                                           <span class="text-dark">Admin Paneli</span>
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
<main class="content">
    <div class="container-fluid p-0">

            <h1 class="h3 mb-3"></h1>

            <div class="row">


            <div class="col-12 ">
               <div class="card">
                       <div class="card-header">
                               <h5 class="card-title">SISTEME KAYITLI UYELERIN LISTESI</h5>
                       </div>
                   
                   
                       <table width="100%" class="table">
                               <thead>
                                       <tr>
                                               <th>Uye Adi </th>
                                               <th>Uye Soyadi</th>
                                               <th>Uye Telefon Numarasi</th>
                                               <th>Uye Plaka Numarasi</th>
                                               <th>Uye Email Adresi</th><!-- comment -->

                                               <th></th>
                                       </tr>
                               </thead>
                               <tbody>
                                   
                                   
                                   
                                   
                                   
                                    
                                    <% 
                                    Connection con;
                                        PreparedStatement pst;
                                        ResultSet rs;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/otopark","root","root");

                                        String query = "Select * from abonekaydol";
                                        pst = con.prepareStatement(query);
                                        rs = pst.executeQuery();

                                        while(rs.next()){
                                    %>
                                   
                                   
                                   
                                    <tr>
                                    <th scope="row"><%= rs.getString("isim") %></th>
                                    <td><%=rs.getString("soyisim")%></td>
                                    <td><%=rs.getString("telNo")%></td>
                                    <td><%=rs.getString("plakaNo")%></td>
                                    <td><%=rs.getString("email")%></td><!-- comment -->
                                   
                                    

                                   <td class="table-action">
                                      
                                        <a href="uyeSil.jsp?id=<%=rs.getString("email") %>"><i class="align-middle" data-feather="trash"></i></a>
                                    </td>
                                 
                                    

                                </tr>
                                <% 
                                    }
                                %>  
                                   
                                   
                                   
                                   
                                 
                               </tbody>
                       </table>
                                
                                
                                
                                
               </div>           
               </div>
                                </main>
		</div>
	</div>


	<script src="js/vendor.js"></script>
	<script src="js/app.js"></script>

	
</body>

</html>








               </div>
       </div>
                    
                    