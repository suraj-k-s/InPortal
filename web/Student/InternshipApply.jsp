<%-- 
    Document   : InternshipApply
    Created on : Aug 21, 2022, 8:01:43 PM
    Author     : Georgekutty
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Internship Apply</title>
        <style>
            ::-webkit-scrollbar {
                width: 0px;
                background: transparent;  make scrollbar transparent 
            }
            body{
                background-color:#ecf2f5;
                margin-top:20px;
            }

            .card {
                box-shadow: 0 0 2px 0 rgb(0 0 0 / 10%);
                margin-bottom: 24px;
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid #ecf2f5;
                border-radius: .25rem;
            }
            .avatar-lg {
                height: 4.5rem;
                width: 4.5rem;
            }
            .rounded-circle {
                border-radius: 50%!important;
            }
            .img-thumbnail {
                padding: .25rem;
                background-color: #ecf2f5;
                border: 1px solid #dee2e6;
                border-radius: .25rem;
                max-width: 100%;
                height: auto;
            }
            .avatar-sm {
                height: 2.25rem;
                width: 2.25rem;
            }
            .rounded-circle {
                border-radius: 50%!important;
            }
            .me-2 {
                margin-right: .75rem!important;
            }
            .avatar-md {
                height: 3.5rem;
                width: 3.5rem;
            }
            .rounded-circle {
                border-radius: 50%!important;
            }
            .bg-transparent {
                --bs-bg-opacity: 1;
                background-color: transparent!important;
            }
            .post-user-comment-box {
                background-color: #f2f8fb;
                margin: 0 -.75rem;
                padding: 1rem;
                margin-top: 20px;
            }
            .simplebar-wrapper {
                overflow: hidden;
                width: inherit;
                height: inherit;
                max-width: inherit;
                max-height: inherit;
            }
            .simplebar-height-auto-observer-wrapper {
                box-sizing: inherit!important;
                height: 100%;
                width: 100%;
                max-width: 1px;
                position: relative;
                float: left;
                max-height: 1px;
                overflow: hidden;
                z-index: -1;
                padding: 0;
                margin: 0;
                pointer-events: none;
                flex-grow: inherit;
                flex-shrink: 0;
                flex-basis: 0;
            }
            .font-13 {
                font-size: 13px!important;
            }
            .btn-soft-info {
                color: #45bbe0;
                background-color: rgba(69,187,224,.18);
                border-color: rgba(69,187,224,.12);
            }
            .social-list-item {
                height: 2rem;
                width: 2rem;
                line-height: calc(2rem - 2px);
                display: block;
                border: 2px solid #adb5bd;
                border-radius: 50%;
                color: #adb5bd;
            }
            .comment-area-box .comment-area-btn {
                background-color: #f2f8fb;
                padding: 10px;
                border: 1px solid #dee2e6;
                border-top: none;
                border-radius: 0 0 .2rem .2rem;
            }
            .card{
                position: inherit !important;
            }
            .follow:hover{
                background-color: #f35b04 !important;
                border-style: none;
                color: #fff !important;
            }
        </style>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
        <link href="https://vjs.zencdn.net/7.20.2/video-js.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-quality-levels/2.1.0/videojs-contrib-quality-levels.min.js" integrity="sha512-IcVOuK95FI0jeody1nzu8wg/n+PtQtxy93L8irm+TwKfORimcB2g4GSHdc0CvsK8gt1yJSbO6fCtZggBvLDDAQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/videojs-hls-quality-selector@1.1.4/dist/videojs-hls-quality-selector.cjs.min.js"></script>
        <script>
            function changedata() {

                document.getElementById("id_name").removeAttribute("readonly");
                document.getElementById("id_email").removeAttribute("readonly");
                document.getElementById("id_contact").removeAttribute("readonly");
                document.getElementById("id_address").removeAttribute("readonly");
            }
        </script>
    </head>

    <body>
        <%

            if (request.getParameter("in_id") != null) {
                session.setAttribute("in_id", request.getParameter("in_id"));
            }
        %>
        <%
            if (request.getParameter("btnsubmit") != null) {
                String sel4 = "insert into tbl_request(internship_id,student_id,request_date) values('" + request.getParameter("txt_id") + "','" + session.getAttribute("student_id") + "',curdate())";
                if (con.executeCommand(sel4)) {
        %>
        <script>
            alert("Data Inserted");
            window.location = "CompanyView.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Data Insertion Failed");
            window.location = "CompanyView.jsp";
        </script>
        <%
                }
            }

        %>
        <jsp:include page="StudentHomeHeader.jsp" /> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />

        <div class="container">
            <div class="row">
                <div class="col-xl-5">
                    <div class="card">
                        <div class="card-body" style="min-height: 36em;">
                            <div class="dropdown float-end">
                                <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="mdi mdi-dots-vertical"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item">Edit</a>
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item">Delete</a>
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item">Block</a>
                                </div>
                            </div>
                            <%                                
                                String sel = "select *from tbl_intership i inner join tbl_company p on i.company_id=p.company_id inner join tbl_position po on po.position_id=i.position_id inner join tbl_syllabus sy on i.internship_id=sy.internship_id where i.internship_id='" + request.getParameter("in_id") + "'";
                                ResultSet rs = con.selectCommand(sel);
                                rs.next();

                            %>
                            <div class="d-flex align-items-start">
                                <img src="../Assets/CompanyLogo/<%=rs.getString("company_logo")%>" class="rounded-circle avatar-lg img-thumbnail" alt="profile-image">
                                <div class="w-100 ms-3">
                                    <h4 class="my-0"><%=rs.getString("company_name")%></h4>
                                    <p class="text-muted"><%=rs.getString("company_email")%></p>
                                    <button type="button" class="follow btn btn-soft-primary ">Follow</button>
                                    <a href="StudentChat.jsp"><button type="button" class="follow btn btn-soft-success ">Message</button></a>
                                </div>
                            </div>

                            <div class="mt-3">
                                <h4 class="font-13 text-uppercase">About Us :</h4>
                                <p class="text-muted font-13 mb-3 text-justify">
                                    <%=rs.getString("company_about")%>
                                </p>
                                <p class="text-muted mb-2 font-13"><strong>Full Name :</strong> <span class="ms-2"> <%=rs.getString("company_name")%></span></p>

                                <p class="text-muted mb-2 font-13"><strong>License No :</strong> <span class="ms-2"> <%=rs.getString("company_liscenceno")%></span></p>

                                <p class="text-muted mb-2 font-13"><strong>Mobile :</strong><span class="ms-2"> <%=rs.getString("company_contact")%></span></p>

                                <p class="text-muted mb-2 font-13"><strong>Email :</strong> <span class="ms-2"><%=rs.getString("company_email")%></span></p>

                                <p class="text-muted mb-1 font-13"><strong>Location :</strong> <span class="ms-2"><%=rs.getString("company_location")%></span></p>
                            </div>                                    

                            <ul class="social-list list-inline mt-3 mb-0">
                                <li class="list-inline-item">
                                    <a href="javascript: void(0);" class="social-list-item text-center border-primary text-primary"><i class="mdi mdi-facebook"></i></a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="javascript: void(0);" class="social-list-item text-center border-danger text-danger"><i class="mdi mdi-google"></i></a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="javascript: void(0);" class="social-list-item text-center border-info text-info"><i class="mdi mdi-twitter"></i></a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="javascript: void(0);" class="social-list-item text-center border-secondary text-secondary"><i class="mdi mdi-github"></i></a>
                                </li>
                            </ul>   
                        </div>                                 
                    </div> <!-- end card -->







                </div> <!-- end col-->

                <div class="col-xl-7">
                    <div class="card">
                        <div class="card-body" style="min-height: 36em;">
                            <!-- comment box -->
                            <form action="#" class="comment-area-box mb-3">
                                <span class="input-icon">
                                    <h4 class="form-label">Internship Details</h4>
                                    <br>
                                    <div class="float-end">

                                    </div>
                                    <!--Portland body-->
                                    <div class="card-header tab-card-header">
                                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="One" aria-selected="true">Guidelines</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="two-tab" data-toggle="tab" href="#two" role="tab" aria-controls="Two" aria-selected="false">Basic</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="three-tab" data-toggle="tab" href="#three" role="tab" aria-controls="Three" aria-selected="false">Syllabus</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="three-tab" data-toggle="tab" href="#four" role="tab" aria-controls="Three" aria-selected="false">Review</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="tab-content" id="myTabContent" style="min-height: 19em;">
                                        <div class="tab-pane fade show active p-3" id="one" role="tabpanel" aria-labelledby="one-tab" style="overflow:scroll;height:21.5em;">

                                            <p class="card-text">1) The University Grants Commission (UGC) gave “in-principle approval” to the country’s nearly 1,000 universities to offer online up to 40 per cent of any of the courses.</p>
                                            <p class="text-justify">2) In addition, 200 odd ones out of them were also given “in-principle approval” to conduct the entire degree course online only.</p>
                                            <p class="text-justify">3) These recommendations have come through several committees. A committee led by the vice-chancellor of the Indira Gandhi National Open University, Nageswar Rao, has advised making it mandatory to suggest ways to an expansion of online education.</p> 
                                            <p class="text-justify">4) The panel also suggested that the present provision for only 20 per cent of a course, which is allowed to be taught online, should be raised up to 40 per cent in order to consider the “national interest” due to the emergence of the Covid-19 outbreak.</p> 
                                            <p class="text-justify">5) If it does then surely these universities will be capable of offering several online courses from the upcoming academic session that is yet to come. UGC-approved courses related to nursing, law, pharmacy, engineering, dentistry, medicine, and architecture have been kept aside from the bounds of online courses.</p> 
                                        </div>
                                        <div class="tab-pane fade p-3" id="two" role="tabpanel" aria-labelledby="two-tab" style="height:21.5em;">
                                            <strong>Position Name: </strong><label class="form-label"><span class="badge rounded-pill bg-success">  <%=rs.getString("Position_name")%>  </span></label>
                                            <br>
                                         <strong>Title: </strong><!--<label class="form-label"><%//=rs.getString("title")%></label>--><span class="badge rounded-pill bg-warning text-dark"><%=rs.getString("title")%></span>
                                            <br>
                                            <strong>Starts on: </strong><label class="form-label"><%=rs.getString("from_date")%></label>
                                            <br>
                                            <strong>Ends on: </strong><label class="form-label"><%=rs.getString("to_date")%></label>
                                            <br>
                                            <strong>Registration Fee: </strong><i class="fas fa-rupee-sign"></i><label class="form-label"><%=rs.getString("internship_regfee")%></label>
                                            <br>
                                            <strong>Amount: </strong><i class="fas fa-rupee-sign"></i><label class="form-label"><%=rs.getString("internship_amount")%></label>
                                            <br>
                                            <strong>No of Openings: </strong><label class="form-label"><%=rs.getString("openings")%></label>
                                            <br>
                                            <strong>Description:</strong>
                                            <br>
                                            <p class="text-justify"><%=rs.getString("internship_details")%></p> 

                                        </div>
                                        <div class="tab-pane fade p-3" id="three" role="tabpanel" aria-labelledby="three-tab" style="height:21.5em;">
                                            <br>

                                            <video
                                                id="my-video"
                                                class="video-js"
                                                controls
                                                preload="auto"
                                                width="610"
                                                height="310"
                                                poster="../Assets/SyllabusMaterials/<%=rs.getString("syllabus_tumbnail")%>"
                                                data-setup="{}"

                                                >
                                                <source src="../Assets/SyllabusMaterials/<%=rs.getString("syllabus_material")%>" type="video/mp4" />

                                                <source src="MY_VIDEO.webm" type="video/webm" />

                                                <p class="vjs-no-js">
                                                    To view this video please enable JavaScript, and consider upgrading to a
                                                    web browser that
                                                    <a href="https://videojs.com/html5-video-support/" target="_blank"
                                                       >supports HTML5 video</a
                                                    >
                                                </p>
                                            </video>           
                                        </div>
                                        <div class="tab-pane fade p-3" id="four" role="tabpanel" aria-labelledby="three-tab" style="height:21.5em;overflow: scroll;">
                                            
                                            <%
                                               
                                                String sel3 = "select *from tbl_review where internship_id='" + request.getParameter("in_id") + "'";
                                                ResultSet rs5 = con.selectCommand(sel3);
                                                while (rs5.next()) {
                                                   

                                            %>
                                            <div class="row" style="padding:1em;">
                                                <div class="col-1">  
                                                    <img alt="Generic placeholder image" src="http://bootdey.com/img/Content/avatar/avatar6.png" class="mr-3 rounded-pill" style="
                                                         max-height: 50px;max-width: 50px;min-height:50px;min-width:50px;">
                                                </div>

                                                <div class="col-10" style="margin-left:10px;">
                                                    <div class="row">
                                                        <div class="col-8">
                                                            <p><%=rs5.getString("user_name")%></p> 
                                                        </div>
                                                        <div class="col-4">
                                                            <%
                                                               int average_rating = Integer.parseInt(rs5.getString("user_rating"));
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
                                                    </div>
                                                    <p><%=rs5.getString("review_datetime")%></p> 
                                                    <p><%=rs5.getString("user_review")%></p> 
                                                </div>
                                            </div>
                                               
                                            <%
                                                }
                                            %>
                                            
                                            <%
                                              String select = "select count(internship_id) as co from tbl_review where internship_id ='" + request.getParameter("in_id") + "'";
                                                ResultSet result = con.selectCommand(select);
                                                result.next();
                                                if(result.getString("co").equals("0"))
                                                {
                                                %>
                                                 <div style="position: relative;left: 15em;top: 8em;">
                                                                                            <i class="fas fa-star" style="color:grey;"></i>
                                                                                            <i class="fas fa-star" style="color:grey;"></i>
                                                                                            <i class="fas fa-star" style="color:grey;"></i>
                                                                                            <i class="fas fa-star" style="color:grey;"></i>
                                                                                            <i class="fas fa-star" style="color:grey;"></i>
                                            
                                                                                            <br>
                                                                                            No reviews Yet
                                                                                        </div>
                                                <%
                                                }
                                                %>
                                        </div>
                                    </div>
                                    <!--Portaland body ends-->
                                    <!--                            <div>
                                                                   Position Name: <label class="form-label"><%//=rs.getString("Position_name")%></label>
                                             <br>
                                             Title: <label class="form-label"><%//=rs.getString("title")%></label>
                                             <br>
                                             Begin: <label class="form-label"><%//=rs.getString("from_date")%></label>
                                             <br>
                                             End: <label class="form-label"><%//=rs.getString("to_date")%></label>
                                             <br>
                                             Reg.Fee: <i class="fas fa-rupee-sign"></i><label class="form-label"><%//=rs.getString("internship_regfee")%></label>
                                             <br>
                                             Amount: <i class="fas fa-rupee-sign"></i><label class="form-label"><%//=rs.getString("internship_amount")%></label>
                                             <br>
                                             No of Openings <label class="form-label"><%//=rs.getString("openings")%></label>
                                         </div>-->
                                    <!--                     <div>
                                                              <label class="form-label" style="text-decoration: underline">About</label>
                                                             <p><%//=rs.getString("internship_details")%></p> 
                                                                   
                                                                </div>-->
                            </form>
                            <!-- end comment box -->

                            <!-- Story Box-->





                            <br>
                            <div class="text-center">
                                <a href="#" class="text-danger">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalScrollable2">
                                        Apply Now
                                    </button>  
                                </a>
                            </div>
                        </div>
                    </div> <!-- end card-->
                    <!-- Button trigger modal -->




                </div> <!-- end col -->
            </div>
            <!-- end row-->

        </div>
        <!-- Modal -->
        <%
            String sel2 = "select * from tbl_student where student_id='" + session.getAttribute("student_id") + "'";
            ResultSet rs1 = con.selectCommand(sel2);
            rs1.next();
        %>   



        <form method="post">
            <div class="modal fade" id="exampleModalScrollable2" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalScrollableTitle">Please confirm the details</h5>

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h2 class="form-label" style="font-size: 18px;color: orange;"><i class="fas fa-user"></i> Personal Details <i class="fas fa-user-edit float-end" onclick="changedata()"></i></h2>
                            <input type="hidden" readonly class="form-control" name="txt_id" id="id_name" value="<%=rs.getString("internship_id")%>"> 
                            <label class="form-label">Name:</label>
                            <input type="text" readonly class="form-control" name="txt_name" id="id_name" value="<%=rs1.getString("student_name")%>">
                            <label class="form-label">Email:</label>
                            <input type="text" readonly class="form-control" name="txt_email" id="id_email" value="<%=rs1.getString("student_email")%>">
                            <label class="form-label">Contact:</label>
                            <input type="text" readonly class="form-control" name="txt_contact" id="id_contact" value="<%=rs1.getString("student_contact")%>">
                            <label class="form-label">Address:</label>
                            <textarea class="form-control" rows="5" cols="50" name="txt_address" id="id_address" readonly><%=rs1.getString("student_address")%></textarea>
                            <br>
                            <h2 class="form-label" style="font-size: 18px;color: orange;"><i class="fas fa-graduation-cap"></i> Internship Details</h2>
                            <label class="form-label" >Position Name</label>
                            <input type="text" readonly class="form-control" name="txt_pname" value="<%=rs.getString("position_name")%>">
                            <label class="form-label" >Title</label>
                            <input type="text" readonly class="form-control" name="txt_title" value="<%=rs.getString("title")%>">
                            <label class="form-label" >Company Name</label>
                            <input type="text" readonly class="form-control" name="txt_cname" value="<%=rs.getString("company_name")%>">
                            <label class="form-label" >Begin</label>
                            <input type="text" readonly class="form-control" name="txt_bdate" value="<%=rs.getString("from_date")%>">
                            <label class="form-label" >To</label>
                            <input type="text" readonly class="form-control" name="txt_tdate" value="<%=rs.getString("to_date")%>">
                            <label class="form-label" >Register Fee</label>
                            <input type="text" readonly class="form-control" name="txt_regfee" value="<%=rs.getString("internship_regfee")%>">
                            <label class="form-label" >Amount</label>
                            <input type="text" readonly class="form-control" name="txt_regfee" value="<%=rs.getString("internship_amount")%>">
                            <br>
                            <p class="form-label" >&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >I <%=rs1.getString("student_name")%> assure that the following details are correct.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" name="btnsubmit">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script src="https://vjs.zencdn.net/7.20.2/video.min.js"></script>
        <script>
                                var player = videojs('my-video');

                                player.hlsQualitySelector();
        </script>
        <jsp:include page="StudentHomeFooter.jsp" /> 
    </body>
</html>
