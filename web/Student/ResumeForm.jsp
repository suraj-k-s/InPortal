<%-- 
    Document   : Resume
    Created on : Aug 25, 2022, 12:45:31 PM
    Author     : Georgekutty
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Resume Form</title>
        <style>
            body{
    margin-top:20px;
    background:#f8f8f8
}
.card{
    position: inherit!important;
}
.nav-item{
    font-weight: 700 !important;
}
.nav-link{
    color:#3d348b!important;
}
        </style>       
          <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
          <jsp:include page="StudentHomeHeader.jsp" /> 
        
<div class="container">
    
<div class="row flex-lg-nowrap">
   
  
    <div class="row">
       
      <div class="col mb-3" style="overflow: scroll;height: 600px;">
     <!--FOrm Tag-->
     <%
     String select="select * from tbl_student where student_id='"+session.getAttribute("student_id")+"'";
     ResultSet res = con.selectCommand(select);
     res.next();
     %> 
        <div class="card">
          <div class="card-body">
            <div class="e-profile">
   <form id="myform" method="post" enctype="multipart/form-data" action="../Assets/Action/ResumeAction.jsp">       
         <div class="row">
                <div class="col-12 col-sm-auto mb-3">
                  <div class="mx-auto" style="width: 140px;">
                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                        <img src="../Assets/images/user-512.webp" id="profile-image" style="height: 10em;width: 9em;" alt=""/>
                    </div>
                  </div>
                </div>
                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3"  id="personal">
                  <div class="text-center text-sm-left mb-2 mb-sm-0">
                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap"><%=res.getString("student_name")%></h4>
                    <p class="mb-0"><%=res.getString("student_email")%></p>
                    <div class="text-muted"><small>Create Your Dream Resume..</small></div>
                    <div class="mt-2">
                     
                    
                        <i class="fa fa-fw fa-camera"></i>
                        <span>Change Photo</span>
                         <input type="file"  class="btn btn-primary" id="profile-image-upload" name="fileimage" accept='image/*'  onchange="readURL(this)">
                     
                    </div>
                  </div>
                  <div class="text-center text-sm-right">
                    <span class="badge badge-secondary">Student</span>
                    <div class="text-muted"><small></small></div>
                  </div>
                </div>
              </div>
    
              <ul class="nav nav-tabs" >
                <li class="nav-item"><a href="" class="active nav-link">Personal</a></li>
              
              </ul>
              <div class="tab-content pt-3">
                <div class="tab-pane active">
 
                
                 
  
     
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label>Full Name</label>
                              <input class="form-control" type="text" name="name" placeholder="" value="">
                            </div>
                          </div>
                          <div class="col">
                            <div class="form-group">
                              <label>Title</label>
                              <input class="form-control" type="text" name="title" placeholder="eg:Full Stack Developer" value="">
                            </div>
                          </div>
                        </div>
                        
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label>Email</label>
                              <input class="form-control" type="email" name="email" placeholder="user@example.com">
                            </div>
                          </div>
                             <div class="col">
                            <div class="form-group">
                              <label>Contact</label>
                              <input class="form-control" type="text" name="contact" placeholder="">
                            </div>
                          </div>
                        </div>
                             <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label>Website</label>
                              <input class="form-control" type="text" name="website" placeholder="www.example.com">
                            </div>
                          </div>
                             <div class="col">
                            <div class="form-group">
                              <label>Linked in</label>
                              <input class="form-control" type="text" name="linkedin" placeholder="enter profile url">
                            </div>
                          </div>
                        </div>
                              <div class="row" >
                          <div class="col">
                            <div class="form-group">
                              <label>Github</label>
                              <input class="form-control" type="text" name="github" placeholder="enter profile url">
                            </div>
                          </div>
                             <div class="col">
                            <div class="form-group">
                              <label>Twitter</label>
                              <input class="form-control" type="text" name="twitter" placeholder="enter profile url">
                            </div>
                          </div>
                        </div>
                       
                        <div class="row" id="education">
                          <div class="col mb-3">
                            <div class="form-group">
                              <label>Career Objective</label>
                              <textarea class="form-control" rows="5" placeholder="My Bio" name="objective"></textarea>
                            </div>
                          </div>
                        </div>
                 
                        <ul class="nav nav-tabs" >
                       <li class="nav-item"><a href="" class="active nav-link">Education</a></li>
                        </ul>
                      <br>
                    <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Graduation</label>
                              <input class="form-control" type="text" name="graduation" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>College Name</label>
                              <input class="form-control" type="text" name="cname" placeholder="" value="">
                            </div>
                          </div>
                    </div>
                     <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>University</label>
                              <input class="form-control" type="text" name="uname" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Year</label>
                              <input class="form-control" type="text" name="gyear" placeholder="" value="">
                            </div>
                          </div>
                    </div>
                   <div class="row" >
                     <div class="col">
                            <div class="form-group">
                              <label>Post-Graduation</label>
                              <input class="form-control" type="text" name="pname" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>College Name</label>
                              <input class="form-control" type="text" name="c2name" placeholder="" value="">
                            </div>
                          </div>
                    </div>
                   <div class="row" id="language">
                     <div class="col">
                            <div class="form-group">
                              <label>University</label>
                              <input class="form-control" type="text" name="u2name" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Year</label>
                              <input class="form-control" type="text" name="pyear" placeholder="" value="">
                            </div>
                          </div>
                   </div>
                  
              
                <ul class="nav nav-tabs" >
                    <li class="nav-item"><a href="" class="active nav-link">Languages</a></li>
                 </ul>
                      <br>
                           
                   <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Language 1</label>
                              <input class="form-control" type="text" name="txt_language1">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Language 2</label>
                              <input class="form-control" type="text" name="txt_language2">
                            </div>
                          </div>
                    </div>
                                 
                   <div class="row" id="interest">
                      <div class="col">
                            <div class="form-group">
                              <label>Language 3</label>
                              <input class="form-control" type="text" name="txt_language3" >
                            </div>
                          </div>
                     
                      <div class="col">
                            <div class="form-group">
                              <label>Language 4</label>
                              <input class="form-control" type="text" name="txt_language4" >
                            </div>
                          </div>
                    </div>
                 
     
                <ul class="nav nav-tabs" >
                <li class="nav-item"><a href="" class="active nav-link">Interests</a></li>
              
              </ul>
                      <br>
                  <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Interest 1</label>
                              <input class="form-control" type="text" name="i1" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Interest 2</label>
                              <input class="form-control" type="text" name="i2" placeholder="" value="">
                            </div>
                          </div>
                    </div>
        
                         <div class="row" id="project">
                     <div class="col">
                            <div class="form-group">
                              <label>Interest 3</label>
                              <input class="form-control" type="text" name="i3" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Interest 4</label>
                              <input class="form-control" type="text" name="i4" placeholder="" value="">
                            </div>
                          </div>
                    </div>
                     
                       <ul class="nav nav-tabs" >
                <li class="nav-item"><a href="" class="active nav-link">Projects</a></li>
              
              </ul>
                      <br>
                        <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Title</label>
                              <input class="form-control" type="text" name="ptitle" placeholder="" value="">
                            </div>
                          </div>
                        </div>    
                      <div class="row">
                    <div class="col">
                            <div class="form-group">
                              <label>Description</label>
                              <textarea class="form-control" cols="40" rows="5" name="d1"></textarea>
                            </div>
                          </div>
                    </div>
                       <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Title</label>
                              <input class="form-control" type="text" name="p1title" placeholder="" value="">
                            </div>
                          </div>
                      </div>
                       <div class="row" id="internship">
                    <div class="col">
                            <div class="form-group">
                              <label>Description</label>
                              <textarea class="form-control" cols="40" rows="5" name="d2"></textarea>
                            </div>
                          </div>
                    </div>
                   
                <ul class="nav nav-tabs" >
                <li class="nav-item"><a href="" class="active nav-link">Internship</a></li>
              
              </ul>
                      <br>
                         <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Title</label>
                              <input class="form-control" type="text" name="intitle" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Company Name</label>
                              <input class="form-control" type="text" name="coname" placeholder="" value="">
                            </div>
                          </div>
                    </div>
                          <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Year</label>
                              <input class="form-control" type="text" name="inyear" placeholder="" value="">
                            </div>
                          </div>
                      </div>
                       <div class="row">
                    <div class="col">
                            <div class="form-group">
                              <label>Description</label>
                              <textarea class="form-control" cols="40" rows="5" name="ind"></textarea>
                            </div>
                          </div>
                    </div>
                       <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Title</label>
                              <input class="form-control" type="text" name="intitle2" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Company Name</label>
                              <input class="form-control" type="text" name="coname2" placeholder="" value="">
                            </div>
                          </div>
                    </div>
                          <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Year</label>
                              <input class="form-control" type="text" name="inyear2" placeholder="" value="">
                            </div>
                          </div>
                      </div>
                       <div class="row" id="certification">
                    <div class="col">
                            <div class="form-group">
                              <label>Description</label>
                              <textarea class="form-control" cols="40" rows="5" name="ind2"></textarea>
                            </div>
                          </div>
                    </div>
                         <ul class="nav nav-tabs" >
                <li class="nav-item"><a href="" class="active nav-link">Certification</a></li>
              
              </ul>
                      <br>
                       <div class="row">
                    <div class="col">
                            <div class="form-group">
                              <label>Certification 1</label>
                              <textarea class="form-control" cols="40" rows="2" name="cd1"></textarea>
                            </div>
                          </div>
                    </div>
                         <div class="row">
                    <div class="col">
                            <div class="form-group">
                              <label>Certification 2</label>
                              <textarea class="form-control" cols="40" rows="2" name="cd2"></textarea>
                            </div>
                          </div>
                    </div>
                         <div class="row" id="skill">
                    <div class="col">
                            <div class="form-group">
                              <label>Certification 3</label>
                              <textarea class="form-control" cols="40" rows="2" name="cd3"></textarea>
                            </div>
                          </div>
                    </div>
             <ul class="nav nav-tabs" >
                <li class="nav-item"><a href="" class="active nav-link">Skills & Proficiency</a></li>
              
              </ul>
                      <br>
                      <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Skill 1</label>
                              <input class="form-control" type="text" name="skill1" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Percentage</label>
                              <input class="form-control" type="text" name="p1" placeholder="eg:85%" value="">
                            </div>
                          </div>
                    </div>  
                       <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Skill 2</label>
                              <input class="form-control" type="text" name="skill2" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Percentage</label>
                              <input class="form-control" type="text" name="p2" placeholder="eg:85%" value="">
                            </div>
                          </div>
                    </div>  
                       <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Skill 3</label>
                              <input class="form-control" type="text" name="skill3" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Percentage</label>
                              <input class="form-control" type="text" name="p3" placeholder="eg:85%" value="">
                            </div>
                          </div>
                    </div> 
                       <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Skill 4</label>
                              <input class="form-control" type="text" name="skill4" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Percentage</label>
                              <input class="form-control" type="text" name="p4" placeholder="eg:85%" value="">
                            </div>
                          </div>
                    </div>  
                       <div class="row">
                     <div class="col">
                            <div class="form-group">
                              <label>Skill 5</label>
                              <input class="form-control" type="text" name="skill5" placeholder="" value="">
                            </div>
                          </div>
                    <div class="col">
                            <div class="form-group">
                              <label>Percentage</label>
                              <input type="range" class="form-range" min="0" max="100" value="50" name="p5" >
                            
                            </div>
                          </div>
                        
                    </div>  
                    <div class="row">
                      <div class="col d-flex justify-content-end">
                        <button class="btn btn-primary" type="submit" name="btnsubmit">Generate Resume</button>
                      </div>
                    </div>
               
   
                </div>
                  
              </div>
          </form>
            </div>
            
          </div>
             
        </div>
       
      </div>

      <div class="col-12 col-md-3 mb-3">
       
       
         
             <div class="position-fixed" style="width: 13em;"> 
  <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
    <div class="card p-3">
      <div class="e-navlist e-navlist--active-bg">
          <ul class="nav" style="color:#3d348b">
          <li class="nav-item"><a class="nav-link px-2 active" href="#personal"><i class="fa fa-fw fa-user-circle"></i><span>Personal</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="#education" ><i class="fa fa-fw fa-graduation-cap"></i><span>Education</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="#language" ><i class="fa fa-fw fa-globe"></i><span>Language</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="#interest" ><i class="fa fa-fw fa-book"></i><span>Interest</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="#project" ><i class="fa fa-fw fa-product-hunt"></i><span>Project</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="#internship" ><i class="fa fa-fw fa-building"></i><span>Internship</span></a></li>
           <li class="nav-item"><a class="nav-link px-2" href="#certification" ><i class="fa fa-fw fa-certificate"></i><span>Certification</span></a></li>
            <li class="nav-item"><a class="nav-link px-2" href="#skill" ><i class="fa fa-fw fa-globe"></i><span>Skill</span></a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
         
      
      </div>
    </div>


</div>
</div>
             <jsp:include page="StudentHomeFooter.jsp" /> 
    </body>
     <script>
$('#profile-image').on('click', function(callback) {
    $('#profile-image-upload').click();
});
 function readURL(input) {
    if (input.files && input.files[0]) {
   
      var reader = new FileReader();
      reader.onload = function (e) {
        document.querySelector("#profile-image").setAttribute("src",e.target.result);
      };

      reader.readAsDataURL(input.files[0]);
    }
  }

</script>
<script>
   
</script>
</html>
