<%-- 
    Document   : AdminSideBar
    Created on : Aug 10, 2022, 12:12:10 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        <!--slider menu-->
        <div class="sidebar-menu" >
            <div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
                    <!--<img id="logo" src="" alt="Logo"/>--> 
                </a> </div>		  
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
                            <li id="menu-mensagens" ><a href="CompanyApproval.jsp">Company Approval</a>		              
                            </li>
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
        <div class="clearfix"> </div>
    </div>
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
