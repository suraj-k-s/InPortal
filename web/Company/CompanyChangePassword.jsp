<%-- 
    Document   : CompanyChangePassword
    Created on : Aug 16, 2022, 9:51:29 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .form-floating,.modal-dialog,.modal-content,modal-body{
                position: inherit!important;
            }
        </style>
    </head>
    <body>
         <jsp:include page="CompanyHomeHeader.jsp" />
         
         <!-- Modal -->
  <form method="post">
      <% 
    if(request.getParameter("btn2")!=null){
    String sel1="";
    String cpass ="select company_name,company_password from tbl_company where company_id='"+session.getAttribute("company_id")+"'"; 
    ResultSet rs1=con.selectCommand(cpass);
    if(rs1.next()){
    if(rs1.getString("company_password").equals(request.getParameter("cpass"))){ 
        if(request.getParameter("npass").equals(request.getParameter("copass"))){
           
            String update_query ="update tbl_company set company_password='"+request.getParameter("npass")+"'  where company_id='"+session.getAttribute("company_id")+"'";
            con.executeCommand(update_query);
            %>
            
            
        
        <script>
            alert("Password Changed Successfully");
            window.location="CompanyProfile.jsp";
        </script>
        <%
    }
else{
%>
        <script>
            alert("Password Mismatch");
            window.location="CompanyProfile.jsp";
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
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Change Password</h5>
       
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

   
          <button class="w-100 btn btn-lg btn-primary" type="submit" name="btn2" id="cpbtn">Submit</button>
   
  
      </div>
     
    </div>
  </div>

  </form>       
         
           <jsp:include page="CompanyHomeFooter.jsp" /> 
    </body>
</html>
