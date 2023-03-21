<%-- 
    Document   : certificate
    Created on : Sep 21, 2022, 12:18:22 PM
    Author     : Georgekutty
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Certificate</title>
        <link href='https://fonts.googleapis.com/css?family=Carattere' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Gideon Roman' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Arizonia' rel='stylesheet'>
        <style>
            .name{
                font-family: 'Carattere';
                font-size: 48px;
                position: relative;
                bottom: 265px;
                margin-left: 10em;
                color: black;
            }
            .underline{
                position: relative;
                bottom: 260px;
                left: 22em;
            }   
            .writing{
                font-family: 'Gideon Roman';
                font-size: 15px;
                position: relative;
                bottom: 16em;
                width: 35em;
                margin-left: 20em;
                color: black;
                min-height: 4em;
            }
            .underlineDate{
                position: relative;
                bottom: 201px;
                margin-left: 17em;
            }
            .underlineSign{
                position: relative;
                bottom: 20em;
                margin-left: 39em; 
            }
        </style>
    </head>
    <body>
        <jsp:include page="StudentHomeHeader.jsp" /> 
        <br>
        <%
            String sel = "select *from tbl_intership i inner join tbl_company co on i.company_id=co.company_id inner join tbl_position po on i.position_id=po.position_id where internship_id='" + request.getParameter("in_id") + "'";
            ResultSet rs = con.selectCommand(sel);
            rs.next();
        %>
        <div class="container">
            <div class="row">
                <div class="col-9">
                    <div class="canvas_div_pdf">
                        <div style="
                             background-image: url('../Assets/images/certificate.jpg');
                             width: 53em;
                             height: 32em;
                             background-size: cover;
                             background-repeat: no-repeat;">

                        </div>
                        <p class="name"><% out.print(session.getAttribute("student_name"));%></p>
                        <hr class="underline" size="8" width="50%" color="black"> 
                        <%
                            Date date = rs.getDate("from_date");
                            DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
                            String strDate = dateFormat.format(date);
                        %>
                        <%
                            Date date1 = rs.getDate("to_date");
                            DateFormat dateFormat1 = new SimpleDateFormat("dd-MMM-yyyy");
                            String strDate1 = dateFormat1.format(date1);
                        %>
                        <p class="writing">For successfully completing the internship program on <%=rs.getString("title")%> by <strong><%=rs.getString("company_name")%></strong> from <%=strDate%> to <%=strDate1%>.</p>
                        <p style="
                           position: relative;
                           bottom: 11em;
                           margin-left: 18em;
                           color:black;">
                            26-10-2022
                        </p>
                        <hr class="underlineDate" size="8" width="20%" color="black"> 
                        <p style="
                           position: relative;
                           bottom: 12.5em;
                           margin-left: 19em;
                           color: black;">
                            DATE
                        </p>
                        <img src="../Assets/images/signature2.png" width="140px" height="60px" style="
                             position: relative;
                             bottom: 19em;
                             margin-left: 40em;">
                        <hr class="underlineSign" size="8" width="20%" color="black"> 
                        <p style="
                           position: relative;
                           bottom: 19.5em;
                           margin-left: 39em;
                           color: black;">
                            SIGNATURE
                        </p>
                    </div>
                </div>
                <div class="col-3">


                    <h1 style="font-family: 'Arizonia';font-size: 58px;">Congratulations</h1>
                    <br>
                    <br>
                    <img src="../Assets/images/medal.gif" width="350px" height="250px">
                    <br>

                    <button class="btn btn-primary" style="
                            margin-left: 6em;
                            margin-top: 9em;" onclick="getPDF()">Download <i class="fas fa-arrow-down"></i></button>
                </div>
            </div>
        </div>


        <jsp:include page="StudentHomeFooter.jsp" /> 
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
        <script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
        <script>
                                function getPDF() {

                                    var HTML_Width = $(".canvas_div_pdf").width();
                                    var HTML_Height = $(".canvas_div_pdf").height();
                                    var top_left_margin = 15;
                                    var PDF_Width = HTML_Width + (top_left_margin * 2);
                                    var PDF_Height = (PDF_Width * 1.5) + (top_left_margin * 2);
                                    var canvas_image_width = HTML_Width;
                                    var canvas_image_height = HTML_Height;

                                    var totalPDFPages = Math.ceil(HTML_Height / PDF_Height) - 1;


                                    html2canvas($(".canvas_div_pdf")[0], {allowTaint: true}).then(function (canvas) {
                                        canvas.getContext('2d');

                                        console.log(canvas.height + "  " + canvas.width);


                                        var imgData = canvas.toDataURL("image/jpeg", 1.0);
                                        var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
                                        pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width, canvas_image_height);


                                        for (var i = 1; i <= totalPDFPages; i++) {
                                            pdf.addPage(PDF_Width, PDF_Height);
                                            pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height * i) + (top_left_margin * 4), canvas_image_width, canvas_image_height);
                                        }

                                        pdf.save("<% out.print(session.getAttribute("student_name"));%> Certificate.pdf");
                                    });
                                }
                                ;
        </script>
    </body>
</html>
