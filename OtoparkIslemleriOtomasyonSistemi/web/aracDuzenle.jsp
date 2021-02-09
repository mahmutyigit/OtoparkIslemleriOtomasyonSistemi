
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
                                         String query = "update araclar set aboneIsim = ?, aboneSoyisim = ?, abonePlaka= ?, aboneMail =? ,aboneTel= ? ,kayitTarihi= ?  where kayitNo = ?";

                                        PreparedStatement pst = con.prepareStatement(query);


                                      
                                        pst.setString(1, aboneIsim);
                                        pst.setString(2, aboneSoyisim);
                                        pst.setString(3, abonePlaka);
                                        pst.setString(4, aboneMail);
                                        pst.setString(5, aboneTel);
                                        pst.setString(6, kayitTarihi);
                                        pst.setString(7, kayitNo);
                                        
                                        pst.executeUpdate();

                                        color = "green";
                                        msg = "Yapilan degisiklikler kaydedildi...";


                                }catch(Exception ex){
                                        ex.printStackTrace();
                                        color = "red";
                                        msg = "Duzenleme islemi basarisiz oldu...";
                                }
                           }
                   %>    
    
    <div class="form-group col-12 p-0">
        <h4 style="color:<%= color %>"><%= msg %></h4>
    </div>
    
 
    
            

          
                            
                            
                                <form id="form" method="post" action="aracDuzenle.jsp">
                                    
                                    
                                     <% 

                                   PreparedStatement pst;
                                   ResultSet rs;

                                   Class.forName("com.mysql.jdbc.Driver");
                                   con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/otopark","root","root");

                                   String id = request.getParameter("id");

                                   pst = con.prepareStatement("select * from araclar where kayitNo = ?");
                                   pst.setString(1, id);
                                   rs = pst.executeQuery();

                                   while(rs.next())
                                   {

                                %>   
                                    
                        <div class="col-12 col-xl-6"  style="padding-left:280px;" >        
                            <div class="form-group col-12 p-0">
                                    <div class="card-header">
                                            <h5 class="card-title">Kayitli Araci Duzenle</h5>
                                    </div>
                                <div class="card-body">

                                    
                                        
                                        <div class="form-group">
                                                <label class="form-label">Kayit Numaraniz</label>
                                                <input type="text" name="kayitNo" id="aboneIsim" class="form-control" value="<%= rs.getString("kayitNo") %>"> 
                                        </div>
                                        

                                        
                                        
                                        
                                        
                                        
                                        <div class="form-group">
                                                <label class="form-label">Arac Sahibinin Ismi</label>
                                                <input type="aboneIsim" name="aboneIsim" id="aboneIsim" class="form-control" placeholder="Adiniz" value="<%= rs.getString("aboneIsim") %>">
                                        </div>
                                    
                                        <div class="form-group">
                                                <label class="form-label">Arac Sahibinin Soyismi</label>
                                                <input type="aboneSoyisim" name="aboneSoyisim" id="aboneSoyisim"  class="form-control" value="<%= rs.getString("aboneSoyisim") %>">
                                        </div>
                                    
                                        <div class="form-group">
                                                <label class="form-label">Aracin Plakasi</label>
                                                <input class="form-control" name="abonePlaka" id="abonePlaka" rows="1" value="<%= rs.getString("abonePlaka") %>">
                                        </div>
                                        
                                         <div class="form-group">
                                                <label class="form-label">Arac Sahibinin Mail Adresi</label>
                                                <input class="form-control"  name="aboneMail" id="aboneMail" rows="1" value="<%= rs.getString("aboneMail") %>">
                                         </div><!-- comment -->
                                         
                                          <div class="form-group">
                                                <label class="form-label">Arac Sahibinin Telefon Numarasi</label>
                                                <input class="form-control" name="aboneTel" id="aboneTel" rows="1" value="<%= rs.getString("aboneTel") %>">
                                        </div>
                                         
                                           <div class="form-group">
                                                <label class="form-label">Arac Kayit Tarihi</label>
                                                <input class="form-control" name="kayitTarihi" id="kayitTarihi" rows="1" value="<%= rs.getString("kayitTarihi") %>">
                                        </div>
                                    
                                        
                                        
                                        <button type="submit" class="btn btn-primary">Kaydet</button>
                                        
                                        
                                        
                                   
                                        
                                        
                                        
                                        
                                </form>
                        </div>
                </div>
        </div>
                    
                          <br/>

                                    <%
                                        }
                                    %>   
               

		</div>
	</div>

	<script src="js/vendor.js"></script>
	<script src="js/app.js"></script>

        
        <%--
	<script>
		$(function() {
			var ctx = document.getElementById('chartjs-dashboard-line').getContext("2d");
			var gradient = ctx.createLinearGradient(0, 0, 0, 225);
			gradient.addColorStop(0, 'rgba(215, 227, 244, 1)');
			gradient.addColorStop(1, 'rgba(215, 227, 244, 0)');
			// Line chart
			new Chart(document.getElementById("chartjs-dashboard-line"), {
				type: 'line',
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "Sales ($)",
						fill: true,
						backgroundColor: gradient,
						borderColor: window.theme.primary,
						data: [
							2115,
							1562,
							1584,
							1892,
							1587,
							1923,
							2566,
							2448,
							2805,
							3438,
							2917,
							3327
						]
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					tooltips: {
						intersect: false
					},
					hover: {
						intersect: true
					},
					plugins: {
						filler: {
							propagate: false
						}
					},
					scales: {
						xAxes: [{
							reverse: true,
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}],
						yAxes: [{
							ticks: {
								stepSize: 1000
							},
							display: true,
							borderDash: [3, 3],
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}]
					}
				}
			});
		});
	</script>
	<script>
		$(function() {
			// Pie chart
			new Chart(document.getElementById("chartjs-dashboard-pie"), {
				type: 'pie',
				data: {
					labels: ["Chrome", "Firefox", "IE"],
					datasets: [{
						data: [4306, 3801, 1689],
						backgroundColor: [
							window.theme.primary,
							window.theme.warning,
							window.theme.danger
						],
						borderWidth: 5
					}]
				},
				options: {
					responsive: !window.MSInputMethodContext,
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					cutoutPercentage: 75
				}
			});
		});
	</script>
	<script>
		$(function() {
			// Bar chart
			new Chart(document.getElementById("chartjs-dashboard-bar"), {
				type: 'bar',
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "This year",
						backgroundColor: window.theme.primary,
						borderColor: window.theme.primary,
						hoverBackgroundColor: window.theme.primary,
						hoverBorderColor: window.theme.primary,
						data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
						barPercentage: .75,
						categoryPercentage: .5
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					scales: {
						yAxes: [{
							gridLines: {
								display: false
							},
							stacked: false,
							ticks: {
								stepSize: 20
							}
						}],
						xAxes: [{
							stacked: false,
							gridLines: {
								color: "transparent"
							}
						}]
					}
				}
			});
		});
	</script>
	<script>
		$(function() {
			$("#world_map").vectorMap({
				map: "world_mill",
				normalizeFunction: "polynomial",
				hoverOpacity: .7,
				hoverColor: false,
				regionStyle: {
					initial: {
						fill: "#e3eaef"
					}
				},
				markerStyle: {
					initial: {
						"r": 9,
						"fill": window.theme.primary,
						"fill-opacity": .95,
						"stroke": "#fff",
						"stroke-width": 7,
						"stroke-opacity": .4
					},
					hover: {
						"stroke": "#fff",
						"fill-opacity": 1,
						"stroke-width": 1.5
					}
				},
				backgroundColor: "transparent",
				zoomOnScroll: false,
				markers: [{
						latLng: [31.230391, 121.473701],
						name: "Shanghai"
					},
					{
						latLng: [28.704060, 77.102493],
						name: "Delhi"
					},
					{
						latLng: [6.524379, 3.379206],
						name: "Lagos"
					},
					{
						latLng: [35.689487, 139.691711],
						name: "Tokyo"
					},
					{
						latLng: [23.129110, 113.264381],
						name: "Guangzhou"
					},
					{
						latLng: [40.7127837, -74.0059413],
						name: "New York"
					},
					{
						latLng: [34.052235, -118.243683],
						name: "Los Angeles"
					},
					{
						latLng: [41.878113, -87.629799],
						name: "Chicago"
					},
					{
						latLng: [51.507351, -0.127758],
						name: "London"
					},
					{
						latLng: [40.416775, -3.703790],
						name: "Madrid"
					}
				]
			});
			setTimeout(function() {
				$(window).trigger('resize');
			}, 250)
		});
	</script>
	<script>
		$(function() {
			$('#datetimepicker-dashboard').datetimepicker({
				inline: true,
				sideBySide: false,
				format: 'L'
			});
		});
	</script>
        --%>


</body>

</html>