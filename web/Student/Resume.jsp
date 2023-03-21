<%-- 
    Document   : Resume
    Created on : Aug 26, 2022, 6:33:35 PM
    Author     : Georgekutty
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Resume</title>
         <link href='https://fonts.googleapis.com/css?family=Roboto:400,500,400italic,300italic,300,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <!-- FontAwesome JS-->
	<script defer src="../Assets/ResumeProperties/fontawesome/js/all.min.js"></script>
    <!-- Global CSS -->
    <link rel="stylesheet" href="../Assets/ResumeProperties/plugins/bootstrap/css/bootstrap.min.css">   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <!-- Theme CSS -->  
    <link id="theme-style1" name="style1" rel="stylesheet" href="../Assets/ResumeProperties/css/orbit-4.css" >
     <link id="theme-style2" rel="stylesheet" href="../Assets/ResumeProperties/css/orbit-3.css" disabled>
     <link id="theme-style3" rel="stylesheet" href="../Assets/ResumeProperties/css/orbit-6.css" disabled>
     <link id="theme-style4" rel="stylesheet" href="../Assets/ResumeProperties/css/orbit-5.css" disabled>
     <link id="theme-style5" rel="stylesheet" href="../Assets/ResumeProperties/css/orbit-1.css" disabled>
     <link id="theme-style6" rel="stylesheet" href="../Assets/ResumeProperties/css/orbit-2.css" disabled>
    <script>
         // window.location="Resume.jsp";
        function change1(){

          let button = document.querySelector('#theme-style1');  
            // button.setAttribute("name", "helloButton");
            button.setAttribute("disabled", "");
        
           document.getElementById("theme-style2").removeAttribute("disabled");
          
        }
         function change2(){
      
          let button = document.querySelector('#theme-style1');  
            // button.setAttribute("name", "helloButton");
            button.setAttribute("disabled", "");
        let button2 = document.querySelector('#theme-style2');  
            // button.setAttribute("name", "helloButton");
            button2.setAttribute("disabled", "");

           document.getElementById("theme-style3").removeAttribute("disabled");
        }
         function change3(){
            
         let button = document.querySelector('#theme-style3');  
            // button.setAttribute("name", "helloButton");
            button.setAttribute("disabled", "");
             document.getElementById("theme-style1").removeAttribute("disabled");
        }
       
    </script>
    <script>
         function change4(){
            
         let button = document.querySelector('#theme-style1');  
            button.setAttribute("disabled", "");
         
             document.getElementById("theme-style4").removeAttribute("disabled");
        }
         function change5(){
            
         let button = document.querySelector('#theme-style4');  
            button.setAttribute("disabled", "");
            
         
             document.getElementById("theme-style5").removeAttribute("disabled");
        }
        function change6(){
            
         let button = document.querySelector('#theme-style5');  
            button.setAttribute("disabled", "");
         
             document.getElementById("theme-style6").removeAttribute("disabled");
        }
      
        </script>
        
    </head>
    <body>
      
        <jsp:include page="StudentHomeHeader.jsp" /> 
