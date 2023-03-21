<%-- 
    Document   : PaymentConfirm
    Created on : Aug 21, 2022, 8:44:48 PM
    Author     : Georgekutty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Payment Confirmation</title>
        <style>
            body{margin-top:20px;}
.mail-seccess {
    text-align: center;
	background: #fff;
	border-top: 1px solid #eee;
}
.mail-seccess .success-inner {
	display: inline-block;
}
.mail-seccess .success-inner h1 {
	font-size: 100px;
	text-shadow: 3px 5px 2px #3333;
	color: #006DFE;
	font-weight: 700;
}
.mail-seccess .success-inner h1 span {
	display: block;
	font-size: 25px;
	color: #333;
	font-weight: 600;
	text-shadow: none;
	margin-top: 20px;
}
.mail-seccess .success-inner p {
	padding: 20px 15px;
}
.mail-seccess .success-inner .btn{
	color:#fff;
}
        </style>
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
 // -webkit-animation: loader-inner 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
  //        animation: loader-inner 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
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
    setTimeout(function(){ 
        $('.preloader').addClass('preloader-deactivate');
    }, 3500);
    //uncomment this line for use this snippet in production
    //	$('.preloader').addClass('preloader-deactivate');
});

</script>
       
    </head>
    <body>
               <div class="preloader">
    <div class="loader">
        <div class="loader-outter"></div>
        <div class="loader-inner"></div>

        <div class="indicator"> 
          
           
            <img src="../Assets/images/giphy.gif" style="width: 10em;margin-left:-3em;"/>
           
            
        </div>
    </div>
</div>
    <jsp:include page="StudentHomeHeader.jsp" />     
       <!--Loader-->
  
<section class="mail-seccess section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-12">
				<!-- Error Inner -->
				<div class="success-inner">
                                    <h1><i class="far fa-check-circle" style="color:green"></i><span>Your Payment was Successfull!</span></h1>
					<p>Please check the mail box for more details.</p>
					<a href="#" class="btn btn-primary btn-lg">Go Home</a>
				</div>
				<!--/ End Error Inner -->
			</div>
		</div>
	</div>
</section>
<br>
<br>
<br>
<br>
  <jsp:include page="StudentHomeFooter.jsp" /> 
    </body>
</html>
