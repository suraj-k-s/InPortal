<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String insQry="insert into tbl_chat(from_student_id,to_company_id,chat_content,chat_date,chat_time)"
            + " values('"+session.getAttribute("student_id") +"','"+request.getParameter("cid") +"','"+request.getParameter("chat") +"',curdate(),TIME_FORMAT(curtime(), '%h:%i %p'))";
    if(con.executeCommand(insQry))
    {
        out.println("sended");
    }
    else
    {
        out.println("failed");
        out.println(insQry);
    }
    
%>