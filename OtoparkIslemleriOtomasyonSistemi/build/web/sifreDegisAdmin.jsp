<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>

<!doctype html>
<html lang="en">
<head>
        <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Web UI Kit &amp; Dashboard Template based on Bootstrap">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, web ui kit, dashboard template, admin template">

	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<title>Sifremi Degistir</title>


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
    
    

                     <%
    if("POST".equalsIgnoreCase(request.getMethod()))
    {
        if(request.getParameter("sifreDegis")!=null)
        {
            if(request.getParameter("sifreDegis").equals("Sifre Degistir"))
            {
                String emailA = request.getParameter("emailA");
                String newpass = request.getParameter("newpass");
                String newpassagain = request.getParameter("newpassagain");
                
                if((!emailA.isEmpty()) && (!newpass.isEmpty()) && (!newpassagain.isEmpty()))
                {
                    if(newpass.equals(newpassagain))
                    {
                        Connection con = null;
                        PreparedStatement ps;
                        ResultSet rs;
                        String query;
                        
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                        }
                        catch(Exception e)
                        {
                            System.out.println(e);
                            
                        }
                        try
                        {
                            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/otopark","root","root");
                            query = "select * from adminkaydol where emailA=?";
                            ps = con.prepareStatement(query);
                            ps.setString(1, emailA);

                            
                            rs = ps.executeQuery();
                            
                            if(rs.next())
                            {
                                query = "update adminkaydol set sifreA=? where emailA=?";
                                ps = con.prepareStatement(query);
                                ps.setString(1,newpass);
                                ps.setString(2,request.getParameter("emailA"));
                                ps.executeUpdate();
                                out.println("<br> Sifre degistirildi. <br>");
                            }
                            else
                            {
                                out.println("!!!!");
                            }

                        }
                        catch(SQLException e)
                        {
                            System.out.println(e);
                        }
                        
                        
                        
                        
                    }
                }
            }
        }
    }
    
    
%>  






<div class="col-12 col-md-6 offset-md-3 "  >        
                <div class="form-group col-12 p-0">
                        <div class="card-header">
                                <h5 class="card-title">Sifremi Degistir</h5>
                        </div>
                    <div class="card-body"   >
                            
                            
                            
                                <form id="form" method="post" action="">
                                    
                                        
                                        <div class="form-group">
                                                <label class="form-label">Email Adresiniz</label>
                                                <input type="aboneid" name="emailA" class="form-control" >
                                        </div>
                                        
                                        <div class="form-group">
                                                <label class="form-label">Yeni Sifre</label>
                                                <input type="password" name="newpass" class="form-control">
                                        </div>
                                    
                                        <div class="form-group">
                                                <label class="form-label">Yeni Sifreyi Tekrar Giriniz</label>
                                                <input type="password" name="newpassagain"  class="form-control">
                                        </div>
                                    


                                        <button type="submit" name="sifreDegis" value="Sifre Degistir" class="btn btn-primary">Kaydet</button>
                                </form>
                        </div>
                </div>
        </div>


</body>
</html>