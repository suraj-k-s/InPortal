<%-- 
    Document   : Login
    Created on : Aug 9, 2022, 12:44:05 PM
    Author     : Angel
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>InPortal::Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <!-- //Meta tag Keywords -->
    <link href="//fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    <!--/Style-CSS -->
    <link rel="stylesheet" href="../Assets/css/style.css" type="text/css" media="all" />
    <!--//Style-CSS -->
    <link rel="stylesheet" href="../Assets/css/font-awesome.min.css" type="text/css" media="all">
    </head>
    <body>
         <div class="w3l-signinform">
        <!-- container -->
        <div class="wrapper">
            <!-- main content -->
            <div class="w3l-form-info">
                <div class="w3_info">
                    <h1>Welcome Back</h1>
                    <p class="sub-para"></p>
                    <h2>Log In</h2>
                    <form method="post">
                        <div class="input-group">
                            <span><i class="fa fa-user" aria-hidden="true"></i></span>
                            <input type="email" placeholder="Email or Username" required="" name="txtemailid" autocomplete="off">
                        </div>
                        <div class="input-group two-groop">
                            <span><i class="fa fa-key" aria-hidden="true"></i></span>
                            <input type="Password" placeholder="Password" required="" name="txtpassword">
                        </div>
                        <div class="form-row bottom">
                            <div class="form-check">
                                <input type="checkbox" id="remenber" name="remenber" value="remenber">
                                <label for="remenber"> Remember me?</label>
                            </div>
                            <a href="#url" class="forgot">Forgot password?</a>
                        </div>
                        <button class="btn btn-primary btn-block" type="submit" name="btnsubmit">Log In</button>
                    </form>
                
                    <p class="account">Don't have an account? <a href="../index.jsp">Register</a></p>
                </div>
            </div>
            <!-- //main content -->
        </div>
        <!-- //container -->
    </div>
         <%
        String msg="";
        if(request.getParameter("btnsubmit")!=null){
        String select = "select admin_name,admin_password,admin_id from tbl_admin where admin_email='"+request.getParameter("txtemailid")+"' and admin_password='"+request.getParameter("txtpassword")+"'";
        ResultSet rs1 = con.selectCommand(select);
        
        String cselect = "select company_email,company_name,company_logo,company_password,company_id,company_vstatus,sector_id from tbl_company where company_email='"+request.getParameter("txtemailid")+"' and company_password='"+request.getParameter("txtpassword")+"' and company_vstatus='1'";
        ResultSet rs2 = con.selectCommand(cselect);
        
         String sselect = "select student_email,student_name,student_photo,student_password,student_id from tbl_student where student_email='"+request.getParameter("txtemailid")+"' and student_password='"+request.getParameter("txtpassword")+"'";
        ResultSet rs3 = con.selectCommand(sselect);
        System.out.println(sselect);
    
        if(rs1.next()){
        session.setAttribute("admin_id", rs1.getString("admin_id"));
        session.setAttribute("admin_name", rs1.getString("admin_name"));
        response.sendRedirect("../Admin/AdminHomePage.jsp");
        }
        else if(rs2.next()){
        session.setAttribute("company_id", rs2.getString("company_id"));
        session.setAttribute("company_name", rs2.getString("company_name"));
        session.setAttribute("sector_id", rs2.getString("sector_id"));
        session.setAttribute("company_email", rs2.getString("company_email"));
         session.setAttribute("logo", rs2.getString("company_logo"));
        response.sendRedirect("../Company/CompanyHomePage2.jsp");
        String status="update tbl_company set isactive='1' where company_id='"+session.getAttribute("company_id")+"'";
        con.executeCommand(status);
        }
         else if(rs3.next()){
        session.setAttribute("student_id", rs3.getString("student_id"));
        session.setAttribute("student_name", rs3.getString("student_name"));
         session.setAttribute("photo", rs3.getString("student_photo"));
        response.sendRedirect("../Student/StudentHomePage2.jsp");
         String status="update tbl_student set isactive='1' where student_id='"+session.getAttribute("student_id")+"'";
        con.executeCommand(status);
        }
        
        else{
            %>
            <script>
       alert("Please wait for verification or Something went wrong");
         </script>
         <%
        }
}
         
        %>  
    </body>
</html>
