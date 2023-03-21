<%-- 
    Document   : CompanyView
    Created on : Aug 18, 2022, 10:59:05 AM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Company view</title>
        <style>
            body{
                background:#DCDCDC;
                margin-top:20px;
            }
            .card-box {
                padding: 20px;
                border-radius: 3px;
                margin-bottom: 30px;
                background-color: #fff;
            }

            .social-links li a {
                border-radius: 50%;
                color: rgba(121, 121, 121, .8);
                display: inline-block;
                height: 30px;
                line-height: 27px;
                border: 2px solid rgba(121, 121, 121, .5);
                text-align: center;
                width: 30px
            }

            .social-links li a:hover {
                color: #797979;
                border: 2px solid #797979
            }
            .thumb-lg {
                height: 88px;
                width: 88px;
            }
            .img-thumbnail {
                padding: .25rem;
                background-color: #fff;
                border: 1px solid #dee2e6;
                border-radius: .25rem;
                max-width: 100%;
                height: auto;
            }
            .text-pink {
                color: #ff679b!important;
            }
            .btn-rounded {
                border-radius: 2em;
            }
            .text-muted {
                color: #98a6ad!important;
            }
            h4 {
                line-height: 22px;
                font-size: 18px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="StudentHomeHeader.jsp" /> 
        <!--Form cards-->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <label class="form-label">State</label>
                        <select class="form-control" name="state_list" id="state" required  onchange="getDistrict(this.value), getData()">
                            <option value="" selected>--Select--</option>
                            <%
                                String s = "select *from tbl_state";
                                ResultSet rs = con.selectCommand(s);

                                while (rs.next()) {

                            %> 

                            <option  value="<%=rs.getString("state_id")%>"><%=rs.getString("state_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="col-sm-4">
                        <label class="form-label">District</label>
                        <select class="form-control" name="district_list"  id="inputdistrict" onchange="getPlace(this.value), getData()">
                            <option value="" selected>--Select--</option>
                            <option >...</option>
                        </select>
                    </div>
                    <div class="col-sm-4">
                        <label class="form-label">Place</label>
                        <select class="form-control" name="place_list" id="inputplace" onchange="getData()">
                            <option value="" selected>--Select--</option>
                            <option >...</option>
                        </select>
                    </div>
                    <!-- end col -->
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-4">
                        <label class="form-label">Sector</label>
                        <select class="form-control" name="sector_list" id="sector" required  onchange="getPosition(this.value), getData()">

                            <option  selected value="">--Select--</option>
                            <%
                                String sector = "select *from tbl_sector";
                                ResultSet rs5 = con.selectCommand(sector);

                                while (rs5.next()) {

                            %> 

                            <option  value="<%=rs5.getString("sector_id")%>"><%=rs5.getString("sector_name")%></option>
                            <%
                                }
                            %>

                        </select>
                    </div>
                    <div class="col-sm-4">
                        <label class="form-label">Position</label>
                        <select class="form-control" name="position_list"  id="position" onchange="getData()">
                            <option value="" selected>--Select--</option>

                        </select>
                    </div>

                    <!-- end col -->
                </div>
                <br>
                <!-- end row -->
                <%
                    String sel3 = "select * from tbl_company co inner join tbl_place pl on co.place_id=pl.place_id inner join tbl_district di on di.district_id=pl.district_id inner join  tbl_state st on st.state_id=di.state_id  inner join tbl_intership i on i.company_id=co.company_id inner join tbl_position pos on i.position_id=pos.position_id inner join tbl_sector sec on pos.sector_id=sec.sector_id where from_date > CURDATE()";
                    ResultSet rs3 = con.selectCommand(sel3);


                %>

                <div class="row" id="data">
                    <%                        while (rs3.next()) {
                            int average_rating = 0;
                            int total_review = 0;
                            int five_star_review = 0;
                            int four_star_review = 0;
                            int three_star_review = 0;
                            int two_star_review = 0;
                            int one_star_review = 0;
                            int total_user_rating = 0;

                            String query = "SELECT * FROM tbl_review where internship_id = '" + rs3.getString("internship_id") + "' ORDER BY review_id DESC";
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
                    <div class="col-lg-4">

                        <div class="text-center card-box" style="box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%);">
                            <div class="member-card pt-2 pb-2">
                                <div class="thumb-lg member-thumb mx-auto"><img src="../Assets/CompanyLogo/<%=rs3.getString("company_logo")%>" class="rounded-circle img-thumbnail" alt="profile-image"></div>
                                <div class="">
                                    <h4> <%=rs3.getString("company_name")%></h4>

                                    <p class="text-muted"> <span><%=rs3.getString("position_name")%> </span>
                                        <br><span><%=rs3.getString("title")%> </span>
                                        <br><span><a href="#" class="text-pink"><%=rs3.getString("company_email")%></a></span></p>
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
                                <ul class="social-links list-inline">
                                    <li class="list-inline-item"><a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                    <li class="list-inline-item"><a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                    <li class="list-inline-item"><a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Skype"><i class="fa fa-skype"></i></a></li>
                                </ul>
                                <a href="InternshipApply.jsp?in_id=<%=rs3.getString("internship_id")%>"><button type="button" class="btn btn-primary mt-3 btn-rounded waves-effect w-md waves-light">Check Now</button></a>
                                <div class="mt-4">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="mt-3">
                                                <h4><%=rs3.getString("openings")%></h4>
                                                <p class="mb-0 text-muted">Openings</p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="mt-3">
                                                <%
                                                    String find = "select count(*) as open from tbl_request r inner join tbl_intership pos on r.internship_id=pos.internship_id  where request_status='1' and pos.internship_id='" + rs3.getString("internship_id") + "'";
                                                    ResultSet rs2 = con.selectCommand(find);
                                                    rs2.next();
                                                    String count = rs2.getString("open");
                                                    String count2 = rs3.getString("openings");
                                                    int number1 = Integer.parseInt(count);
                                                    int number2 = Integer.parseInt(count2);
                                                    int num = number2 - number1;
                                                    String answer = Integer.toString(num);
                                                %>

                                                <%
                                                    if (num == 0) {
                                                %>
                                                <p class="mb-0 text-muted" style="color:red !important">Full</p>
                                                <%
                                                } else {
                                                %>
                                                <h4><%=answer%></h4>
                                                <p class="mb-0 text-muted">Available</p>
                                                <%
                                                    }
                                                %>

                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="mt-3">
                                                <h4><%=count%></h4>
                                                <p class="mb-0 text-muted">Booked</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end col -->

                    <!-- end row -->
                    <%
                        }
                    %>
                </div>

                <!-- container -->
            </div>
            <!-- Form cards ends --> 
            <jsp:include page="StudentHomeFooter.jsp" /> 
    </body>
    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
                            function getData()
                            {
                                var state = document.getElementById("state").value;
                                var district = document.getElementById("inputdistrict").value;
                                var place = document.getElementById("inputplace").value;
                                var sector = document.getElementById("sector").value;
                                var position = document.getElementById("position").value;

                                $.ajax({url: "../Assets/Ajaxpages/AjaxSearchCompany.jsp?state=" + state + "&district=" + district + "&place=" + place + "&sector=" + sector + "&position=" + position,
                                    success: function(result) {
                                        $("#data").html(result);
                                    }
                                });
                            }
    </script>

    <script>
        function getDistrict(did)
        {

            $.ajax({
                url: "../Assets/Ajaxpages/AjaxDistrict.jsp?did=" + did,
                success: function(html) {
                    $("#inputdistrict").html(html);
                }
            });
        }
    </script>

    <script>
        function getPlace(pid)
        {

            $.ajax({
                url: "../Assets/Ajaxpages/AjaxPlace.jsp?pid=" + pid,
                success: function(html) {
                    $("#inputplace").html(html);
                }
            });
        }
    </script>
    <script>
        function getPosition(sid)
        {

            $.ajax({
                url: "../Assets/Ajaxpages/AjaxPosition.jsp?sid=" + sid,
                success: function(html) {
                    $("#position").html(html);
                }
            });
        }
    </script>
</html>
