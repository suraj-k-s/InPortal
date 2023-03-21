<%-- 
    Document   : GuestHomeHeader
    Created on : Aug 11, 2022, 4:03:47 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>InPortal::Guest Home Header</title>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>DigitalEdu an Education Category Bootstrap Responsive Website Template - Home : W3Layouts</title>
    <!--/google-fonts-->
    <link href="//fonts.googleapis.com/css2?family=Nunito:ital,wght@0,400;0,600;0,700;1,400&display=swap"
        rel="stylesheet">
    <!--//google-fonts-->
    <!-- Template CSS -->
    <link rel="stylesheet" href="../Assets/GuestHomeProperties/css/style-starter.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    </head>
    <body>
       <!--header-->
    <header id="site-header" class="fixed-top" style="background-color: #15151f;">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark stroke">
                <h1 style="color: white;"><a class="navbar-brand" href="index.html">
                     <a href="#linkedin" class="linkedin"><span class="fa fa-linkedin" style="color:orange;margin-top: 4px;"></span></a>Portal
                    </a></h1>
                <!-- if logo is image enable this   
      <a class="navbar-brand" href="#index.html">
          <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
      </a> -->
                <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
                    data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
                    <span class="navbar-toggler-icon fa icon-close fa-times"></span>
                    </span>
                </button>

                <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                    <nav class="mr-auto ml-lg-5">
                        <div class="search-bar">
                            <form class="search">
                                <input type="search" class="search__input" name="search"
                                    placeholder="Search for Courses.." onload="equalWidth()" required>
                                <span class="fa fa-search search__icon"></span>
                            </form>
                        </div>
                    </nav>
                    <ul class="navbar-nav mr-auto" style="color:white;">
                        <li class="nav-item active">
                            <a class="nav-link" href="../">Home </a>
                        </li>
                      
                       
                      <li class="nav-item">
                            <a class="nav-link dropdown-toggle d-lg-flex align-items-center" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Register <i class="fas fa-chevron-down ml-lg-1"></i>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="CompanyRegistration.jsp">Company</a>
                                <a class="dropdown-item" href="StudentRegistration.jsp">Student</a>
                               
                            </div>
                        </li>
                          <li class="nav-item">
                            <a class="nav-link" href="Login.jsp">Login</a>
                        </li>
                    </ul>
                </div>
                <!-- toggle switch for light and dark theme -->

                <div class="mobile-position">
                    <nav class="navigation">
                        <div class="theme-switch-wrapper">
                            <label class="theme-switch" for="checkbox">
                                <input type="checkbox" id="checkbox">
                                <div class="mode-container py-1">
                                    <i class="gg-sun"></i>
                                    <i class="gg-moon"></i>
                                </div>
                            </label>
                        </div>
                    </nav>
                </div>
                <!-- //toggle switch for light and dark theme -->
            </nav>
        </div>
    </header>
    <!--/header-->
    
       <script src="../Assets/GuestHomeProperties/js/jquery-3.3.1.min.js"></script> <!-- Common jquery plugin -->

    <script src="../Assets/GuestHomeProperties/js/theme-change.js"></script><!-- theme switch js (light and dark)-->
    <!-- /MENU-JS -->
   <script>
        $(window).on("scroll", function () {
            var scroll = $(window).scrollTop();

            if (scroll >=1200) {
                $("#site-header").addClass("nav-fixed");
            } else {
                $("#site-header").removeClass("nav-fixed");  
            }
        });

    </script>  
  <!--   //MENU-JS-->

  

    <!--bootstrap-->
    <script src="../Assets/GuestHomeProperties/js/bootstrap.min.js"></script>
    </body>
  
    <!-- //bootstrap-->
</html>
