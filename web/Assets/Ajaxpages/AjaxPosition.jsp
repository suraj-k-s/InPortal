<%-- 
    Document   : AjaxPosition
    Created on : Aug 23, 2022, 3:03:36 PM
    Author     : Georgekutty
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<option value="">---Select---</option>
 <%
                          String s="select *from tbl_position where sector_id='"+request.getParameter("sid")+"'";
                          ResultSet rs = con.selectCommand(s);
            
                  
                    while(rs.next()){
                   
                  %> 
                     <option value="<%=rs.getString("position_id")%>">
                     <%=rs.getString("position_name")%>
                 </option>
                 <%
                 }
                 %>