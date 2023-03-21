<%-- 
    Document   : Overview
    Created on : Aug 24, 2022, 8:55:21 PM
    Author     : Georgekutty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>InPortal::Overview</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <style></style>
        <script type='text/javascript' src=''></script>
        <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
    </head>
    <jsp:include page="StudentHomeHeader.jsp" /> 
    <body oncontextmenu='return false' class='snippet-body'>
        <!--        Top Companies-->
        <section class="pt-5 pb-5">
            <div class="container">
                <div class="row">
                    <div class="col-6">
                        <h3 class="mb-4">Top Companies</h3>
                    </div>
                    <div class="col-6 text-right">
                        <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators2" role="button" data-slide="prev">
                            <i class="fa fa-arrow-left"></i>
                        </a>
                        <a class="btn btn-primary mb-3 " href="#carouselExampleIndicators2" role="button" data-slide="next">
                            <i class="fa fa-arrow-right"></i>
                        </a>
                    </div>
                    <div class="col-12" style="position: inherit!important;">
                        <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel" style="position: inherit!important;">

                            <div class="carousel-inner" style="position: inherit!important;">

                                <div class="carousel-item active" style="position: inherit!important;">
                                    <div class="row" style="position: inherit!important;">
                                        <%
                                            int i = 0;
                                            // String select = "select * from tbl_company c inner join tbl_intership i on i.company_id=c.company_id";
                                            String select = "select * from tbl_company where company_vstatus='1'";
                                            ResultSet rs = con.selectCommand(select);
                                            while (rs.next()) {
                                                i++;
                                                System.out.println(i);
                                        %>
                                        <div class="col-md-4 mb-3" style="position: inherit!important;">
                                            <div class="card" style="position: inherit!important;min-height: 25.3em;">
                                                <img class="img-fluid" alt="100%x280" src="../Assets/CompanyLogo/<%=rs.getString("company_logo")%>"  style="margin-left: auto;margin-right: auto;max-width: 200px;max-height: 200px;min-height: 200px;min-width: 200px;">
                                                <div class="card-body" style="text-align: center;">
                                                    <h4 class="card-title"><b><%=rs.getString("company_name")%></b></h4>
                                                    <a><p class="card-text"><%=rs.getString("company_email")%></p></a>
                                                    <a><p class="card-text"><%=rs.getString("company_site")%></p></a>
                                                    <a href="../404.jsp"><p class="card-text"><button class="btn btn-primary">Check More..</button></p></a>
                                                </div>

                                            </div>
                                        </div>
                                        <%
                                            if (i == 3) {
                                        %>
                                    </div>
                                </div>
                                <div class="carousel-item" style="position: inherit!important;">
                                    <div class="row" style="position: inherit!important;">
                                        <%
                                                    i = 0;

                                                }
                                            }
                                        %> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </section>

                    <!--           Top Internships                 -->
                    <section class="pt-5 pb-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-6">
                                    <h3 class="mb-4">Top Internship</h3>
                                </div>
                                <div class="col-6 text-right">
                                    <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators2" role="button" data-slide="prev">
                                        <i class="fa fa-arrow-left"></i>
                                    </a>
                                    <a class="btn btn-primary mb-3 " href="#carouselExampleIndicators2" role="button" data-slide="next">
                                        <i class="fa fa-arrow-right"></i>
                                    </a>
                                </div>
                                <div class="col-12" style="position: inherit!important;min-width: 1200px;min-height: 420.8px;">
                                    <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel" style="position: inherit!important;">

                                        <div class="carousel-inner" style="position: inherit!important;">

                                            <div class="carousel-item active" style="position: inherit!important;">
                                                <div class="row" style="position: inherit!important;">
                                                    <%
                                                        int c = 0;
                                                        String select2 = "select *from tbl_intership i inner join tbl_company p on i.company_id=p.company_id inner join tbl_position po on po.position_id=i.position_id";

                                                        ResultSet rs2 = con.selectCommand(select2);
                                                        while (rs2.next()) {
                                                            c++;
                                                            System.out.println(c);

                                                            int average_rating = 0;
                                                            int total_review = 0;
                                                            int five_star_review = 0;
                                                            int four_star_review = 0;
                                                            int three_star_review = 0;
                                                            int two_star_review = 0;
                                                            int one_star_review = 0;
                                                            int total_user_rating = 0;

                                                            String query = "SELECT * FROM tbl_review where internship_id = '" + rs2.getString("internship_id") + "' ORDER BY review_id DESC";
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
                                                    <div class="col-md-4 mb-3" style="position: inherit!important;">
                                                        <div class="card" style="position: inherit!important;min-height: 25.3em;">
                                                            <img class="img-fluid" alt="100%x280" src="../Assets/CompanyLogo/<%=rs2.getString("company_logo")%>"  style="margin-left: auto;margin-right: auto;max-width: 200px;max-height: 200px;min-height: 200px;min-width: 200px;">
                                                            <div class="card-body" style="text-align: center;">
                                                                <h4 class="card-title"><b><%=rs2.getString("company_name")%></b></h4>
                                                                <a><p class="card-text"><%=rs2.getString("position_name")%></p></a>
                                                                <a><p class="card-text"><%=rs2.getString("title")%></p></a>
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
                                                                <a href="../404.jsp"><p class="card-text"><button class="btn btn-primary">Check More..</button></p></a>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <%                                                        if (c == 3) {
                                                    %>
                                                </div>
                                            </div>
                                            <div class="carousel-item" style="position: inherit!important;">
                                                <div class="row" style="position: inherit!important;">
                                                    <%
                                                                c = 0;

                                                            }
                                                        }
                                                    %> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </section>
                                <script type='text/javascript'></script>
                                <jsp:include page="StudentHomeFooter.jsp" /> 
                                </body>
                                </html>