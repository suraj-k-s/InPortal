<%-- 
    Document   : MyLibrary
    Created on : Sep 21, 2022, 2:43:06 PM
    Author     : Georgekutty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::My Library</title>
        <style>
            body{
                background:#eee;
            }

            .card {
                box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: 1rem;
            }

            .card-body {
                -webkit-box-flex: 1;
                -ms-flex: 1 1 auto;
                flex: 1 1 auto;
                padding: 1.5rem 1.5rem;
            }
            .avatar-text {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                background: #000;
                color: #fff;
                font-weight: 700;
            }

            .avatar {
                width: 3rem;
                height: 3rem;
            }
            .rounded-3 {
                border-radius: 0.5rem!important;
            }
            .mb-2 {
                margin-bottom: 0.5rem!important;
            }
            .me-4 {
                margin-right: 1.5rem!important;
            }
        </style>
    </head>
    <body>
       <jsp:include page="StudentHomeHeader.jsp" /> 
        <div class="container" style="min-height: 37em;">
    <div class="text-center mb-5">
      <h3>Your Accomplishments</h3>
    
    </div>
    <%
    String sel = "select * from tbl_request r inner join tbl_student s on r.student_id=s.student_id inner join tbl_intership i on i.internship_id=r.internship_id inner join tbl_company co on co.company_id=i.company_id  inner join tbl_position pos on i.position_id=pos.position_id where r.student_id='"+session.getAttribute("student_id")+"'";
    ResultSet rs =con.selectCommand(sel);
    while(rs.next()){
    %>
    <div class="card mb-3" id="result" style="z-index:1;">
      <div class="card-body">
        <div class="d-flex flex-column flex-lg-row">
            <span class="avatar avatar-text rounded-3 me-4 bg-warning mb-2"><img src="../Assets/CompanyLogo/<%=rs.getString("company_logo")%>"
                                                                                 style="height: 49px;width: 52px;border-radius: 8px;"
                                                                                            ></span>
          <div class="row flex-fill">
            <div class="col-sm-4">
              <h4 class="h5"><%=rs.getString("position_name")%></h4>
              <h3 style="font-size: 14px;margin-top: -1em;color: #888484;"><%=rs.getString("title")%></h3>
             
             
            </div>
            <div class="col-sm-3 py-2">
             
            </div>
               <div class="col-sm-3 py-2">
                   
            </div>
            <div class="col-sm-2 text-lg-end">
                <%
                 if(rs.getString("request_active").equals("1"))
                 {
                %>
              <a href="certificate.jsp?in_id=<%=rs.getString("internship_id")%>" class="btn btn-primary stretched-link">View Certificate</a>
              <%
              }
              else
              {
             %>
              <span class="badge bg-dark">In Progress</span>
             <%
               }
              %>
              
            </div>
          </div>
        </div>
      </div>
    </div>
    <%
    }
    %>
   
  </div>
           <jsp:include page="StudentHomeFooter.jsp" /> 
    </body>
</html>
