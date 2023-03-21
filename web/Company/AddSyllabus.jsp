<%-- 
    Document   : AddSyllabus
    Created on : Aug 17, 2022, 2:37:46 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Add Syllabus</title>
        <style>
            body{
    background:#eee;    
}
.main-container{
    margin-top:40px;    
}
.widget-author {
  margin-bottom: 58px;
}
.author-card {
  position: relative;
  padding-bottom: 48px;
  background-color: #fff;
  box-shadow: 0 12px 20px 1px rgba(64, 64, 64, .09);
}
.author-card .author-card-cover {
  position: relative;
  width: 100%;
  height: 100px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.author-card .author-card-cover::after {
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  content: '';
  opacity: 0.5;
}
.author-card .author-card-cover > .btn {
  position: absolute;
  top: 12px;
  right: 12px;
  padding: 0 10px;
}
.author-card .author-card-profile {
  display: table;
  position: relative;
  margin-top: -22px;
  padding-right: 15px;
  padding-bottom: 16px;
  padding-left: 20px;
  z-index: 5;
}
.author-card .author-card-profile .author-card-avatar, .author-card .author-card-profile .author-card-details {
  display: table-cell;
  vertical-align: middle;
}
.author-card .author-card-profile .author-card-avatar {
  width: 85px;
  border-radius: 50%;
  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, .15);
  overflow: hidden;
}
.author-card .author-card-profile .author-card-avatar > img {
  display: block;
  width: 100%;
}
.author-card .author-card-profile .author-card-details {
  padding-top: 20px;
  padding-left: 15px;
}
.author-card .author-card-profile .author-card-name {
  margin-bottom: 2px;
  font-size: 14px;
  font-weight: bold;
}
.author-card .author-card-profile .author-card-position {
  display: block;
  color: #8c8c8c;
  font-size: 12px;
  font-weight: 600;
}
.author-card .author-card-info {
  margin-bottom: 0;
  padding: 0 25px;
  font-size: 13px;
}
.author-card .author-card-social-bar-wrap {
  position: absolute;
  bottom: -18px;
  left: 0;
  width: 100%;
}
.author-card .author-card-social-bar-wrap .author-card-social-bar {
  display: table;
  margin: auto;
  background-color: #fff;
  box-shadow: 0 12px 20px 1px rgba(64, 64, 64, .11);
}
.btn-style-1.btn-white {
    background-color: #fff;
}
.list-group-item i {
    display: inline-block;
    margin-top: -1px;
    margin-right: 8px;
    font-size: 1.2em;
    vertical-align: middle;
}
.mr-1, .mx-1 {
    margin-right: .25rem !important;
}

.list-group-item.active:not(.disabled) {
    border-color: #e7e7e7;
    background: #fff;
    color: #ac32e4;
    cursor: default;
    pointer-events: none;
}
.list-group-flush:last-child .list-group-item:last-child {
    border-bottom: 0;
}

.list-group-flush .list-group-item {
    border-right: 0 !important;
    border-left: 0 !important;
}

.list-group-flush .list-group-item {
    border-right: 0;
    border-left: 0;
    border-radius: 0;
}
.list-group-item.active {
    z-index: 2;
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}
.list-group-item:last-child {
    margin-bottom: 0;
    border-bottom-right-radius: .25rem;
    border-bottom-left-radius: .25rem;
}
a.list-group-item, .list-group-item-action {
    color: #404040;
    font-weight: 600;
}
.list-group-item {
    padding-top: 16px;
    padding-bottom: 16px;
    -webkit-transition: all .3s;
    transition: all .3s;
    border: 1px solid #e7e7e7 !important;
    border-radius: 0 !important;
    color: #404040;
    font-size: 12px;
    font-weight: 600;
    letter-spacing: .08em;
    text-transform: uppercase;
    text-decoration: none;
}
.list-group-item {
    position: relative;
    display: block;
    padding: .75rem 1.25rem;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid rgba(0,0,0,0.125);
}
.col-lg-4{
    position: inherit!important;
}
        </style>
          <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    </head>
    <body>
         <jsp:include page="CompanyHomeHeader.jsp" />
  
 
       
        
         <!--delete code-->
        <%
          if(request.getParameter("did")!=null){
       String dl = "delete from tbl_syllabus where syllabus_id='"+request.getParameter("did")+"'";
        if (con.executeCommand(dl)) {
        %>
        <script>
            alert("Deleted");
            window.location = "AddSyllabus.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Delete Failed");
            window.location = "AddSyllabus.jsp";
        </script>
        <%
                }
       
       }
        %>
        <!--delete code ends-->
        <div>      
