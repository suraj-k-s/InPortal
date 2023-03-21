
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
   
    <%
        String selQry = "select * from tbl_chat c inner join tbl_student s on (c.to_student_id=s.student_id) or (c.from_student_id=s.student_id) inner join tbl_company com on (c.to_company_id=com.company_id) or (c.from_company_id=com.company_id)  where com.company_id='" + session.getAttribute("company_id") + "' and s.student_id='" + request.getParameter("cid") + "' order by chat_id";
        System.out.println(selQry);
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            if (rs.getString("from_company_id").equals(session.getAttribute("company_id"))) {
    %>
    <div class="chat-message-right pb-4">
        <div>
            <img src="../Assets/CompanyLogo/<%=rs.getString("company_logo")%>" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
            <div class="text-muted small text-nowrap mt-2"><%=rs.getString("chat_time")%></div>
        </div>
        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
            <div class="font-weight-bold mb-1">You</div>
            <%=rs.getString("chat_content")%>
        </div>
    </div>
    <%} else if (rs.getString("to_company_id").equals(session.getAttribute("company_id"))) {

    %>
    <div class="chat-message-left pb-4">
        <div>
            <img src="../Assets/StudentPhoto/<%=rs.getString("student_photo")%>" class="rounded-circle mr-1" alt="<%=rs.getString("student_name")%>" width="40" height="40">
            <div class="text-muted small text-nowrap mt-2"><%=rs.getString("chat_time")%></div>
        </div>
        <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3" style="background-color: #1366f2 !important;color:#fff !important;">
            <div class="font-weight-bold mb-1"><%=rs.getString("student_name")%></div>
            <%=rs.getString("chat_content")%>
        </div>
    </div>
    <%

            }
        }
    %>