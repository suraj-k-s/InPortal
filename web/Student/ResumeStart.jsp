<%-- 
    Document   : ResumeStart
    Created on : Sep 18, 2022, 4:36:52 PM
    Author     : Georgekutty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Resume Start</title>
        <style>
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
            .ml9 {
                position: relative;
                font-weight: 200;
                font-size: 4em;
                margin-left: 1em;
            }

            .ml9 .text-wrapper {
                position: relative;
                display: inline-block;
                padding-top: 0.2em;
                padding-right: 0.05em;
                padding-bottom: 0.1em;
                overflow: hidden;
            }

            .ml9 .letter {
                transform-origin: 50% 100%;
                display: inline-block;
                line-height: 1.1em;
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
        <br>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-8">
                    <img src="../Assets/images/resume-maker.gif" style="width:52em ;height:">  
                </div>
                <div class="col-4">
                    <h1 class="ml9" style="font-family:system-ui!important;font-size: 56px;font-weight: 200;">
                        <span class="text-wrapper">
                            <span class="letters">Create your professional Resume</span>

                        </span>
                    </h1> 
               
                    <div style="margin-top:10em ;margin-left: 3em;">
                        <a href="ResumeForm.jsp" class="cta">
                            <span>Get Started</span>
                            <svg width="13px" height="10px" viewBox="0 0 13 10">
                            <path d="M1,5 L11,5"></path>
                            <polyline points="8 1 12 5 8 9"></polyline>
                            </svg>
                        </a>
                    </div>
                    </div>

                </div>

            </div>
            <br>
            <br>
            <jsp:include page="StudentHomeFooter.jsp" /> 
            <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
    </body>
    <script>
        // Wrap every letter in a span
        var textWrapper = document.querySelector('.ml9 .letters');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

        anime.timeline({loop: true})
                .add({
                    targets: '.ml9 .letter',
                    scale: [0, 1],
                    duration: 1500,
                    elasticity: 600,
                    delay: (el, i) => 45 * (i + 1)
                }).add({
            targets: '.ml9',
            opacity: 0,
            duration: 1000,
            easing: "easeOutExpo",
            delay: 1000
        });
    </script>

</html>
