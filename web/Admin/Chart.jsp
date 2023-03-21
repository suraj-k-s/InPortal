<%-- 
    Document   : Report1
    Created on : Sep 26, 2022, 2:50:44 PM
    Author     : Georgekutty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/fontawesome.min.css" rel="stylesheet">    </head>
    <body>
        <jsp:include page="AdminNavBar.jsp" /> 

        <div style="margin-left: 7em;margin-top: 8em;">  
            <div class="chartjs-wrapper mt-20 h-50 d-inline-block">
                <canvas width="400" height="200" id="myChart"></canvas>
            </div>
        </div>

        <jsp:include page="AdminSideBar.jsp" /> 
        <jsp:include page="AdminFooter.jsp" /> 

        <script>

                    const count =
            <%
                
                 
              String sview = "select * from tbl_sector";

              ResultSet rs1 = con.selectCommand(sview);
              out.println("[");
              while (rs1.next()) {
                  
                 String sview1 = "SELECT COUNT(request_id) as piecount FROM tbl_request r INNER JOIN "
                          + "tbl_intership i ON r.internship_id=i.internship_id "
                          + "INNER JOIN tbl_company c ON c.company_id=i.company_id where c.sector_id='"+rs1.getString("sector_id")+"'";
                  ResultSet rs11 = con.selectCommand(sview1);
                
                  while (rs11.next()) {
                      out.println("'"+rs11.getString("piecount")+"'");
                  }

              }
              out.println("]");
            %>

            
                    const labels = [
                         <%

              String sview2 = "select * from tbl_sector";

              ResultSet rs12 = con.selectCommand(sview2);
              while (rs12.next()) {
                  
                 
                      out.println("'"+rs12.getString("sector_name")+"'");
                 
              }
              
            %>
                    ];
                    const data = {
                    labels: labels,
                            datasets: [{
                            label: 'Sector Wise Data',
                                    backgroundColor: 'rgb(255, 99, 132)',
                                    borderColor: 'rgb(255, 99, 132)',
                                    data: count,
                            }]
                    };
                    const config = {
                    type: 'pie',
                            data: data,
                            options: {}
                    };
                    // === include 'setup' then 'config' above ===

                    const myChart = new Chart(
                            document.getElementById('myChart'),
                            config
                            );
        </script>


    </body>
</html>
