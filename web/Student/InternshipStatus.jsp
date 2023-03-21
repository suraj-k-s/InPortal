<%-- 
    Document   : InternshipStatus
    Created on : Aug 23, 2022, 7:49:39 PM
    Author     : Georgekutty
--%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Internship Status</title>
        <style>

.main-box.no-header {
    padding-top: 20px;
}
.main-box {
    background: #FFFFFF;
    -webkit-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -moz-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -o-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -ms-box-shadow: 1px 1px 2px 0 #CCCCCC;
    box-shadow: 1px 1px 2px 0 #CCCCCC;
    margin-bottom: 16px;
    -webikt-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.table a.table-link.danger {
    color: #e74c3c;
}
.label {
    border-radius: 3px;
    font-size: 0.875em;
    font-weight: 600;
}
.user-list tbody td .user-subhead {
    font-size: 0.875em;
    font-style: italic;
}
.user-list tbody td .user-link {
    display: block;
    font-size: 1.25em;
    padding-top: 3px;
    margin-left: 60px;
}
a {
    color: #3498db;
    outline: none!important;
}
.user-list tbody td>img {
   // position: relative;
    max-width: 50px;
    float: left;
    margin-right: 15px;
}

.table thead tr th {
    text-transform: uppercase;
    font-size: 0.875em;
}
.table thead tr th {
    border-bottom: 2px solid #e7ebee;
}
.table tbody tr td:first-child {
    font-size: 1.125em;
    font-weight: 300;
}
.table tbody tr td {
    font-size: 0.875em;
    vertical-align: middle;
    border-top: 1px solid #e7ebee;
    padding: 12px 8px;
}
a:hover{
text-decoration:none;
} 
#blink:hover{
    background-color: #f2f2f2;
}
        </style>
      
    </head>
    <body>
        <jsp:include page="StudentHomeHeader.jsp" /> 
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"> 
<div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="col-lg-12" style="min-height:35em;">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                            <thead>
                                <tr>
                               
                                <th><span>Position Name</span></th>
                                  <th><span>Title</span></th>
                                   <th><span>Company Name</span></th>
                                    <th><span>Request Date</span></th>
                                <th class="text-center"><span>Status</span></th>
                               
                               
                                </tr>
                            </thead>
                            <%
          
                             String sview="select * from tbl_request r inner join tbl_student s on r.student_id=s.student_id inner join tbl_intership i on i.internship_id=r.internship_id inner join tbl_company co on co.company_id=i.company_id  inner join tbl_position pos on i.position_id=pos.position_id where r.student_id='"+session.getAttribute("student_id")+"' ";
           
                             ResultSet rs1 = con.selectCommand(sview);
                            
            
                             %>
                            <tbody>
                                 <%
                    while(rs1.next()){
                  
                                   %> 
                                <tr id="blink">
                                    <td><%=rs1.getString("position_name")%></td>
                                     <td><%=rs1.getString("title")%></td>
                                    <td>
                                        <img src="../Assets/CompanyLogo/<%=rs1.getString("company_logo")%>" alt="">
                                        <a href="#" class="user-link"><%=rs1.getString("company_name")%></a>
                                       
                                    </td>
                                    <td>
                                        <%
                                     
                                       Date date =rs1.getDate("request_date");
                                        DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");  
                                       String strDate = dateFormat.format(date);  
                                        %>
                                        <%=strDate%>
                                    </td>
                                    <td class="text-center">
                                        <%
                                            if(rs1.getString("request_reply").equals("Verified"))
                                            {
                                        %>
                                        <span class="badge badge-success"><%=rs1.getString("request_reply")%> </span><br>
                                               <%
                                              if(rs1.getString("payment_status").equals("0"))
                                              {
                                               %>
                                        <a href="Payment.jsp?in_id=<%=rs1.getString("internship_id")%>&ir_id=<%=rs1.getString("request_id")%> &regfee=<%=rs1.getString("internship_regfee")%>" ><span class="badge badge-primary">Pay Now </span></a>
                                               <%
                                              }
                                              else{
                                              %>
                                              <span class="badge badge-primary"><i class="fas fa-check-circle" style="color:#fff;"></i> Payed </span>
                                              <%
                                              }
                                               %>

                                        <%
                                            }
                                         else if(rs1.getString("request_reply").equals("Rejected")) {

                                           
                                           %>
                                           <span class="badge badge-danger"><%=rs1.getString("request_reply")%> </span><br>
                                           <%
                                         }

                                            else
                                          {   
                                        %>
                                          <span class="badge badge-warning"><%=rs1.getString("request_reply")%></span>
                                          <%
                                              }
                                          %>
                                          
                                          <%
                                          if(rs1.getString("request_active").equals("1"))
                                          {
                                          %>
                                          <br>
                                          <a href="InternshipRating.jsp?inr=<%=rs1.getString("internship_id")%>"><span>Rate <i class="fas fa-star" style="color:yellow;"></i></span></a>
                                           <%
                                           }
                                           %>
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
</div>
         <jsp:include page="StudentHomeFooter.jsp" /> 
    </body>
    
</html>
