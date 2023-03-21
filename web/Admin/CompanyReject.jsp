<%-- 
    Document   : CompanyReject
    Created on : Aug 17, 2022, 11:07:23 AM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Company Reject</title>
        <style>
            #myImg {
                border-radius: 5px;
                cursor: pointer;
                transition: 0.3s;
            }

            #myImg:hover {opacity: 0.7;}

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
            }

            /* Modal Content (image) */
            .modal-content {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
            }

            /* Caption of Modal Image */
            #caption {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
                text-align: center;
                color: #ccc;
                padding: 10px 0;
                height: 150px;
            }

            /* Add Animation */
            .modal-content, #caption {    
                -webkit-animation-name: zoom;
                -webkit-animation-duration: 0.6s;
                animation-name: zoom;
                animation-duration: 0.6s;
            }

            @-webkit-keyframes zoom {
                from {-webkit-transform:scale(0)} 
                to {-webkit-transform:scale(1)}
            }

            @keyframes zoom {
                from {transform:scale(0)} 
                to {transform:scale(1)}
            }

            /* The Close Button */
            .close {
                position: absolute;
                top: 15px;
                right: 35px;
                color: #f1f1f1;
                font-size: 40px;
                font-weight: bold;
                transition: 0.3s;
            }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }

            /* 100% Image Width on Smaller Screens */
            @media only screen and (max-width: 700px){
                .modal-content {
                    width: 100%;
                }
            }
            .btn-danger {

                background-color: #df221c !important;

            }
            .btn-primary {

                background-color: #1d73bd !important;
            }
            .btn-success {

                background-color: #46b546 !important;

            }
        </style>
    </head>
    <body>
        <jsp:include page="AdminNavBar.jsp" /> 
        <%
            if (request.getParameter("did") != null) {
                String up = "update tbl_company set company_vstatus='1' where company_id='" + request.getParameter("did") + "'";
                con.executeCommand(up);
                response.sendRedirect("CompanyApproval.jsp");
            }

        %>
        <div class="inner-block" >
            <table class="table align-middle mb-0 bg-white">
                <thead class="bg-light">
                    <tr>
                        <th>#</th>  
                        <th>Name</th>
                        <th>Address</th>
                        <th>Logo</th>
                        <th>Proof</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <%        
                    String id = "";
                    String sview = "select * from tbl_company where company_vstatus='2'";

                    ResultSet rs = con.selectCommand(sview);

                    int i = 0;

                %>
                <tbody>
                    <%            while (rs.next()) {
                            i++;
                    %>
                    <tr>
                        <td>
                            <%=i%>  
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                                <img
                                    src="../Assets/CompanyLogo/<%=rs.getString("company_logo")%>"
                                    alt=""
                                    style="width: 45px; height: 45px"
                                    class="rounded-circle"
                                    />
                                <div class="ms-3">
                                    <p class="fw-bold mb-1"><%=rs.getString("company_name")%></p>
                                    <p class="text-muted mb-0"><%=rs.getString("company_email")%></p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <p class="text-muted mb-0">
                                <%=rs.getString("company_address")%>
                            </p>
                        </td>
                        <td>
                            <img
                                src="../Assets/CompanyLogo/<%=rs.getString("company_logo")%>"
                                alt=""
                                style="width: 45px; height: 45px"
                                class="rounded-circle"
                                />
                        </td>
                        <td><img
                                src="../Assets/CompanyProof/<%=rs.getString("company_proof")%>"
                                alt=""
                                style="width: 45px; height: 45px" id="myImg<%=i%>" onclick="modelpopup(this)"
                                class="rounded-circle"
                                /></td>
                        <td>
                            <a href="CompanyApproval.jsp?did=<%=rs.getString("company_id")%>"> <button type="submit" class="btn btn-success" name="btn">Approve</button></a>
                        </td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>  
        </div>
        <!--image popup-->

        <div id="myModal" class="modal">
            <span class="close">&times;</span>
            <img class="modal-content" id="img01" >
            <div id="caption"></div>
        </div>

        <jsp:include page="AdminSideBar.jsp" /> 
        <jsp:include page="AdminFooter.jsp" /> 
    </body>
    <script>
        function modelpopup(image) {
            var img = image.id;
            console.log(img);

            var modal = document.getElementById('myModal');
            var modalImg = document.getElementById("img01");
            var captionText = document.getElementById("caption");

            modal.style.display = "block";
            modalImg.src = image.src;
            captionText.innerHTML = image.alt;


            var span = document.getElementsByClassName("close")[0];

            span.onclick = function() {
                modal.style.display = "none";
            }
        }
    </script>
</html>
