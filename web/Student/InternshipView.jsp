<%-- 
    Document   : InternshipView
    Created on : Aug 21, 2022, 5:10:32 PM
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
        <title>InPortal::Internship View</title>
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
    <jsp:include page="StudentHomeHeader.jsp" /> 
    <body>


        <div class="container">
            <div class="text-center mb-5">
                <h3>Find Your Internships..</h3>
                <p class="lead">Eros ante urna tortor aliquam nisl magnis quisque hac</p>
                <div class="row">

                    <div class="">
                        <input class="form-control" id="myInput" type="text" placeholder="Search.." onkeyup="getData(this.value)">
                    </div>
                </div>
            </div>
            <div  id="result">
            <%
                String sel = "select *from tbl_intership i inner join tbl_company p on i.company_id=p.company_id inner join tbl_position po on po.position_id=i.position_id";
                ResultSet rs = con.selectCommand(sel);
                while (rs.next()) {
                    int average_rating = 0;
                    int total_review = 0;
                    int five_star_review = 0;
                    int four_star_review = 0;
                    int three_star_review = 0;
                    int two_star_review = 0;
                    int one_star_review = 0;
                    int total_user_rating = 0;

                    String query = "SELECT * FROM tbl_review where internship_id = '" + rs.getString("internship_id") + "' ORDER BY review_id DESC";
                    ResultSet rs1 = con.selectCommand(query);
                    while (rs1.next()) {
                        if (rs1.getString("user_rating").equals("5")) {
                            five_star_review++;
                        }
                        if (rs1.getString("user_rating").equals("4")) {
                            four_star_review++;
                        }
                        if (rs1.getString("user_rating").equals("3")) {
                            three_star_review++;
                        }
                        if (rs1.getString("user_rating").equals("2")) {
                            two_star_review++;
                        }
                        if (rs1.getString("user_rating").equals("1")) {
                            one_star_review++;
                        }
                        total_review++;
                        total_user_rating = total_user_rating + Integer.parseInt(rs1.getString("user_rating"));
                    }
                    if (total_user_rating > 0) {
                        average_rating = total_user_rating / total_review;
                    }

            %>
            <div class="card mb-3" style="z-index:1;">
                <div class="card-body">
                    <div class="d-flex flex-column flex-lg-row">
                        <span class="avatar avatar-text rounded-3 me-4 bg-warning mb-2"><img src="../Assets/CompanyLogo/<%=rs.getString("company_logo")%>"
                                                                                             style="height: 49px;width: 52px;border-radius: 8px;"
                                                                                             ></span>
                        <div class="row flex-fill">
                            <div class="col-sm-4">
                                <h4 class="h5"><%=rs.getString("position_name")%></h4>
                                <h3 style="font-size: 14px;margin-top: -1em;color: #888484;"><%=rs.getString("title")%></h3>
                                <span class="badge bg-secondary"><%=rs.getString("openings")%></span> 
                                <span class="badge bg-success">
                                    <%
                                        Date date = rs.getDate("from_date");
                                        DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
                                        String strDate = dateFormat.format(date);
                                    %>
                                    <%=strDate%> to 
                                    <%
                                        Date date1 = rs.getDate("to_date");
                                        DateFormat dateFormat1 = new SimpleDateFormat("dd-MMM-yyyy");
                                        String strDate1 = dateFormat1.format(date1);
                                    %>
                                    <%=strDate1%>
                                </span>
                            </div>
                            <div class="col-sm-3 py-2">
                                <span class="badge bg-secondary">React</span>
                                <span class="badge bg-secondary">Angular</span>
                                <span class="badge bg-secondary">Vue</span>
                                <span class="badge bg-secondary">Asp</span>
                            </div>
                            <div class="col-sm-3 py-2">
                                Rating: 
                                <%

                                    if (average_rating == 5) {
                                %>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <%
                                    }
                                    if (average_rating == 4) {
                                %>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <%
                                    }
                                    if (average_rating == 3) {
                                %>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <%
                                    }
                                    if (average_rating == 2) {
                                %>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>

                                <%
                                    }
                                    if (average_rating == 1) {
                                %>
                                <i class="fas fa-star" style="color:yellow;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <%
                                    }
                                    if (average_rating == 0) {
                                %>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <i class="fas fa-star" style="color:grey;"></i>
                                <%
                                    }


                                %>
                            </div>
                            <div class="col-sm-2 text-lg-end">
                                <a href="InternshipApply.jsp?in_id=<%=rs.getString("internship_id")%>" class="btn btn-primary stretched-link">View</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
            </div>
        </div>
        <jsp:include page="StudentHomeFooter.jsp" /> 


    </body>
</html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
                  function getData(did)
                  {

                      $.ajax({
                          url: "../Assets/Ajaxpages/AjaxData.jsp?did=" + did,
                          success: function (html) {
                              $("#result").html(html);
                          }
                      });
                  }
</script>
