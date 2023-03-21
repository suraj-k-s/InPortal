<%-- 
    Document   : ResumeAction
    Created on : Aug 27, 2022, 4:21:33 PM
    Author     : Georgekutty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%

            FileItem f_item = null;
            File savedFile = null;

            String field_name = "";
            String proof = "", photo = "";
            String file_name = "";

            String field[] = new String[55];
            String value[] = new String[55];

//checking if request cotains multipart data
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);//true/false

            if (isMultipart) {

                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                //declaring a list of form fields.everything on form adding t itemlist
                List items_list = null;

                //assigning fields to list 'items_list'
                try {
                    items_list = upload.parseRequest(request);//requeat contains evrything on form this is parsed and stored to item_list
                } catch (FileUploadException ex) {
                    out.println(ex);
                }

                //declaring iterator used to iterate through all positions in item_lists
                Iterator itr = items_list.iterator();
                int k = 0;
                //iterating through the list 'items_list'
                while (itr.hasNext())//checking if there is any value in the position like rs.next()
                {

                    //typecasting next element in items_list as fileitem
                    f_item = (FileItem) itr.next();// value to which the iterator points  and is coverted to fileitem format

                    //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc) or multipath
                    if (f_item.isFormField()) {

                        //getting fieldname and value
                        field[k] = f_item.getFieldName();//field
                        value[k] = f_item.getString();//user typing value

                        k++;//
                    } else//when it is an image or multipart
                    {

            //f_item=(FileItem)itr.next();
                        file_name = f_item.getName();
                        field_name = f_item.getFieldName();

                        if (field_name.equals("fileimage"))//write the name of image here it is img_product
                        {
                            String ext = file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
                            //setting path to store image
                            File proj_path = new File(config.getServletContext().getRealPath("/"));
                            String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\Web\\Assets\\Resume\\";//path for storing image
                            Random r = new Random();//to generate random number
                            int r_num = r.nextInt(1111) + 999;//values between this are generated

                            photo = "resume_photo_" + r_num + ext;//generating random number for images so this name and format of imagewil be stored inside the server
                            //creating a file object
                            savedFile = new File(file_path + photo);//fn contains name of file
                            try {
                                //writing the file object
                                f_item.write(savedFile);  //writing to server means the folder             

                            } catch (Exception ex) {
                                out.println(ex);
                            }
                        }
                     /*   if (field_name.equals("fileproof"))//write the name of image here it is img_product
                        {
                            String ext = file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
                            //setting path to store image
                            File proj_path = new File(config.getServletContext().getRealPath("/"));
                            String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\Web\\Assets\\Proof\\";//path for storing image
                            Random r = new Random();//to generate random number
                            int r_num = r.nextInt(1111) + 999;//values between this are generated

                            proof = "user_proof_" + r_num + ext;//generating random number for images so this name and format of imagewil be stored inside the server
                            //creating a file object
                            savedFile = new File(file_path + proof);//fn contains name of file
                            try {
                                //writing the file object
                                f_item.write(savedFile);  //writing to server means the folder             

                            } catch (Exception ex) {
                                out.println(ex);
                            }
                        }  */
                        
//                        if (field_name.equals("txtproof"))//write the name of image here it is img_product
//                        {
//                            String ext = file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
//                            //setting path to store image
//                            File proj_path = new File(config.getServletContext().getRealPath("/"));
//                            String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\Web\\Assets\\User_proof\\";//path for storing image
//                            Random r = new Random();//to generate random number
//                            int r_num = r.nextInt(1111) + 999;//values between this are generated
//
//                            proof = "proof_" + r_num + ext;//generating random number for images so this name and format of imagewil be stored inside the server
//                            //creating a file object
//                            savedFile = new File(file_path + proof);//fn contains name of file
//                            try {
//                                //writing the file object
//                                f_item.write(savedFile);  //writing to server means the folder             
//
//                            } catch (Exception ex) {
//                                out.println(ex);
//                            }
//                        }

           //to upload proof of doctor
                    }

                }
                //if(value[6].equals(value[7]))
                //{//Strinh str1="insert into tbl_user ()";//inserting file
             String InsQry = "insert into tbl_resume(student_id,image,name,title,email,contact,website,linkedin,github,twitter,objective,graduation,graduation_college,graduation_university,graduation_year,post_graduation,post_graduation_college,post_graduation_university,post_graduation_year,language1,language2,language3,language4,interest1,interest2,interest3,interest4,project_title,project_des,project2_title,project2_des,internship_title,internship_company,internship_year,internship_des,internship2_title,internship2_company,internship2_year,internship2_des,certification1,certification2,certification3,skill1,p1,skill2,p2,skill3,p3,skill4,p4,skill5,p5)values('"+session.getAttribute("student_id")+"','"+photo+"','"+value[0]+"','"+value[1]+"','"+value[2]+"','"+value[3]+"','"+value[4]+"','"+value[5]+"','"+value[6]+"','"+value[7]+"','"+value[8]+"','"+value[9]+"','"+value[10]+"','"+value[11]+"','"+value[12]+"','"+value[13]+"','"+value[14]+"','"+value[15]+"','"+value[16]+"','"+value[17]+"','"+value[18]+"','"+value[19]+"','"+value[20]+"','"+value[21]+"','"+value[22]+"','"+value[23]+"','"+value[24]+"','"+value[25]+"','"+value[26]+"','"+value[27]+"','"+value[28]+"','"+value[29]+"','"+value[30]+"','"+value[31]+"','"+value[32]+"','"+value[33]+"','"+value[34]+"','"+value[35]+"','"+value[36]+"','"+value[37]+"','"+value[38]+"','"+value[39]+"','"+value[40]+"','"+value[41]+"','"+value[42]+"','"+value[43]+"','"+value[44]+"','"+value[45]+"','"+value[46]+"','"+value[47]+"','"+value[48]+"','"+value[49]+"')";
           // String InsQry="insert into tbl_resume(student_id,image,name,title,email,contact,website,linkedin,github,twitter,objective,graduation,graduation_college,graduation_university,graduation_year,post_graduation,post_graduation_college,post_graduation_university,post_graduation_year,language1,language2) values('"+session.getAttribute("student_id")+"','"+photo+"','"+value[0]+"','"+value[1]+"','"+value[2]+"','"+value[3]+"','"+value[4]+"','"+value[5]+"','"+value[6]+"','"+value[7]+"','"+value[8]+"','"+value[9]+"','"+value[10]+"','"+value[11]+"','"+value[12]+"','"+value[13]+"','"+value[14]+"','"+value[15]+"','"+value[16]+"','"+value[17]+"','"+value[18]+"')";
  // System.out.println(InsQry);
            //   out.println(InsQry);
                boolean status = con.executeCommand(InsQry);

                if (status == true) {
                String select="select * from tbl_resume r inner join tbl_student s on r.student_id=s.student_id order by resume_id desc limit 1";
                ResultSet res =con.selectCommand(select);
                res.next();
                session.setAttribute("resume_id", res.getString("resume_id"));
        %> 
       <script type="text/javascript">
           // alert("Upload Successfully..");
            setTimeout(function() {
                window.location.href = '../../Student/Resume.jsp?id=<%=res.getString("resume_id")%>';
            }, 40);//40millisecend it go to next page
        </script>  
        <%
                }
            //}
              //  else
                //{
                    %>
                    <script type="text/javascript">
            //alert("Pssword Mismtch..");
            //setTimeout(function() {
              //  window.location.href = '../../Designer/Design.jsp'
            //}, 40);//40millisecend it go to next page
        </script>
                    <%
                //}
            }

        %>
       
    </body>
</html>
