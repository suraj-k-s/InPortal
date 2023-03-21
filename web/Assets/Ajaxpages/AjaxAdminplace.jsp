<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
 <%
                          String s="select *from tbl_district where state_id='"+request.getParameter("did")+"'";
                          ResultSet rs = con.selectCommand(s);
            
                     %>
                  <%
                    while(rs.next()){
                   
                  %> 
                     <option value="<%=rs.getString("district_id")%>">
                     <%=rs.getString("district_name")%>
                 </option>
                 <%
                 }
                 %>