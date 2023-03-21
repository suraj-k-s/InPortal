<%-- 
    Document   : CompanyHomePage
    Created on : Aug 15, 2022, 5:50:22 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Company HomePage</title>
        <style>
.animate-charcter
{
   text-transform: uppercase;
  background-image: linear-gradient(
    -225deg,
    #231557 0%,
    #44107a 29%,
    #ff1361 67%,
    #fff800 100%
  );
  background-size: auto auto;
  background-clip: border-box;
  background-size: 200% auto;
  color: #fff;
  background-clip: text;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: textclip 2s linear infinite;
  display: inline-block;
      font-size: 42px;
}

@keyframes textclip {
  to {
    background-position: 200% center;
  }
}


        </style>
    </head>
    <body>
        <jsp:include page="CompanyHomeHeader.jsp" /> 
       <div style="font-weight:200;font-weight: 600;margin-left: 5.5em;margin-top: 3em;">
    <a href="#"> Home</a> <i class="fas fa-angle-double-right"></i> <a href="#"></a>
</div>
  <div class="container">
  <div class="row">
      <div class="col-md-12 text-center" style="position:inherit;">
        <h3 style="margin-right: 2em;margin-top: 2em">Welcome</h3>
      <h3 class="animate-charcter" style="padding: 67px;margin-bottom: 4em;font-weight: 600;"> 
       <%   out.print(session.getAttribute("company_name")); %> </h3>
    </div>
  </div>
</div>

       <jsp:include page="CompanyHomeFooter.jsp" /> 
    </body>
    <script>
        
    </script>
</html>
