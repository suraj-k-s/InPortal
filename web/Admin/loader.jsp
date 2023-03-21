<%-- 
    Document   : newjsp
    Created on : Aug 19, 2022, 8:36:56 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<title>Loader Demo</title>
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
  //background: #1A76D1;
  background: #fff;
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
body{
    background:#eee;
}

.card {
    box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: 1rem;
}

.card-body {
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.5rem 1.5rem;
}
.avatar-text {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    background: #000;
    color: #fff;
    font-weight: 700;
}

.avatar {
    width: 3rem;
    height: 3rem;
}
.rounded-3 {
    border-radius: 0.5rem!important;
}
.mb-2 {
    margin-bottom: 0.5rem!important;
}
.me-4 {
    margin-right: 1.5rem!important;
}
	</style>
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>

<body>
  <div class="preloader" >
    <div class="loader" >
        <div class="loader-outter" ></div>
        <div class="loader-inner" ></div>

        <div class="indicator"  s> 
          
            <svg width="16px" height="12px"  >
            <img src="loader.gif" style="width: 3em;margin-right:3em;">
            </svg>
        </div>
    </div>
</div>
    <div class="container">
    <div class="text-center mb-5">
      <h3>Jobs openning</h3>
      <p class="lead">Eros ante urna tortor aliquam nisl magnis quisque hac</p>
    </div>
    <div class="card mb-3">
      <div class="card-body">
        <div class="d-flex flex-column flex-lg-row">
          <span class="avatar avatar-text rounded-3 me-4 mb-2">FD</span>
          <div class="row flex-fill">
            <div class="col-sm-5">
              <h4 class="h5">Junior Frontend Developer</h4>
              <span class="badge bg-secondary">WORLDWIDE</span> <span class="badge bg-success">$60K - $100K</span>
            </div>
            <div class="col-sm-4 py-2">
              <span class="badge bg-secondary">REACT</span>
              <span class="badge bg-secondary">NODE</span>
              <span class="badge bg-secondary">TYPESCRIPT</span>
              <span class="badge bg-secondary">JUNIOR</span>
            </div>
            <div class="col-sm-3 text-lg-end">
              <a href="#" class="btn btn-primary stretched-link">Apply</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="card mb-3">
      <div class="card-body">
        <div class="d-flex flex-column flex-lg-row">
          <span class="avatar avatar-text rounded-3 me-4 bg-warning mb-2">BE</span>
          <div class="row flex-fill">
            <div class="col-sm-5">
              <h4 class="h5">Senior Backend Engineer</h4>
              <span class="badge bg-secondary">US</span> <span class="badge bg-success">$90K - $180K</span>
            </div>
            <div class="col-sm-4 py-2">
              <span class="badge bg-secondary">GOLANG</span>
              <span class="badge bg-secondary">SENIOR</span>
              <span class="badge bg-secondary">ENGINEER</span>
              <span class="badge bg-secondary">BACKEND</span>
            </div>
            <div class="col-sm-3 text-lg-end">
              <a href="#" class="btn btn-primary stretched-link">Apply</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="card mb-3">
      <div class="card-body">
        <div class="d-flex flex-column flex-lg-row">
          <span class="avatar avatar-text rounded-3 me-4 bg-info mb-2">PM</span>
          <div class="row flex-fill">
            <div class="col-sm-5">
              <h4 class="h5">Director of Product Marketing</h4>
              <span class="badge bg-secondary">WORLDWIDE</span> <span class="badge bg-success">$150K - $210K</span>
            </div>
            <div class="col-sm-4 py-2">
              <span class="badge bg-secondary">PRODUCT MARKETING</span>
              <span class="badge bg-secondary">MARKETING</span>
              <span class="badge bg-secondary">EXECUTIVE</span>
              <span class="badge bg-secondary">ECOMMERCE</span>
            </div>
            <div class="col-sm-3 text-lg-end">
              <a href="#" class="btn btn-primary stretched-link">Apply</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script> 
<script>
    
$(window).on('load', function() {
    //for use in production please remove this setTimeOut
    setTimeout(function(){ 
        $('.preloader').addClass('preloader-deactivate');
    }, 1500);
    //uncomment this line for use this snippet in production
    //	$('.preloader').addClass('preloader-deactivate');
});

</script>
</html>

