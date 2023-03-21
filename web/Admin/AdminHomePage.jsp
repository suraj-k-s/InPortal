<%-- 
    Document   : AdminHomePage
    Created on : Aug 9, 2022, 2:26:31 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Admin Home Page</title>
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
        <!--Counter-->

        <!--skycons-icons-->
        <script src="../AdminPageProperties/js/skycons.js"></script>
        <!--//skycons-icons-->
        <style>
            body{margin-top:0px;}
            .preloader {
                position: fixed;
                left: 0;
                width: 0;
                height: 100%;
                width: 100%;
                text-align: center;
                z-index: 9999999;
                -webkit-transition: .9s;
                transition: .9s;
            }

            .preloader .loader {
                position: absolute;
                width: 80px;
                height: 80px;
                border-radius: 50%;
                display: inline-block;
                left: 0;
                right: 0;
                margin: 0 auto;
                top: 45%;
                -webkit-transform: translateY(-45%);
                transform: translateY(-45%);
                -webkit-transition: 0.5s;
                transition: 0.5s;
            }

            .preloader .loader .loader-outter {
                position: absolute;
                border: 4px solid #ffffff;
                border-left-color: transparent;
                border-bottom: 0;
                width: 100%;
                height: 100%;
                border-radius: 50%;
                -webkit-animation: loader-outter 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
                animation: loader-outter 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
            }

            .preloader .loader .loader-inner {
                position: absolute;
                border: 4px solid #ffffff;
                border-radius: 50%;
                width: 60px;
                height: 60px;
                left: calc(40% - 21px);
                top: calc(40% - 21px);
                border-right: 0;
                border-top-color: transparent;
                -webkit-animation: loader-inner 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
                animation: loader-inner 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
            }

            .preloader .loader .indicator {
                position: absolute;
                right: 0;
                left: 0;
                top: 50%;
                -webkit-transform: translateY(-50%) scale(1.5);
                transform: translateY(-50%) scale(1.5);
            }

            .preloader .loader .indicator svg polyline {
                fill: none;
                stroke-width: 2;
                stroke-linecap: round;
                stroke-linejoin: round;
            }

            .preloader .loader .indicator svg polyline#back {
                stroke: #ffffff;
            }

            .preloader .loader .indicator svg polyline#front {
                stroke: #1A76D1;
                stroke-dasharray: 12, 36;
                stroke-dashoffset: 48;
                -webkit-animation: dash 1s linear infinite;
                animation: dash 1s linear infinite;
            }

            .preloader::before, .preloader::after {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                height: 100%;
                width: 60%;
                z-index: -1;
                background: #fff;
                //background: #1A76D1;
                -webkit-transition: .9s;
                transition: .9s;
            }

            .preloader::after {
                left: auto;
                right: 0;
            }

            .preloader.preloader-deactivate {
                visibility: hidden;
            }

            .preloader.preloader-deactivate::after, .preloader.preloader-deactivate::before {
                width: 0;
            }

            .preloader.preloader-deactivate .loader {
                opacity: 0;
                visibility: hidden;
            }

            @-webkit-keyframes loader-outter {
                0% {
                    -webkit-transform: rotate(0deg);
                    transform: rotate(0deg);
                }
                100% {
                    -webkit-transform: rotate(360deg);
                    transform: rotate(360deg);
                }
            }

            @keyframes loader-outter {
                0% {
                    -webkit-transform: rotate(0deg);
                    transform: rotate(0deg);
                }
                100% {
                    -webkit-transform: rotate(360deg);
                    transform: rotate(360deg);
                }
            }

            @-webkit-keyframes loader-inner {
                0% {
                    -webkit-transform: rotate(0deg);
                    transform: rotate(0deg);
                }
                100% {
                    -webkit-transform: rotate(-360deg);
                    transform: rotate(-360deg);
                }
            }

            @keyframes loader-inner {
                0% {
                    -webkit-transform: rotate(0deg);
                    transform: rotate(0deg);
                }
                100% {
                    -webkit-transform: rotate(-360deg);
                    transform: rotate(-360deg);
                }
            }

            @-webkit-keyframes dash {
                62.5% {
                    opacity: 0;
                }
                to {
                    stroke-dashoffset: 0;
                }
            }

            @keyframes dash {
                62.5% {
                    opacity: 0;
                }
                to {
                    stroke-dashoffset: 0;
                }
            }
        </style>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script> 
        <script>

            $(window).on('load', function() {
                //for use in production please remove this setTimeOut
                setTimeout(function() {
                    $('.preloader').addClass('preloader-deactivate');
                }, 1500);
                //uncomment this line for use this snippet in production
                //	$('.preloader').addClass('preloader-deactivate');
            });

        </script>
    </head>
    <body>
        <!--Loader-->
        <div class="preloader">
            <div class="loader">
                <div class="loader-outter"></div>
                <div class="loader-inner"></div>

                <div class="indicator"> 

                    <svg width="16px" height="12px">
                    <img src="loader.gif" style="width: 3em;margin-right:3em;">
                    <!--    <polyline id="back" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                        <polyline id="front" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>  -->
                    </svg>
                </div>
            </div>
        </div>
        <!-- Loader Ends-->
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
                    <div class="inner-block">
                        <!--market updates updates-->
                        <div class="market-updates">
                            <div class="col-md-4 market-update-gd">
                                <div class="market-update-block clr-block-1">
                                    <div class="col-md-8 market-update-left">
                                        <%
                                            String select = "select count(*) as Total from tbl_company where company_vstatus='1'";
                                            ResultSet res = con.selectCommand(select);
                                            res.next();
                                        %>   
                                        <h3 class="counter"><%=res.getString("Total")%></h3>
                                        <h4>Registered Company</h4>
                                        <p>Other hand, we denounce</p>
                                    </div>
                                    <div class="col-md-4 market-update-right">
                                        <i class="fa fa-file-text-o"> </i>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                            <div class="col-md-4 market-update-gd">
                                <div class="market-update-block clr-block-2">
                                    <div class="col-md-8 market-update-left">
                                        <%
                                            String select2 = "select count(*) as Total2 from tbl_student";
                                            ResultSet res2 = con.selectCommand(select2);
                                            res2.next();
                                        %>   
                                        <h3 class="counter"><%=res2.getString("Total2")%></h3>
                                        <h4>Registered Students</h4>
                                        <p>Other hand, we denounce</p>
                                    </div>
                                    <div class="col-md-4 market-update-right">
                                        <i class="fa fa-eye"> </i>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <!--market updates end here-->
                        <!--mainpage chit-chating-->

                        <br><br><br><br><br><br><br><br><br><br><br><br><br>


                    </div>
                    <!--inner block end here-->
                    <!--copy rights start here-->
                    <div class="copyrights">
                        <p>© 2022 InPortal. All Rights Reserved | Design by  <a href="#" target="_blank">PSST</a> </p>
                    </div>	
                    <!--COPY rights end here-->
                </div>
            </div>
            <!--slider menu-->
            <div class="sidebar-menu">
                <div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
                        <!--<img id="logo" src="" alt="Logo"/>--> 
                    </a> </div>		  
                <div class="menu">
                    <div class="menu" style="background-color: #202121!important;">
                <ul id="menu" >
                    <li id="menu-home" ><a href="AdminHomePage.jsp"><i class="fa fa-tachometer"></i><span>Dashboard</span></a></li>
                    <li><a href="#"><i class="fa fa-map-marker"></i><span>Location</span><span class="fa fa-angle-right" style="float: right"></span></a>
                        <ul>
                            <li><a href="State.jsp">State</a></li>
                            <li><a href="District.jsp">District</a></li>
                            <li><a href="Place.jsp">Place</a></li>
                        </ul>
                    </li>
                    <li id="menu-comunicacao" ><a href="#"><i class="fa fa-book nav_icon"></i><span>Register</span><span class="fa fa-angle-right" style="float: right"></span></a>
                        <ul id="menu-comunicacao-sub" >
                            <li id="menu-mensagens" ><a href="CompanySector.jsp">Company Sector</a></li>
                            <li id="menu-arquivos" ><a href="CompanyPosition.jsp">Company Position</a></li>
                        </ul>
                    </li>
                    <li id="menu-comunicacao" ><a href="#"><i class="fa fa-check nav_icon"></i><span>Approval</span><span class="fa fa-angle-right" style="float: right"></span></a>
                        <ul id="menu-comunicacao-sub" >
                            <li id="menu-mensagens"><a href="CompanyApproval.jsp">Company Approval</a></li>
                            <li id="menu-arquivos" ><a href="CompanyReject.jsp">Company Reject</a></li>
                        </ul>
                    </li>
                    <li id="menu-academico" ><a href="#"><i class="fa fa-file-text"></i><span>Report</span><span class="fa fa-angle-right" style="float: right"></span></a>
                        <ul id="menu-academico-sub" >
                            <li id="menu-academico-boletim" ><a href="Report1.jsp">Report 1</a></li>
                            <li id="menu-academico-avaliacoes" ><a href="Report2.jsp">Report 2</a></li>		           
                        </ul>
                    </li>
                    <li><a href="Chart.jsp"><i class="fa fa-bar-chart"></i><span>Charts</span></a></li>
                    <li><a href="#"></a></li><li><a href="#"></a></li><li><a href="#"></a></li><li><a href="#"></a></li><li><a href="#"></a></li><li><a href="#"></a></li><li><a href="#"></a></li><li><a href="#"></a></li><li><a href="#"></a></li>
                </ul>
            </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!--slide bar menu end here-->
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
        <script>
            $(document).ready(function() {

                $('.counter').each(function() {
                    $(this).prop('Counter', 0).animate({
                        Counter: $(this).text()
                    }, {
                        duration: 4000,
                        easing: 'swing',
                        step: function(now) {
                            $(this).text(Math.ceil(now));
                        }
                    });
                });

            });
        </script>
    </body>
</html>
