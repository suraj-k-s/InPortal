<%-- 
    Document   : AjaxSearchCompany
    Created on : Aug 18, 2022, 11:41:18 AM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        <body>
        <%
            String sel3 = "select * from tbl_company co inner join tbl_place pl on co.place_id=pl.place_id inner join tbl_district di on di.district_id=pl.district_id inner join  tbl_state st on st.state_id=di.state_id  inner join tbl_intership i on i.company_id=co.company_id inner join tbl_position pos on i.position_id=pos.position_id inner join tbl_sector sec on pos.sector_id=sec.sector_id where true";
            String state = request.getParameter("state");
            String district = request.getParameter("district");
            String place = request.getParameter("place");
            String sector = request.getParameter("sector");
            String position = request.getParameter("position");
            if (!state.equals("")) {
                sel3 += " and st.state_id='" + state + "'";
            }

            if (!district.equals("")) {
                sel3 += "and di.district_id='" + district + "'";
            }
            if (!place.equals("")) {
                sel3 += "and pl.place_id='" + place + "'";
            }
            if (!sector.equals("")) {
                sel3 += "and sec.sector_id='" + sector + "'";
            }
            if (!position.equals("")) {
                sel3 += "and pos.position_id='" + position + "'";
            }
            System.out.println(sel3);
            ResultSet rs3 = con.selectCommand(sel3);
            while (rs3.next()) {
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
                                                <h4><%=answer%></h4>
                                                <p class="mb-0 text-muted">Available</p>
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
    </body>
</html>