<!--   <div class="container">
    <div class="row">
         <div class="col text-center">
    <button class="btn btn-primary" onclick="change1()" id="btn1">Change1</button>
     <button class="btn btn-primary" onclick="change2()">Change2</button>
      <button class="btn btn-primary" onclick="change3()">Change3</button>
      </div>
      </div>
      </div>-->

     <%
         
     String select ="select * from tbl_resume where resume_id='"+request.getParameter("id")+"'";
     ResultSet res =con.selectCommand(select);
     res.next();
     %>   
     
     <div class="row">
         <div class="col mb-3">
             <div class="canvas_div_pdf" >
    <div class="wrapper mt-lg-5" style="margin-left: 11em;">
        <div class="sidebar-wrapper" style="width:280px!important;">
            <div class="profile-container">
                <img class="profile" src="../Assets/Resume/<%=res.getString("image")%>"  style="height: 10.3em;width: 10em;border-radius: 150px;"/>
                <h1 class="name" style="font-size:25px;font-weight:700;"><%=res.getString("name")%></h1>
                <h3 class="tagline"><%=res.getString("title")%></h3>
            </div><!--//profile-container-->
            
            <div class="contact-container container-block">
                <ul class="list-unstyled contact-list">
                    <li class="email"><i class="fa-solid fa-envelope"></i><a href="#"><%=res.getString("email")%></a></li>
                    <li class="phone"><i class="fa-solid fa-phone"></i><a href="#"><%=res.getString("contact")%></a></li>
                    <li class="website"><i class="fa-solid fa-globe"></i><a href="#" target="_blank"><%=res.getString("website")%></a></li>
                    <li class="linkedin"><i class="fa-brands fa-linkedin-in"></i><a href="#" target="_blank"><%=res.getString("linkedin")%></a></li>
                    <li class="github"><i class="fa-brands fa-github"></i><a href="#" target="_blank"><%=res.getString("github")%></a></li>
                    <li class="twitter"><i class="fa-brands fa-twitter"></i><a href="#" target="_blank"><%=res.getString("twitter")%></a></li>
                </ul>
            </div><!--//contact-container-->
            <div class="education-container container-block">
                <h2 class="container-block-title">Education</h2>
                <div class="item">
                    <h4 class="degree"><%=res.getString("graduation")%></h4>
                    <h5 class="meta"><%=res.getString("graduation_college")%></h5>
	            <div class="time"><%=res.getString("graduation_university")%></div>
                    <div class="time"><%=res.getString("graduation_year")%></div>
                </div><!--//item-->
                <div class="item">
                    <h4 class="degree"><%=res.getString("post_graduation")%></h4>
                    <h5 class="meta"><%=res.getString("post_graduation_college")%></h5>
                    <div class="time"><%=res.getString("post_graduation_university")%></div>
                     <div class="time"><%=res.getString("post_graduation_year")%></div>
                </div><!--//item-->
            </div><!--//education-container-->
            
            <div class="languages-container container-block">
                <h2 class="container-block-title">Languages</h2>
                <ul class="list-unstyled interests-list">
                    <li><%=res.getString("language1")%> </li>
                    <li><%=res.getString("language2")%> </li>
                    <li><%=res.getString("language3")%></li>
                     <li><%=res.getString("language4")%></li>
                </ul>
            </div><!--//interests-->
            
            <div class="interests-container container-block">
                <h2 class="container-block-title">Interests</h2>
                <ul class="list-unstyled interests-list">
                    <li><%=res.getString("interest1")%></li>
                    <li><%=res.getString("interest2")%></li>
                     <li><%=res.getString("interest3")%></li>
                     <li><%=res.getString("interest4")%></li>
                </ul>
            </div><!--//interests-->
            
        </div><!--//sidebar-wrapper-->
        
        <div class="main-wrapper">
            
            <section class="section summary-section">
                <h2 class="section-title"><span class="icon-holder"><i class="fa-solid fa-user"></i></span>Career Objective</h2>
                <div class="summary">
                    <p><%=res.getString("objective")%></p>
                </div><!--//summary-->
            </section><!--//section-->
            
            <section class="section experiences-section">
                <h2 class="section-title"><span class="icon-holder"><i class="fa-solid fa-briefcase"></i></span>Internships</h2>
                
                <div class="item">
                    <div class="meta">
                        <div class="upper-row">
                            <h3 class="job-title"><%=res.getString("internship_title")%></h3>
                            <div class="time"><%=res.getString("internship_year")%></div>
                        </div><!--//upper-row-->
                        <div class="company"><%=res.getString("internship_company")%></div>
                    </div><!--//meta-->
                    <div class="details">
                        <p><%=res.getString("internship_des")%></p>  
                       
                    </div><!--//details-->
                </div><!--//item-->
                
                <div class="item">
                    <div class="meta">
                        <div class="upper-row">
                            <h3 class="job-title"><%=res.getString("internship2_title")%></h3>
                            <div class="time"><%=res.getString("internship2_year")%></div>
                        </div><!--//upper-row-->
                        <div class="company"><%=res.getString("internship2_company")%></div>
                    </div><!--//meta-->
                    <div class="details">
                        <p><%=res.getString("internship2_des")%></p>  
                        
                    </div><!--//details-->
                </div><!--//item-->
                
              
                
            </section><!--//section-->
            
            <section class="section projects-section">
                <h2 class="section-title"><span class="icon-holder"><i class="fa-solid fa-archive"></i></span>Projects</h2>
                
                <div class="item">
                    <h3 class="job-title"><%=res.getString("project_title")%></h3>
                    <br>
                    <span class="project-title"> </span> <span class="project-tagline"><%=res.getString("project_des")%></span>
                    
                </div><!--//item-->
                <div class="item">
                    <h3 class="job-title"><%=res.getString("project2_title")%></h3>
                    <br>
                    <span class="project-title"></span> <span class="project-tagline"><%=res.getString("project2_des")%></span>
                </div><!--//item-->
               
               
              
            </section><!--//section-->
            <!--Certification-->
             <section class="section projects-section">
                <h2 class="section-title"><span class="icon-holder"><i class="fa-solid fa-certificate"></i></span>Certification</h2>
                
                <div class="item">
                    <span class="project-title"></span><span class="project-tagline"><%=res.getString("certification1")%></span>
                    
                </div><!--//item-->
                <div class="item">
                    <span class="project-title"></span><span class="project-tagline"><%=res.getString("certification2")%></span>
                </div><!--//item-->
                <div class="item">
                    <span class="project-title"></span><span class="project-tagline"><%=res.getString("certification3")%></span>
                </div><!--//item-->
               
              
            </section><!--//section-->
            <!--certification ends-->
            
            <section class="skills-section section">
                <h2 class="section-title"><span class="icon-holder"><i class="fa-solid fa-rocket"></i></span>Skills &amp; Proficiency</h2>
                <div class="skillset">        
                    <div class="item">
                        <h3 class="level-title"><%=res.getString("skill1")%></h3>
                        <div class="progress level-bar">
						    <div class="progress-bar theme-progress-bar" role="progressbar" style="width: <%=res.getString("p1")%>%" aria-valuenow="99" aria-valuemin="0" aria-valuemax="100"></div>
						</div>                               
                    </div><!--//item-->
                    
                    <div class="item">
                        <h3 class="level-title"><%=res.getString("skill2")%></h3>
                        <div class="progress level-bar">
						    <div class="progress-bar theme-progress-bar" role="progressbar" style="width:<%=res.getString("p2")%>%" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100"></div>
						</div>                              
                    </div><!--//item-->
                    
                    <div class="item">
                        <h3 class="level-title"><%=res.getString("skill3")%></h3>
                        <div class="progress level-bar">
						    <div class="progress-bar theme-progress-bar" role="progressbar" style="width: <%=res.getString("p3")%>%" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100"></div>
						</div>                                 
                    </div><!--//item-->
                    
                    <div class="item">
                        <h3 class="level-title"><%=res.getString("skill4")%></h3>
                        <div class="progress level-bar">
							    <div class="progress-bar theme-progress-bar" role="progressbar" style="width:<%=res.getString("p4")%>%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
						</div>                                
                    </div><!--//item-->
                    
                    <div class="item">
                        <h3 class="level-title"><%=res.getString("skill5")%></h3>
                        <div class="progress level-bar">
						    <div class="progress-bar theme-progress-bar" role="progressbar" style="width: <%=res.getString("p5")%>%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
						</div>                                  
                    </div><!--//item-->
                    
                  
                    
                </div>  
            </section><!--//skills-section-->
            
        </div><!--//main-body-->
    </div>
     </div> 
    </div> 
