<%-- 
    Document   : InternshipRegister
    Created on : Aug 17, 2022, 9:27:29 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Internship Register</title>
        <style>
            body{margin-top:20px;
background-color: #f7f7fc;
}

.timeline {
    list-style-type: none;
    position: relative
}

.timeline:before {
    background: #dee2e6;
    left: 9px;
    width: 2px;
    height: 100%
}

.timeline-item:before,
.timeline:before {
    content: " ";
    display: inline-block;
    position: absolute;
    z-index: 1
}

.timeline-item:before {
    background: #fff;
    border-radius: 50%;
    border: 3px solid #3b7ddd;
    left: 0;
    width: 20px;
    height: 20px
}
.card {
    margin-bottom: 24px;
    box-shadow: 0 0 0.875rem 0 rgba(33,37,41,.05);
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: initial;
    border: 0 solid transparent;
    border-radius: .25rem;
}
.card-body {
    flex: 1 1 auto;
    padding: 1.25rem;
}
.card-header:first-child {
    border-radius: .25rem .25rem 0 0;
}
.card-header {
    border-bottom-width: 1px;
}
.pb-0 {
    padding-bottom: 0!important;
}
.card-header {
    padding: 1rem 1.25rem;
    margin-bottom: 0;
    background-color: #fff;
    border-bottom: 0 solid transparent;
}
        </style>
    </head>
    <body>
          <jsp:include page="CompanyHomeHeader.jsp" />
          <br> <br>
            <%
      
         if (request.getParameter("btnsubmit1s") != null) {
               
         String query = "insert into tbl_intership(position_id,company_id,title,from_date,to_date,internship_regfee,internship_amount,openings,internship_details) values('"+request.getParameter("position_list")+"','"+session.getAttribute("company_id")+"','"+request.getParameter("title")+"','"+request.getParameter("from_date")+"','"+request.getParameter("to_date")+"','"+request.getParameter("regfee")+"','"+request.getParameter("amount")+"','"+request.getParameter("openings")+"','"+request.getParameter("details")+"')";
          if (con.executeCommand(query)) {
        %>
        <script>
            alert("Data Inserted");
            window.location = "InternshipRegister.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Data Insertion Failed");
            window.location = "InternshipRegister.jsp";
        </script>
        <%
        }
      }
    
        %>
         <!--delete code-->
        <%
          if(request.getParameter("did")!=null){
       String dl = "delete from tbl_intership where internship_id='"+request.getParameter("did")+"'";
        if (con.executeCommand(dl)) {
        %>
        <script>
            alert("Deleted");
            window.location = "InternshipRegister.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Delete Failed");
            window.location = "InternshipRegister.jsp";
        </script>
        <%
                }
       
       }
        %>
          <div class="container">
    <div class="container-fluid p-0">
		
		<div class="row">
			
			<div class="col-xl-4">
				<div class="card" style="position: inherit!important;">
					<div class="card-header">
						<div class="card-actions float-right">
							
						</div>
                                         <%
                                         String str = "select * from tbl_company where company_id='"+session.getAttribute("company_id")+"'";
                                         ResultSet rs5=con.selectCommand(str);
                                         rs5.next();
                                         %>
						<h5 class="card-title mb-0">Register Internships</h5>
					</div>
					<div class="card-body">
						<div class="row g-0">
							<div class="col-sm-3 col-xl-12 col-xxl-3 text-center">
                                                            <img src="../Assets/CompanyLogo/<%=rs5.getString("company_logo")%>" width="64" height="64" class="rounded-circle mt-2" alt="Angelica Ramos">
							</div>
							<div class="col-sm-9 col-xl-12 col-xxl-9">
                                                            <strong style="margin-left: 6em;"><%=rs5.getString("company_email")%></strong>
								<p>Please Register your Internships details.</p>
							</div>
						</div>
                                            <form method="post">
						<table class="table table-sm mt-2 mb-4">
							<tbody>
								<tr>
									<th>Position</th>
                                                                        <td>
                                                                            <select class="form-control" name="position_list">
                                                                                <option selected="">Choose..</option>
                                                                                  <%
                                                                                  String s="select *from  tbl_position  where sector_id='"+session.getAttribute("sector_id")+"'";
                                                                                   ResultSet rs = con.selectCommand(s);
         
                                                                                    while(rs.next()){
                   
                                                                                      %> 
                                                                                    <option value="<%=rs.getString("position_id")%>">
                        
                        
                                                                                    <%=rs.getString("position_name")%>
                                                                                     </option>
                                                                                      <%
                                                                                      }
                                                                                     %>
                                                                            </select>
                                                                        </td>
								</tr>
                                                                <tr>
									<th>Title</th>
                                                                        <td>
                                                                            <input type="text" class="form-control" name="title">
                                                                        </td>
								</tr>
								<tr>
									<th>From</th>
                                                                        <td>
                                                                            <input type="date" class="form-control" name="from_date">
                                                                        </td>
								</tr>
								<tr>
									<th>To</th>
                                                                        <td>
                                                                            <input type="date" class="form-control" name="to_date">
                                                                        </td>
								</tr>
								<tr>
									<th>Reg.Fee</th>
                                                                        <td>
                                                                            <input type="text" class="form-control" name="regfee">
                                                                        </td>
								</tr>
                                                                <tr>
									<th>Amount</th>
                                                                        <td>
                                                                            <input type="text" class="form-control" name="amount">
                                                                        </td>
								</tr>
                                                                <tr>
									<th>Openings</th>
                                                                        <td>
                                                                           <input type="text" class="form-control" name="openings">
                                                                        </td>
								</tr>
								<tr>
									<th>Details</th>
                                                                        <td>
                                                                            <textarea class="form-control" rows="4" cols="30" name="details">
                                                                                
                                                                            </textarea>
                                                                        </td>
								</tr>
							</tbody>
						</table>
                                           <button type="submit" class="btn btn-primary btn-lg" name="btnsubmit1s" style="width: 71%;margin-left: 91px;">Submit</button>
						</form>
					</div>
				</div>
			</div>
                    <!--Table Begins-->
                    <div class="col-xl-8">
				<div class="card" style="position: inherit!important;width: 51em;">
					<div class="card-header pb-0">
						<div class="card-actions float-right">
							
						</div>
						<h5 class="card-title mb-0">Internship Details</h5>
					</div>
					<div class="card-body">
						<table class="table table-striped" style="width:100%">
							<thead>
								<tr>
									<th>#</th>
									<th>Position</th>
                                                                        <th>Title</th>
									<th>From</th>
									<th>To</th>
                                                                        <th>Reg.Fee</th>
                                                                        <th>Amount</th>
                                                                        <th>Openings</th>
                                                                        <th>Details</th>
									<th>Status</th>
								</tr>
							</thead>
                                                          <%
           
            String sview;
            
            sview="select * from tbl_intership i inner join tbl_position p on i.position_id=p.position_id where company_id='"+session.getAttribute("company_id")+"'";
            
            ResultSet rs1 = con.selectCommand(sview);
            int i=0;
            
            %>
							<tbody>
                                                             <%
                    while(rs1.next()){
                    i++;
                 %> 
								<tr>
                                                                    <td>
                                                                         <%=i%>  
                                                                    </td>
                                                                    <td>
                                                                         
                                                                            <%=rs1.getString("position_name")%>
                                                                        </td>
                                                                         <td>
                                                                         
                                                                            <%=rs1.getString("title")%>
                                                                        </td>
									<td>
                                                                            <%=rs1.getString("from_date")%>
                                                                        </td>
                                                                        <td>
                                                                             <%=rs1.getString("to_date")%>
                                                                        </td>
                                                                        <td>
                                                                           <%=rs1.getString("internship_regfee")%>  
                                                                        </td>
                                                                         <td>
                                                                           <%=rs1.getString("internship_amount")%>  
                                                                        </td>
                                                                         <td>
                                                                           <%=rs1.getString("openings")%>  
                                                                        </td>
                                                                          <td>
                                                                           <%=rs1.getString("internship_details")%>  
                                                                        </td>
									<td>
                                                                             <a href="InternshipRegister.jsp?did=<%=rs1.getString("internship_id")%>">
                                                                            <span class="badge bg-danger">Delete</span>
                                                                             </a>
                                                                        </td>
								</tr>
								
							</tbody>
                                                        
                                                                         <%
                                                                             }
                                                                          %>
						</table>
					</div>
				</div>
			</div>

		</div>

	</div>
</div>
          <jsp:include page="CompanyHomeFooter.jsp" />  
    </body>
</html>
