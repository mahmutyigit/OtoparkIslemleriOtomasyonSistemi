<%-- 
    Document   : index
    Created on : 05.Şub.2021, 21:02:49
    Author     : Mahmut Yiğit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    <style>
        body{
            margin: 0;
        }
        .header{
            background-image: 
                linear-gradient(to left bottom, rgba(191, 191, 191, 0.7),rgba(64, 64, 64, 0.9)), 
                url(arka.jpg); 
                height: 100vh;  
                background-size: cover;
                background-position: top;   
                display:flex;
                width:100%;
                height:100vh;
                justify-content:center;
                align-items:center;
        }
        a{
            font-size:50px;
            height: 50px;
            line-height: 50px;
            border:1px solid #262626;
            text-decoration: none;
            color: #ffff74;
            background-color: #262626;
            border-radius: 10px;
            padding: 20px 40px;
            
        }
        
    </style>
</head>
<body>
    <header class="header">
        <div>
            <a href="aboneGiris.jsp">Abone Giris Yap</a>
            <a href="adminGiris.jsp">Admin Giris Yap</a>
        </div>
       
        
        
    
    
        
        
        
        
    </header>
   
    
</body>
</html>
