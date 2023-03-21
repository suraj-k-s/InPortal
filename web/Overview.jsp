<%-- 
    Document   : Overview
    Created on : Aug 24, 2022, 8:55:21 PM
    Author     : Georgekutty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .cards-wrapper {
  display: flex;
  justify-content: center;
}
.card img {
  max-width: 100%;
  max-height: 100%;
}
.card {
  margin: 0 0.5em;
  box-shadow: 2px 6px 8px 0 rgba(22, 22, 26, 0.18);
  border: none;
  border-radius: 0;
}
.carousel-inner {
  padding: 1em;
}
.carousel-control-prev,
.carousel-control-next {
  background-color: #e1e1e1;
  width: 5vh;
  height: 5vh;
  border-radius: 50%;
  top: 50%;
  transform: translateY(-50%);
}
@media (min-width: 768px) {
  .card img {
    height: 11em;
  }
}
        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
         <jsp:include page="StudentHomeHeader.jsp" /> 
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
       
    <div class="carousel-item active">
       
      <div class="cards-wrapper">
          <%
          String select ="select * from tbl_company c inner join tbl_intership i on i.company_id=c.company_id";
          ResultSet rs=con.selectCommand(select);
          while(rs.next())
          {
          %> 
      <div class="card ">
         
          <img src="../Assets/CompanyLogo/<%=rs.getString("company_logo")%>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title"><%=rs.getString("company_name")%></h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
        
      </div>
         <%
        }
        %>
    
    </div>
       
    </div>
      
  
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
          <jsp:include page="StudentHomeFooter.jsp" /> 
    </body>
</html>
