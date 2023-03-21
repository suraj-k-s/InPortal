<%-- 
    Document   : StudentChat
    Created on : Aug 29, 2022, 11:58:11 AM
    Author     : Georgekutty
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Student Chat</title>
        <style>
            body{margin-top:20px;}
            ::-webkit-scrollbar {
                width: 0px;
                background: transparent;  make scrollbar transparent 
            }
            .chat-online {
                color: #34ce57
            }

            .chat-offline {
                color: #e4606d
            }

            .chat-messages {
                display: flex;
                flex-direction: column;
                max-height: 400px;
                overflow-y: scroll
            }

            .chat-message-left,
            .chat-message-right {
                display: flex;
                flex-shrink: 0
            }

            .chat-message-left {
                margin-right: auto
            }

            .chat-message-right {
                flex-direction: row-reverse;
                margin-left: auto
            }
            .py-3 {
                padding-top: 1rem!important;
                padding-bottom: 1rem!important;
            }
            .px-4 {
                padding-right: 1.5rem!important;
                padding-left: 1.5rem!important;
            }
            .flex-grow-0 {
                flex-grow: 0!important;
            }
            .border-top {
                border-top: 1px solid #dee2e6!important;
            }
        </style>
        <%
            if (request.getParameter("cid") != null) {
                String Update = "update tbl_chat set chat_status='1' where from_company_id='" + request.getParameter("cid") + "' and to_student_id='" + session.getAttribute("student_id") + "'";
                con.executeCommand(Update);
            }
        %>
    </head>
    <body onload="scrollDown()">
        <jsp:include page="StudentHomeHeader.jsp" /> 
        <div>
            <main class="content">
                <div class="container p-0">

                    <h1 class="h3 mb-3">Messages</h1>
                    <div class="card">
                        <div class="row g-0">
                            <div class="col-12 col-lg-5 col-xl-3 border-right">

                                <div class="px-4 d-none d-md-block">
                                    <div class="d-flex align-items-center">
                                        <div class="flex-grow-1">
                                            <input type="text" class="form-control my-3" placeholder="Search..." onkeyup="getCompany(this.value)">
                                        </div>
                                    </div>
                                </div>
                                <div style="overflow-y: auto;height: 450px" id="gang">
                                    <%
                                        String comId = request.getParameter("cid");
                                        String comName = request.getParameter("cname");
                                        String comPhoto = request.getParameter("cphoto");

                                        String select = "select * from tbl_company where company_vstatus='1'";
                                        ResultSet res = con.selectCommand(select);
                                        while (res.next()) {

                                            String select2 = "select count(chat_id) as cid from tbl_chat where to_student_id='" + session.getAttribute("student_id") + "' and from_company_id='" + res.getString("company_id") + "' and chat_status='0' ";
                                            ResultSet res2 = con.selectCommand(select2);
                                            res2.next();

                                    %>
                                    <a href="StudentChat.jsp?cid=<%=res.getString("company_id")%>&cname=<%=res.getString("company_name")%>&cphoto=<%=res.getString("company_logo")%>" class="list-group-item list-group-item-action border-0">
                                        <%
                                            if (Integer.parseInt(res2.getString("cid")) != 0) {

                                        %>    

                                        <div class="badge bg-success float-right"><%=res2.getString("cid")%></div>
                                        <%
                                            }
                                        %> 
                                        <div class="d-flex align-items-start">
                                            <img src="../Assets/CompanyLogo/<%=res.getString("company_logo")%>" class="rounded-circle mr-1" alt="Vanessa Tucker" width="40" height="40">
                                            <div class="flex-grow-1 ml-3">
                                                <strong style="color:#1366f2 !important;"><%=res.getString("company_name")%></strong>

                                                <%
                                                    if (res.getString("isactive").equals("1")) {
                                                %>
                                                <div class="small"><span class="fas fa-circle chat-online"></span> Online</div>
                                                <%
                                                } else {
                                                %>
                                                <div class="small"><span class="fas fa-circle chat-offline"></span> Offline</div> 
                                                <%
                                                    }
                                                %> 

                                            </div>
                                        </div>
                                    </a>

                                    <%
                                        }
                                    %>

                                </div>
                                <hr class="d-block d-lg-none mt-1 mb-0">
                            </div>
                            <%

                            %>
                            <div class="col-12 col-lg-7 col-xl-9">
                                <div class="py-2 px-4 border-bottom d-none d-lg-block" style="min-height: 3.4em;">
                                    <div class="d-flex align-items-center py-1">
                                        <%                                           if (comId != null) {
                                        %>
                                        <div class="position-relative" >
                                            <img src="../Assets/CompanyLogo/<%=comPhoto%>" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                        </div>
                                        <div class="flex-grow-1 pl-3">
                                            <strong><%=comName%></strong>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>

                                <div class="position-relative" style="min-height:400px!important;">
                                    <div class="chat-messages p-4" id="conversation"></div>
                                </div>

                                <div class="flex-grow-0 py-3 px-4 border-top">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="msg" placeholder="Type your message">
                                        <input type="hidden" id="cid" value="<%=comId%>">
                                        <button class="btn btn-primary" onclick="sendChat()">Send</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <br>
        <br>
        <jsp:include page="StudentHomeFooter.jsp" /> 
    </body>


    <script src="../Assets/JQ/jQuery.js"></script>
    <script>

                                            function scrollDown()
                                            {
                                                $('#conversation').animate({scrollTop: 10000});
                                            }




                                            function getCompany(pid)
                                            {
                                                $.ajax({
                                                    url: "AjaxSearch.jsp?pid=" + pid,
                                                    success: function(html) {
                                                        $("#gang").html(html);
                                                    }
                                                });
                                            }
                                            function sendChat()
                                            {

                                                var chat = document.getElementById("msg").value;
                                                var cid = document.getElementById("cid").value;
                                                if (chat.length <= 35)
                                                {

                                                    $.ajax({url: "AjaxChat.jsp?chat=" + chat + "&cid=" + cid,
                                                        success: function(result) {
                                                            document.getElementById("msg").value = "";
                                                            $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
                                                        }});
                                                } else
                                                {
                                                    alert("Character Length less Than 35 Allowed");
                                                    document.getElementById("msg").value = "";
                                                    $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
                                                }
                                            }
                                            $(document).ready(function() {
                                                setInterval(function() {
                                                    var cid = document.getElementById("cid").value;
                                                    $("#conversation").load('AjaxLoad.jsp?cid=' + cid)
                                                }, 150);
                                            });




    </script>
</html>
