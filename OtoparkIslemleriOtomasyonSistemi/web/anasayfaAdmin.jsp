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
								<a class="dropdown-item" href="cikisAdmin.jsp">Cikis Yap</a>
							</div>
                                                    
                                                    
						</li>
					</ul>
				</div>
			</nav>

			<main class="content">
				<div class="container-fluid p-0">

					<div class="row mb-2 mb-xl-3">
						<div class="col-auto d-none d-sm-block">
							<h3><strong> </strong> Anasayfa</h3>
						</div>
                                            

						
					</div>
					<div class="row">
						<div class="col-md-6">
                                                    <div class="card">
                                                        <div class="card-body" data-url="aboneEkle.jsp">
                                                            <h2>
                                                                Abone Ekle
                                                            </h2>
                                                        </div>
                                                    </div>
                                                    
						</div>
                                            
                                            <div class="col-md-6">
                                                    <div class="card">
                                                        <div class="card-body" data-url="aboneGoruntule.jsp">
                                                            <h2>
                                                                Aboneleri görüntüle
                                                            </h2>
                                                        </div>
                                                    </div>
                                                    
						</div>
                                            
                                            <div class="col-md-6">
                                                    <div class="card">
                                                        <div class="card-body" data-url="uyeGoruntule.jsp">
                                                            <h2>
                                                                Sisteme Üye Olan Aboneleri Görüntüle
                                                            </h2>
                                                        </div>
                                                    </div>
                                                    
						</div>
                                            
                                            <div class="col-md-6">
                                                    <div class="card">
                                                        <div class="card-body" data-url="sifreDegisAdmin.jsp">
                                                            <h2>
                                                                Sifremi Degistir
                                                            </h2>
                                                        </div>
                                                    </div>
                                                    
						</div>

					
					</div>

					<div class="row">
						<div class="col-12 col-md-6 col-xxl-3 d-flex order-2 order-xxl-3">
							
						</div>

				</div>
			</main>

		</div>
	</div>

            <style>
                .card-body{
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 200px;
                    cursor: pointer;
                }
                .card{
                    background-color: #222e3c;
                }
                
                .card-body h2{
                    color:white;
                }
            </style>
            
            
	<script src="js/vendor.js"></script>
	<script src="js/app.js"></script>

	<script>
    $(function(){
        $(".card-body").click(function(){
            window.location = $(this).data('url');
        });
    });
        </script>

</body>

</html>