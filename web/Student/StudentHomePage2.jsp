<%-- 
    Document   : CompanyHomePage2
    Created on : Sep 1, 2022, 10:30:05 PM
    Author     : Georgekutty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style >
.cta {
  position: relative;
  margin: auto;
  padding: 19px 22px;
  transition: all 0.2s ease;
  color:#111;
}
.cta:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  border-radius: 28px;
  background: #ff4049;
  width: 56px;
  height: 56px;
  transition: all 0.3s ease;
}
.cta span {
  position: relative;
  font-size: 16px;
  line-height: 18px;
  //font-weight: 900;
  letter-spacing: 0.25em;
  text-transform: uppercase;
  vertical-align: middle;
}
.cta svg {
  position: relative;
  top: 0;
  margin-left: 10px;
  fill: none;
  stroke-linecap: round;
  stroke-linejoin: round;
  stroke: #111;
  stroke-width: 2;
  transform: translateX(-5px);
  transition: all 0.3s ease;
}
.cta:hover:before {
  width: 100%;
  background: #ffa500;
}
.cta:hover svg {
  transform: translateX(0);
}
.cta:active {
  transform: scale(0.96);
}
.letter{
    font-family:system-ui!important;
}


 .letter {

  line-height: 1em;
}
        </style>
    </head>
    <body>
        <jsp:include page="StudentHomeHeader.jsp" />
        <div class="container">
            <div class="row">
               
                <div class="col-3">
                    <h1 class="ml12"  style="font-family:system-ui!important;font-size: 56px;font-weight: 200;">
                        Welcome to your professional community
                    </h1>
                    <div style="margin-top:14em ;margin-left: 3em;">
                        <a href="../Student/StudentChat.jsp" class="cta">
                            <span>Chat</span>
                            <svg width="13px" height="10px" viewBox="0 0 13 10">
                            <path d="M1,5 L11,5"></path>
                            <polyline points="8 1 12 5 8 9"></polyline>
                            </svg>
                        </a>
                        
                        <br>
                        <br>
                        <br>
                        <a href="../404.jsp" class="cta">
                            <span>Learn More</span>
                            <svg width="13px" height="10px" viewBox="0 0 13 10">
                            <path d="M1,5 L11,5"></path>
                            <polyline points="8 1 12 5 8 9"></polyline>
                            </svg>
                        </a>
                        
                    </div>  
                </div>
                 <div class="col-9">
                    <img src="../Assets/images/8.gif">
                </div>
            </div>
        </div>

        <jsp:include page="StudentHomeFooter.jsp" /> 

    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
    <script>
        // Wrap every letter in a span
        var textWrapper = document.querySelector('.ml12');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter' >$&</span>");

        anime.timeline({loop: true})
                .add({
                    targets: '.ml12 .letter',
                    translateX: [40, 0],
                    translateZ: 0,
                    opacity: [0, 1],
                    easing: "easeOutExpo",
                    duration: 1200,
                    delay: (el, i) => 500 + 30 * i
                }).add({
            targets: '.ml12 .letter',
            translateX: [0, -30],
            opacity: [1, 0],
            easing: "easeInExpo",
            duration: 1100,
            delay: (el, i) => 100 + 30 * i
        });
    </script>
</html>