<div class="col-12 col-md-3 mb-3" style="margin-top: 3em;">                                           
    <!--right panel-->
     <div class="" style="width: 200px;">
    <div class="card p-3">
      <div class="e-navlist e-navlist--active-bg">
          <ul class="nav" style="color:#3d348b;">
              <li class="nav-item"><a class="nav-link px-2 active" href="#personal"><span style="color:#499259;" onclick="change1()"><i class="fa fa-fw fa-paint-brush"></i>Choose me..</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="#education" ><span style="color:#3c5560;" onclick="change2()"><i class="fa fa-fw fa-paint-brush"></i>Choose me..</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="#language" ><span style="color:#81425f;" onclick="change3()"><i class="fa fa-fw fa-paint-brush"></i>Choose me..</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="#interest" ><span style="color:#ca8238;" onclick="change4()"><i class="fa fa-fw fa-paint-brush"></i>Choose me..</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="#project" ><span style="color:#35869a;" onclick="change5()"><i class="fa fa-fw fa-paint-brush"></i>Choose me..</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="#internship" ><span style="color:#3d8a7e;" onclick="change6()"><i class="fa fa-fw fa-paint-brush"></i>Choose me..</span></a></li>
           
        </ul>
          <button type="button" onclick="getPDF()" class="btn btn-primary">Save PDF</button>
      </div>
    </div>
  </div>
    
    <!-- right panel ends-->
    </div>
  </div>  
          <br>
          <br>
        
        
         <jsp:include page="StudentHomeFooter.jsp" /> 
         <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
         <script>
	function getPDF(){

		var HTML_Width = $(".canvas_div_pdf").width();
		var HTML_Height = $(".canvas_div_pdf").height();
		var top_left_margin = 15;
		var PDF_Width = HTML_Width+(top_left_margin*2);
		var PDF_Height = (PDF_Width*1.5)+(top_left_margin*2);
		var canvas_image_width = HTML_Width;
		var canvas_image_height = HTML_Height;
		
		var totalPDFPages = Math.ceil(HTML_Height/PDF_Height)-1;
		

		html2canvas($(".canvas_div_pdf")[0],{allowTaint:true}).then(function(canvas) {
			canvas.getContext('2d');
			
			console.log(canvas.height+"  "+canvas.width);
			
			
			var imgData = canvas.toDataURL("image/jpeg", 1.0);
			var pdf = new jsPDF('p', 'pt',  [PDF_Width, PDF_Height]);
		    pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin,canvas_image_width,canvas_image_height);
			
			
			for (var i = 1; i <= totalPDFPages; i++) { 
				pdf.addPage(PDF_Width, PDF_Height);
				pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
			}
			
        pdf.save("<%=res.getString("name")%> Resume.pdf");
        });
	};
         </script>
    </body>
</html>
