<%-- 
    Document   : AdminHeader
    Created on : Aug 9, 2022, 2:30:34 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NavBar</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <link href="../Assets/AdminPageProperties/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <!-- Custom Theme files -->
        <link href="../Assets/AdminPageProperties/css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <!--js-->
        <script src="../Assets/AdminPageProperties/js/jquery-2.1.1.min.js"></script> 
        <!--icons-css-->
        <link href="../Assets/AdminPageProperties/css/font-awesome.css" rel="stylesheet"> 
        <!--Google Fonts-->
        <link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>



        <!--skycons-icons-->
        <script src="../AdminPageProperties/js/skycons.js"></script>
        <!--//skycons-icons-->
    </head>
    <body>
        <div class="page-container">	
            <div class="left-content">
                <div class="mother-grid-inner">
                    <!--header start here-->
                    <div class="header-main">
                        <div class="header-left">
                            <div class="logo-name">
                                <a href="AdminHomePage.jsp"><h1> <i class="fa fa-linkedin" aria-hidden="true"></i>Portal</h1> 
                                </a> 								
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="header-right">
                            <div class="profile_details">		
                                <ul>
                                    <li class="dropdown profile_details_drop">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                            <div class="profile_img">	
                                                <span class="prfil-img"><img src="images/p1.png" alt=""> </span> 
                                                <div class="user-name">
                                                    <p><%
                                                        out.print(session.getAttribute("admin_name"));
                                                        %>
                                                    </p>
                                                    <span>Administrator</span>
                                                </div>
                                                <i class="fa fa-angle-down lnr"></i>
                                                <i class="fa fa-angle-up lnr"></i>
                                                <div class="clearfix"></div>	
                                            </div>	
                                        </a>
                                        <ul class="dropdown-menu drp-mnu">
                                            <li> <a href="../Guest/Login.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="clearfix"> </div>				
                        </div>
                        <div class="clearfix"> </div>	
                    </div>
                    <!--heder end here-->
                    <!-- script-for sticky-nav -->
                    <script>
                        $(document).ready(function() {
                            var navoffeset = $(".header-main").offset().top;
                            $(window).scroll(function() {
                                var scrollpos = $(window).scrollTop();
                                if (scrollpos >= navoffeset) {
                                    $(".header-main").addClass("fixed");
                                } else {
                                    $(".header-main").removeClass("fixed");
                                }
                            });

                        });
                    </script>
                    <!-- /script-for sticky-nav -->
                    <!--inner block start here-->
                    <script>
                        var toggle = true;

                        $(".sidebar-icon").click(function() {
                            if (toggle)
                            {
                                $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
                                $("#menu span").css({"position": "absolute"});
                            }
                            else
                            {
                                $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
                                setTimeout(function() {
                                    $("#menu span").css({"position": "relative"});
                                }, 400);
                            }
                            toggle = !toggle;
                        });
                    </script>
                    <!--scrolling js-->
                    <script src="..../Assets/AdminPageProperties/js/jquery.nicescroll.js"></script>
                    <script src="..../Assets/AdminPageProperties/js/scripts.js"></script>
                    <!--//scrolling js-->
                    <script src="../Assets/AdminPageProperties/js/bootstrap.js"></script>
                    <!-- mother grid end here-->

                    </body>
                    </html>
