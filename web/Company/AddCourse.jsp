<%-- 
    Document   : AddCourse
    Created on : Aug 17, 2022, 11:35:58 AM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal:: Add Course</title>
        <style>
          

.card-registration .select-input.form-control[readonly]:not([disabled]) {
font-size: 1rem;
line-height: 2.15;
padding-left: .75em;
padding-right: .75em;
}
.card-registration .select-arrow {
top: 13px;
}
.p-md-5 {
   padding: 1px !important;
}
@media (min-width: 768px)
.p-md-5 {
     padding: 1px !important;
}
        </style>
       
    </head>
    <body>
         <jsp:include page="CompanyHomeHeader.jsp" />
         <%
         String cid="",cname="",cdname="",ctype_id="";
         if (request.getParameter("btnsubmit") != null) {
              if(!request.getParameter("txtid").equals(""))
                {
                String sedit = "update tbl_course set coursetype_id='"+request.getParameter("typelist")+"',course_name='"+request.getParameter("cname")+"',course_duration='"+request.getParameter("cdname")+"' where course_id='"+request.getParameter("txtid")+"'";
                
                con.executeCommand(sedit);
                response.sendRedirect("AddCourse.jsp");
                
                }
             else{   
         String query = "insert into tbl_course(course_name,course_duration,coursetype_id,company_id) values('" + request.getParameter("cname") + "','" + request.getParameter("cdname") + "','" +request.getParameter("typelist")+"','"+session.getAttribute("company_id")+"')";
          if (con.executeCommand(query)) {
        %>
        <script>
            alert("Data Inserted");
            window.location = "AddCourse.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Data Insertion Failed");
            window.location = "AddCourse.jsp";
        </script>
        <%
        }
      }
    }
        %>
        
        <!--delete code-->
        <%
          if(request.getParameter("did")!=null){
       String dl = "delete from tbl_course where course_id='"+request.getParameter("did")+"'";
        if (con.executeCommand(dl)) {
        %>
        <script>
            alert("Deleted");
            window.location = "AddCourse.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Delete Failed");
            window.location = "AddCourse.jsp";
        </script>
        <%
                }
       
       }
        %>
        <!--delete code ends-->
          <%
         if(request.getParameter("eid")!=null){
         String sedit="select * from tbl_course  where course_id='"+request.getParameter("eid")+"'";
        
        ResultSet rs2 = con.selectCommand(sedit);
       
        rs2.next();
        cid=rs2.getString("course_id");
        cname=rs2.getString("course_name");
        cdname=rs2.getString("course_duration");
        ctype_id=rs2.getString("coursetype_id");
        
       }
          
          %>
        
         <div style="display: inline-flex;">
         <section class="vh-100 gradient-custom" style="width: 26em;">
             <div class="container py-5 h-100" style="width: 38em;">
    <div class="row justify-content-center align-items-center h-100">
      <div class="col-12 col-lg-9 col-xl-7">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;margin-top: -2em;">
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Add Course </h3>
            <form method="post">
         <input type="text" value="<%=cid%>" name="txtid">
            <div class="row">
                <div class="col-12">
                  <select class="select form-control-lg" name="typelist">
                    <option value="1" >Choose option</option>
                       <%
            String s="select *from tbl_coursetype";
            ResultSet rs = con.selectCommand(s);
            
            %>
              <%
                    while(rs.next()){
                   
                 %> 
                 <option value="<%=rs.getString("coursetype_id")%>"
                     <% if(rs.getString("coursetype_id").equals(ctype_id)){
                     out.print("Selected");
                 }%>
                         
                         >
                     <%=rs.getString("coursetype_name")%>
                 </option>
                    <%
                        }
                    %>
                  </select>
                </div>
              </div>
            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInput" name="cname" value="<%=cname%>" placeholder="Course Name">
      <label for="floatingInput">Course Name</label>
          </div>
           <div class="form-floating">
               <input type="text" class="form-control" id="floatingInput" name="cdname" value="<%=cdname%>" placeholder="Course Duration">
      <label for="floatingInput">Course Duration</label>
          </div>
                 <div class="mt-4 pt-2">
                <input class="btn btn-primary btn-lg" type="submit" value="Submit" name="btnsubmit" />
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
     <!--Table Design-->
             <div style="margin-left: 7em;">   
                <!--search -->
            <form action="" method="get" >
                <input type="text" placeholder="Search.." name="q" class="form-control" autocomplete="off">
            </form> 
                <br>
  <table class="table" style="width: 43em;">
           
            <thead class="" style="background-color: #fc8213;color: white;">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Course Name</th>
                    <th scope="col">Duration</th>
                    <th scope="col">Course Type</th>
       
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <%
            String query = request.getParameter("q");
            String sview;
            if(query!=null){
            sview ="select * from tbl_course  where course_name like '"+query+"'";
            }
            else{
            sview="select *from tbl_course c inner join tbl_coursetype t on c.coursetype_id=t.coursetype_id where company_id='"+session.getAttribute("company_id")+"'";
            }
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
                       <%=rs1.getString("course_name")%>
                    </td>
                     <td>
                       <%=rs1.getString("course_duration")%>
                    </td>
                    <td>
                       <%=rs1.getString("coursetype_name")%>
                    </td>
                    
                    <td>
                        <a href="AddCourse.jsp?did=<%=rs1.getString("course_id")%>"><i class="fa fa-trash" style="color:red"></i></a>/<a href="AddCourse.jsp?eid=<%=rs1.getString("course_id")%>"><i class="fa fa-edit" style="color:blue"></i></a>  
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
          </div>
            </div> 
      <jsp:include page="CompanyHomeFooter.jsp" />   
    </body>
</html>