<div class="container mb-4 main-container">
    <div class="row">
        <div class="col-lg-4 pb-5">
            <!-- Account Sidebar-->
            <div class="author-card pb-3">
                <div class="author-card-cover" style="background-image: url(../Assets/images/Company-178447404.jpg);"></div>
                <div class="author-card-profile">
                    <div class="author-card-avatar"><img src="../Assets/CompanyLogo/<% out.print(session.getAttribute("logo"));%>" alt="Daniel Adams">
                    </div>
                    <div class="author-card-details">
                        <h5 class="author-card-name text-lg"><% out.print(session.getAttribute("company_name"));%></h5><span class="author-card-position"><% out.print(session.getAttribute("company_email"));%></span>
                    </div>
                </div>
            </div>
                    <br>
            <div class="wizard">
                <nav class="list-group list-group-flush">
     <form method="post"  enctype="multipart/form-data" action="../Assets/Action/SyllabusMaterialsAction.jsp">
                    <label class="form-label">Choose Course</label>
                    <select class="form-control" name="course_list">
                        <option selected>--select--</option>
                         <%
            String s="select * from tbl_intership where company_id='"+session.getAttribute("company_id")+"'";
            ResultSet rs = con.selectCommand(s);
            
            %>
              <%
                    while(rs.next()){
                   
                 %> 
                 <option value="<%=rs.getString("internship_id")%>">
                     <%=rs.getString("title")%>
                 </option>
                    <%
                        }
                    %>
                    </select><br>
                     Tumbnail:
                     <input class="form-control" type="file" id="formFile" name="fileimage2"> <br>
                     video:
                    <input class="form-control" type="file" id="formFile" name="fileimage"> <br>
                    <button type="submit" class="btn btn-primary btn-lg" name="btnsubmit" style="width: 100%;">Submit</button>
                   
        </form> 
                </nav>
            </div>
        </div>
        <!-- Orders Table-->
        <div class="col-lg-8 pb-5">
            <div class="d-flex justify-content-end pb-3">
                <div class="form-inline">
                    <label class="text-muted mr-3" for="order-sort">Sort Orders</label>
                    <select class="form-control" id="order-sort" name="list">
                        <option>All</option>
                        <option>Delivered</option>
                        <option>In Progress</option>
                        <option>Delayed</option>
                        <option>Canceled</option>
                    </select>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>Number #</th>
                            <th>Internship Name</th>
                            <th>Download</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                      <%
            String query = request.getParameter("q");
            String sview;
           
            sview="select *from tbl_syllabus s inner join tbl_intership c on s.internship_id=c.internship_id where company_id='"+session.getAttribute("company_id")+"'";
            
            ResultSet rs1 = con.selectCommand(sview);
            int i=0;
            
            %>
                    <tbody>
                         <%
                    while(rs1.next()){
                    i++;
                 %> 
                        <tr>
                            <td> 
                                <%=i%>  
                            </td>
                            <td>
                                <%=rs1.getString("title")%>  
                               
                            </td>
                            <td> <a href="../Assets/SyllabusMaterials/<%=rs1.getString("syllabus_material")%>" download><span class="badge badge-success m-0"><i class="fas fa-cloud-download-alt"></i> Download</span></a></td>
                            <td>
                             <a href="AddSyllabus.jsp?did=<%=rs1.getString("syllabus_id")%>"><span class="badge badge-danger m-0">Delete</span></a>
                            </td>
                        </tr>
                        <%
                }
                %>
                    </tbody>
                </table>
               
            </div>
        </div>
    </div>
</div>
   </div>        
         <jsp:include page="CompanyHomeFooter.jsp" />  
    </body>
</html>
