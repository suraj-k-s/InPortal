<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<option value="">---Select---</option>
 <%
                          String s="select *from tbl_place where district_id='"+request.getParameter("pid")+"'";
                          ResultSet rs = con.selectCommand(s);
            
                  
                    while(rs.next()){
                   
                  %> 
                     <option value="<%=rs.getString("place_id")%>">
                     <%=rs.getString("place_name")%>
                 </option>
                 <%
                 }
                 %>