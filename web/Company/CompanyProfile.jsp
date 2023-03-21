<%-- 
    Document   : CompanyProfile
    Created on : Aug 16, 2022, 9:54:59 AM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inportal::Company Profile</title>
        <style>
            
.account-settings .user-profile {
    margin: 0 0 1rem 0;
    padding-bottom: 1rem;
    text-align: center;
}
.account-settings .user-profile .user-avatar {
    margin: 0 0 1rem 0;
}
.account-settings .user-profile .user-avatar img {
    width: 90px;
    height: 90px;
    -webkit-border-radius: 100px;
    -moz-border-radius: 100px;
    border-radius: 100px;
}
.account-settings .user-profile h5.user-name {
    margin: 0 0 0.5rem 0;
}
.account-settings .user-profile h6.user-email {
    margin: 0;
    font-size: 0.8rem;
    font-weight: 400;
    color: #9fa8b9;
}
.account-settings .about {
    margin: 2rem 0 0 0;
    text-align: center;
}
.account-settings .about h5 {
    margin: 0 0 15px 0;
    color: #007ae1;
}
.account-settings .about p {
    font-size: 0.825rem;
}
.form-control {
    border: 1px solid #cfd1d8;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    font-size: .825rem;
    background: #ffffff;
    color: #2e323c;
}

.card {
    background: #ffffff;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    border: 0;
    margin-bottom: 1rem;
    position:inherit!important;
}
.col-12,.col-sm-12,.col-md-12,.col-lg-3,.col-xl-3{
    position: inherit!important;
}

        </style>
        <script>
function Edit() {
 document.getElementById("profile-image-upload").removeAttribute("disabled");
   document.getElementById("eMail").removeAttribute("readonly");
    document.getElementById("phone").removeAttribute("readonly");
     document.getElementById("address").removeAttribute("readonly");
      document.getElementById("website").removeAttribute("readonly");
     document.getElementById("submit").removeAttribute("disabled");
    
}

</script>
    </head>
    <body>
          <%
                 
                 String sel="";
                  sel="select * from tbl_company  where company_id='"+session.getAttribute("company_id")+"'";
                  ResultSet rs=con.selectCommand(sel);
                  while(rs.next())
                  {

        %> 
        <jsp:include page="CompanyHomeHeader.jsp" />
        <br>
        <form name="frmeditprofile" method="post" action="../Assets/Action/CompanyProfileEditAction.jsp" enctype="multipart/form-data">
        <div class="container">
<div class="row gutters">
<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="account-settings">
			<div class="user-profile">
				<div class="user-avatar">
					<img src="../Assets/CompanyLogo/<%=rs.getString("company_logo")%>" alt="Maxwell Admin" id="profile-image" name="txt_logo" >
                                        <input type="file" name="image" id="profile-image-upload" accept='image/*'  onchange="readURL(this)" style="display: none" disabled >
				</div>
				<h5 class="user-name"><%=rs.getString("company_name")%></h5>
				<h6 class="user-email"><%=rs.getString("company_email")%></h6>
			</div>
			<div class="about">
				<h5>About</h5>
                                <p style="text-align: justify;"><%=rs.getString("company_about")%></p>
			</div>
		</div>
	</div>
</div>
</div>
<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="row gutters">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="display:inline-flex;">
				<h6 class="mb-2 text-primary">Basic Details</h6>
                                <i class="fas fa-highlighter" style="margin-left:40em;" onclick="Edit()"></i>&nbsp;&nbsp;&nbsp;
                                <a href="CompanyChangePassword.jsp"><i class="fas fa-key"></i></a>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="fullName">Company Name</label>
                                        <input type="text" class="form-control" id="fullName" name="name" placeholder="Enter Company name" value="<%=rs.getString("company_name")%>" readonly>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="eMail">Email</label>
                                        <input type="email" class="form-control" id="eMail" name="email" placeholder="Enter email ID" value="<%=rs.getString("company_email")%>" readonly>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="phone">Phone</label>
					<input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone number" value="<%=rs.getString("company_contact")%>" readonly>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="website">Website URL</label>
                                        <input type="url" class="form-control" id="website" name="site" placeholder="Website url" value="<%=rs.getString("company_site")%>" readonly>
				</div>
			</div>
		</div>
		<div class="row gutters">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
			<!--	<h6 class="form-group">Address</h6>  -->
                        <label for="website">Address</label>
                                <textarea class="form-control" rows="5" cols="50" id="address" name="address" readonly=""><%=rs.getString("company_address")%></textarea>
			</div>
			
			
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="sTate">State</label>
                                        <input type="text" class="form-control" id="sTate" placeholder="Enter State" readonly>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="zIp">Zip Code</label>
					<input type="text" class="form-control" id="zIp" placeholder="Zip Code" readonly>
				</div>
			</div>
		</div>
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="text-right">
                                  
                                        <button type="submit" id="submit" name="submit" class="btn btn-primary" disabled>Update</button>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
</form>
        <%
            }
          %>
          <br>
          <br>
          <jsp:include page="CompanyHomeFooter.jsp" /> 
    </body>
 <script src="../Assets/JQ/jQuery.js"></script> 
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
</html>
