<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%
    String sel = "select *from tbl_intership i inner join tbl_company p on i.company_id=p.company_id inner join tbl_position po on po.position_id=i.position_id where po.position_name LIKE '" + request.getParameter("did") + "%'";
    System.out.println(sel);
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
<div class="card mb-3" id="result" >
    <div class="card-body">
        <div class="d-flex flex-column flex-lg-row">
            <span class="avatar avatar-text rounded-3 me-4 bg-warning mb-2"><img src="../Assets/CompanyLogo/<%=rs.getString("company_logo")%>"
                                                                                 style="height: 49px;width: 52px;border-radius: 8px;"
                                                                                 ></span>
            <div class="row flex-fill">
                <div class="col-sm-4">
                    <h4 class="h5"><%=rs.getString("position_name")%></h4>
                    <h3 style="font-size: 14px;margin-top: -1em;color: #888484;"><%=rs.getString("title")%></h3>
                    <span class="badge bg-secondary"><%=rs.getString("openings")%></span> <span class="badge bg-success"><%=rs.getString("from_date")%> to <%=rs.getString("to_date")%></span>
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
