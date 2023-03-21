<%-- 
    Document   : MyProfile
    Created on : Aug 13, 2022, 9:07:55 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Student My Profile</title>
        <link href="MyProfile.css" type="text/css" rel="stylesheet">
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
         <style>
             .col-md-3 {
                 position:inherit!important;
             } 
             .col-md-5{
                 position: inherit!important;
             }
         </style>
         <script>
function myFunction() {
  document.getElementById("txt_mobile").removeAttribute("readonly");
   document.getElementById("txt_address").removeAttribute("readonly");
    document.getElementById("txt_email").removeAttribute("readonly");
     document.getElementById("btn1").removeAttribute("disabled");
     document.getElementById("cpbtn").removeAttribute("disabled");
}
function myFunction1() {
 
     document.getElementById("cpbtn").removeAttribute("disabled");
}
</script>
    </head>
    <body>
           <%
                 
                 String sel="";
                  sel="select * from tbl_student  where student_id='"+session.getAttribute("student_id")+"'";
                  ResultSet rs=con.selectCommand(sel);
                  while(rs.next())
                  {

        %>  
       <jsp:include page="StudentHomeHeader.jsp" /> 
       <form method="post">
           <div class="de">
       <div class="container ">
    <div class="row">
        <div class="col-md-3 border-right" >
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="../Assets/StudentPhoto/<%=rs.getString("student_photo")%>"><span class="font-weight-bold"><%=rs.getString("student_name")%></span><span class="text-black-50"><%=rs.getString("student_email")%></span><span> </span></div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5" >
                <div class="d-flex justify-content-between align-items-center mb-3" >
                    <h4 class="text-right">Profile Settings</h4>
                    <i class="fas fa-key" style="margin-left: 14em;" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="myFunction1()"></i>
                    <!-- Popup menu -->
                    
                    <!-- Button trigger modal -->
 <%
    if(request.getParameter("btn2")!=null){
    String sel1="";
    String cpass ="select student_name,student_password from tbl_student where student_id='"+session.getAttribute("student_id")+"'"; 
    ResultSet rs1=con.selectCommand(cpass);
    if(rs1.next()){
    if(rs1.getString("student_password").equals(request.getParameter("cpass"))){ 
        if(request.getParameter("npass").equals(request.getParameter("copass"))){
           
            String update_query ="update tbl_student set student_password='"+request.getParameter("npass")+"'  where student_id='"+session.getAttribute("student_id")+"'";
            con.executeCommand(update_query);
            %>
            
            
        
        <script>
            alert("Password Changed Successfully");
            window.location="StudentMyProfile.jsp";
        </script>
        <%
    }
else{
%>
        <script>
            alert("Password Mismatch");
            window.location="StudentMyProfile.jsp";
        </script>
        <%
}

   
    
}
 else
    {
       %>
        <script>
            alert("Password Failed");
            window.location="StudentMyProfile.jsp";
        </script>
        <%
    }
}
}
%>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="margin-top:5em;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Change Password</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    
    

    <div class="form-floating">
      <input type="password" class="form-control" id="floatingInput" name="cpass" placeholder="Current Password">
      <label for="floatingInput">Current Password</label>
    </div><br>
          <div class="form-floating">
      <input type="password" class="form-control" id="floatingInput" name="npass" placeholder="New Password">
      <label for="floatingInput">New Password</label>
          </div><br>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" name="copass" placeholder="Confirm Password">
      <label for="floatingPassword">Confirm Password</label>
    </div><br>

   
          <button class="w-100 btn btn-lg btn-primary" type="submit" name="btn2" id="cpbtn"  disabled>Submit</button>
   
  
      </div>
     
    </div>
  </div>
</div>
                    
                    
                    
                    
                    
                    <!-- popup menu ends-->
                    <a  onclick="myFunction()"><i class="fas fa-edit"></i></a>
                </div>
                <div class="row mt-2" >
                    <%
                    String name=rs.getString("student_name");
                    String surname[]=name.split(" ");
                    
                    %>
                    <div class="col-md-6"><label class="labels" >Name</label><input type="text" class="form-control" placeholder="first name" value="<%=surname[0]%>" readonly></div>
                    <div class="col-md-6"><label class="labels">Surname</label><input type="text" class="form-control" value="<%=surname[1]%>" placeholder="surname" readonly></div>
                </div>
                <div class="row mt-3" >
                    <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" class="form-control" id="txt_mobile" name="contact" placeholder="enter phone number" value="<%=rs.getString("student_contact")%>" readonly></div>
                    <div class="col-md-12"><label class="labels">Address</label><textarea type="text" class="form-control"  id="txt_address" name="address" placeholder="enter address line 1" value="" rows="5" cols="50" readonly><%=rs.getString("student_address")%></textarea></div>
                   
                 
                    
                    <div class="col-md-12"><label class="labels">Email ID</label><input type="text" class="form-control" id="txt_email" name="email" placeholder="enter email id" value="<%=rs.getString("student_email")%>" readonly></div>
                    <div class="col-md-12"><label class="labels">Education</label><input type="text" class="form-control" placeholder="education" value="" readonly></div>
                </div>
                <div class="row mt-3" >
                    <div class="col-md-6"><label class="labels">Country</label><input type="text" class="form-control" placeholder="country" value="" readonly></div>
                    <div class="col-md-6"><label class="labels">State/Region</label><input type="text" class="form-control" value="" placeholder="state" readonly></div>
                </div>
                  <%
    if(request.getParameter("btnsubmit11111")!=null){
      String update_query="update tbl_student set student_contact='"+request.getParameter("contact")+"',student_address='"+request.getParameter("address")+"',student_email='"+request.getParameter("email")+"' where student_id='"+session.getAttribute("student_id")+"'";
       if(con.executeCommand(update_query))
       {
       %>
       <script>
           alert("Edit Success");
           window.location="StudentMyProfile.jsp";
       </script>
        <%
       }
    }
     
        
    %>
                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit" id="btn1" name="btnsubmit11111" disabled>Save Profile</button></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="p-3 py-5" >
                <div class="d-flex justify-content-between align-items-center experience"><span>Edit Experience</span><span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Experience</span></div><br>
                <div class="col-md-12"><label class="labels">Experience in Designing</label><input type="text" class="form-control" placeholder="experience" value="" readonly></div> <br>
                <div class="col-md-12"><label class="labels">Additional Details</label><input type="text" class="form-control" placeholder="additional details" value="" readonly></div>
            </div>
        </div>
    </div>
<%
    }

%>
</div>
</div>
</form>
 <jsp:include page="StudentHomeFooter.jsp" /> 
 
    </body>
</html>
