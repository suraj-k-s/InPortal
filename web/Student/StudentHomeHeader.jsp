<%-- 
    Document   : HomePage
    Created on : Aug 13, 2022, 9:28:57 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Student HomePage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <style></style>
        <script type='text/javascript' src=''></script>
        <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
        <link href="../Assets/StudentPageProperties/headers.css" rel="stylesheet">
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }

            .b-example-divider {
                height: 3rem;
                background-color: rgba(0, 0, 0, .1);
                border: solid rgba(0, 0, 0, .15);
                border-width: 1px 0;
                box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            }

            .b-example-vr {
                flex-shrink: 0;
                width: 1.5rem;
                height: 100vh;
            }

            .bi {
                vertical-align: -.125em;
                fill: currentColor;
            }

            .nav-scroller {
                position: relative;
                z-index: 2;
                height: 2.75rem;
                overflow-y: hidden;
            }

            .nav-scroller .nav {
                display: flex;
                flex-wrap: nowrap;
                padding-bottom: 1rem;
                margin-top: -1px;
                overflow-x: auto;
                text-align: center;
                white-space: nowrap;
                -webkit-overflow-scrolling: touch;
            }
            a.dropdown-item {
                font-weight:100!important;
            }
            .nav-link:hover{
                color: orange!important; 
            }
        </style>
    </head>
    <body>
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="bootstrap" viewBox="0 0 118 94">
        <title>Bootstrap</title>
        <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
    </symbol>


    <symbol id="table" viewBox="0 0 16 16">
        <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"/>
    </symbol>


    </svg>
    <main style=" background-color: #15151f;position:sticky;top: 0;z-index: 100;">
        <header class="p-3 mb-3 border-bottom">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <div style="font-size: xx-large;color:white;">
                        <a href="StudentHomePage2.jsp"><i class="fab fa-linkedin-in" style="color: orange;"></i></a>Portal
                    </div>

                    <ul id="menu12" class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0" style="margin-left:5em;">
                        <li><a href="Overview.jsp" class="nav-link px-2 text-white">Overview</a></li>
                        <!--          <li><a href="#" class="nav-link px-2 text-white">Internship</a></li>-->
                        <!--          <li><a href="#" class="nav-link px-2 text-white">Customers</a></li>-->
                        <li class="nav-item dropdown">
                            <a class="nav-link px-2 text-white dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Internship <i class="fas fa-caret-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="CompanyView.jsp">Company</a></li>
                                <li><a class="dropdown-item" href="InternshipView.jsp">Internship</a></li>
                                <li><a class="dropdown-item" href="InternshipStatus.jsp">Applied</a></li>
                            </ul>
                        </li>
                        <li><a href="ResumeStart.jsp" class="nav-link px-2 text-white">Resume</a></li>
                        <li><a href="#" class="nav-link px-2 text-white" data-toggle="modal" data-target="#exampleModalScrollable"> 
                                    Feedback
                                    </a></li>
                    </ul>

                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                        <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
                    </form>

                    <div class="dropdown text-end">
                        <a href="#" class="nav-link px-2 text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="../Assets/StudentPhoto/<% out.print(session.getAttribute("photo"));%>" alt="mdo" width="32" height="32" class="rounded-circle">
                            <i class="fas fa-caret-down"></i>
                        </a>
                        <ul  class="dropdown-menu text-small">
                            <li><a class="dropdown-item" href="StudentMyProfile.jsp"><i class="fas fa-user-circle"></i> My Profile</a></li>
                            <li><a class="dropdown-item" href="StudentMyProfile.jsp"><i class="fas fa-lock"></i> Change Password</a></li>
                            <li><a class="dropdown-item" href="MyLibrary.jsp"><i class="fas fa-book"></i> My Library</a></li>
                            <li><a class="dropdown-item" href="StudentChat.jsp"><i class="fas fa-comment-dots"></i> Chat</a></li>

                            <form method="post">
                                <%
                                    if (request.getParameter("btnsubmit") != null) {
                                        String status = "update tbl_student set isactive='0' where student_id='" + session.getAttribute("student_id") + "'";
                                        con.executeCommand(status);

                                %>
                                <script>
                                    window.location.href = '../Guest/Login.jsp';
                                </script>
                                <%                }
                                %>
                                <li><a class="dropdown-item" href="#"><i class="fa fa-sign-out"><input type="submit" name="btnsubmit" value="Sign out" style="border-style: none;background-color: white;color: #525252;"></i></a></li>


                            </form>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
    </main>

    <!--feedback-->
    <%
    if (request.getParameter("btnsubmit2") != null) {
                String sel4 = "insert into tbl_feedback(feedback_content,student_id) values('"+request.getParameter("txt_feedback")+"','"+session.getAttribute("student_id")+"')";
                 if (con.executeCommand(sel4)) {
        %>
        <script>
            alert("Feedback Submitted");
           
        </script>
        <%
        } else {
        %>
        <script>
            alert("Feedback submission Failed");
           
        </script>
        <%
                }
            }
    %>
    <form method="post">
        <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Write your feedback</h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                       
                       
                        <label class="form-label">Feedback:</label>
                        <textarea class="form-control" rows="5" cols="50" name="txt_feedback" id="id_address" ></textarea>
                        <br>
                      
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="btnsubmit2">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </form>


</body>
</html>
