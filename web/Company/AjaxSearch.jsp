<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String comId = request.getParameter("cid");
    String comName = request.getParameter("cname");
    String comPhoto = request.getParameter("cphoto");

    String select = "select * from tbl_student where student_name like '"+request.getParameter("pid")+"%'";
    ResultSet res = con.selectCommand(select);
    while (res.next()) {
        String select2 = "select count(chat_id) as cid from tbl_chat where to_company_id='" + session.getAttribute("company_id") + "' and from_student_id='" + res.getString("student_id") + "' and chat_status='0' ";
        ResultSet res2 = con.selectCommand(select2);
        res2.next();
%>
<a href="CompanyChat.jsp?cid=<%=res.getString("student_id")%>&cname=<%=res.getString("student_name")%>&cphoto=<%=res.getString("student_photo")%>" class="list-group-item list-group-item-action border-0">
    <%
        if (Integer.parseInt(res2.getString("cid")) != 0) {

    %>    

    <div class="badge bg-success float-right"><%=res2.getString("cid")%></div>
    <%
        }
    %> 
    <div class="d-flex align-items-start">
        <img src="../Assets/StudentPhoto//<%=res.getString("student_photo")%>" class="rounded-circle mr-1" alt="Vanessa Tucker" width="40" height="40">
        <div class="flex-grow-1 ml-3">
            <strong style="color:#1366f2 !important;"><%=res.getString("student_name")%></strong>
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
