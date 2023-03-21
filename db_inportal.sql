# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_inportal
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2023-03-21 10:39:41
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_inportal'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_inportal" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_inportal";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(11) NOT NULL auto_increment,
  "admin_name" varchar(50) NOT NULL,
  "admin_email" varchar(50) NOT NULL,
  "admin_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	(1,'Admin','admin@gmail.com','admin12');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_chat'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_chat" (
  "chat_id" int(11) NOT NULL auto_increment,
  "from_student_id" int(50) default '0',
  "to_student_id" int(10) unsigned default '0',
  "to_company_id" int(10) unsigned default '0',
  "from_company_id" int(10) unsigned default '0',
  "chat_content" varchar(500) NOT NULL,
  "chat_time" varchar(50) NOT NULL,
  "chat_date" varchar(50) NOT NULL,
  "chat_status" int(11) default '0',
  PRIMARY KEY  ("chat_id")
);



#
# Dumping data for table 'tbl_chat'
#

# No data found.



#
# Table structure for table 'tbl_company'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_company" (
  "company_id" int(11) NOT NULL auto_increment,
  "company_name" varchar(50) NOT NULL,
  "company_email" varchar(50) NOT NULL,
  "company_contact" varchar(20) NOT NULL,
  "company_address" varchar(250) NOT NULL,
  "company_logo" varchar(50) default NULL,
  "company_proof" varchar(50) default NULL,
  "company_liscenceno" varchar(50) NOT NULL,
  "place_id" int(50) default NULL,
  "company_location" varchar(50) NOT NULL,
  "company_landmark1" varchar(50) NOT NULL,
  "company_landmark2" varchar(50) default NULL,
  "company_password" varchar(50) NOT NULL,
  "company_vstatus" varchar(50) default '0',
  "company_doj" date NOT NULL,
  "sector_id" int(11) default NULL,
  "company_site" varchar(50) default NULL,
  "company_about" varchar(1000) default NULL,
  "company_date" date default NULL,
  "isactive" int(11) default '0',
  PRIMARY KEY  ("company_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_company'
#

LOCK TABLES "tbl_company" WRITE;
/*!40000 ALTER TABLE "tbl_company" DISABLE KEYS;*/
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_email", "company_contact", "company_address", "company_logo", "company_proof", "company_liscenceno", "place_id", "company_location", "company_landmark1", "company_landmark2", "company_password", "company_vstatus", "company_doj", "sector_id", "company_site", "company_about", "company_date", "isactive") VALUES
	(1,'Psst','basimahaneefa1@gmail.com','9786543211','mvpz','company_logo_1917.png','company_proof_1159.png','1234567890123',1,'near po','2nd floor koyas ','mvpz','psst123','1','2023-02-15',1,'cfdgdbdb','Project center','2023-02-01',1);
/*!40000 ALTER TABLE "tbl_company" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_course'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_course" (
  "course_id" int(11) NOT NULL auto_increment,
  "coursetype_id" int(11) default NULL,
  "course_name" varchar(50) NOT NULL,
  "course_duration" varchar(50) NOT NULL,
  "company_id" int(11) default NULL,
  PRIMARY KEY  ("course_id")
);



#
# Dumping data for table 'tbl_course'
#

# No data found.



#
# Table structure for table 'tbl_coursetype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_coursetype" (
  "coursetype_id" int(11) NOT NULL auto_increment,
  "coursetype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("coursetype_id")
);



#
# Dumping data for table 'tbl_coursetype'
#

# No data found.



#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(11) NOT NULL auto_increment,
  "district_name" varchar(50) NOT NULL,
  "state_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	(1,'ekm','1');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(11) NOT NULL auto_increment,
  "feedback_content" varchar(500) NOT NULL,
  "student_id" int(11) default '0',
  "company_id" int(11) NOT NULL default '0',
  PRIMARY KEY  ("feedback_id")
);



#
# Dumping data for table 'tbl_feedback'
#

# No data found.



#
# Table structure for table 'tbl_intership'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_intership" (
  "internship_id" int(11) NOT NULL auto_increment,
  "position_id" int(11) default NULL,
  "title" varchar(50) default NULL,
  "company_id" int(11) NOT NULL,
  "from_date" date NOT NULL,
  "to_date" date NOT NULL,
  "internship_regfee" varchar(50) NOT NULL,
  "internship_amount" varchar(50) NOT NULL,
  "openings" varchar(50) default NULL,
  "internship_details" varchar(500) NOT NULL,
  PRIMARY KEY  ("internship_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_intership'
#

LOCK TABLES "tbl_intership" WRITE;
/*!40000 ALTER TABLE "tbl_intership" DISABLE KEYS;*/
REPLACE INTO "tbl_intership" ("internship_id", "position_id", "title", "company_id", "from_date", "to_date", "internship_regfee", "internship_amount", "openings", "internship_details") VALUES
	(1,1,'sw',1,'2023-02-23','2023-03-30','100','500','4','                                                                                
             sw intern                                                               ');
/*!40000 ALTER TABLE "tbl_intership" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(11) NOT NULL auto_increment,
  "place_name" varchar(50) NOT NULL,
  "district_id" int(11) default NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(1,'mvpz',1);
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_position'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_position" (
  "position_id" int(50) NOT NULL auto_increment,
  "position_name" varchar(50) default NULL,
  "sector_id" int(11) NOT NULL,
  PRIMARY KEY  ("position_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_position'
#

LOCK TABLES "tbl_position" WRITE;
/*!40000 ALTER TABLE "tbl_position" DISABLE KEYS;*/
REPLACE INTO "tbl_position" ("position_id", "position_name", "sector_id") VALUES
	(1,'sw developer',1);
/*!40000 ALTER TABLE "tbl_position" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_request'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_request" (
  "request_id" int(11) NOT NULL auto_increment,
  "internship_id" int(11) default NULL,
  "student_id" int(11) default NULL,
  "request_date" date NOT NULL,
  "request_status" varchar(50) default '0',
  "request_reply" varchar(50) default '0',
  "request_replydate" varchar(50) default '0',
  "request_active" int(11) default '0',
  "payment_status" int(11) default '0',
  PRIMARY KEY  ("request_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_request'
#

LOCK TABLES "tbl_request" WRITE;
/*!40000 ALTER TABLE "tbl_request" DISABLE KEYS;*/
REPLACE INTO "tbl_request" ("request_id", "internship_id", "student_id", "request_date", "request_status", "request_reply", "request_replydate", "request_active", "payment_status") VALUES
	(1,1,1,'2023-02-15','1','Verified','0',0,1);
/*!40000 ALTER TABLE "tbl_request" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_resume'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_resume" (
  "resume_id" int(11) NOT NULL auto_increment,
  "student_id" int(11) default '0',
  "image" varchar(50) default '0',
  "name" varchar(50) default '0',
  "title" varchar(50) default '0',
  "email" varchar(50) default '0',
  "contact" varchar(50) default '0',
  "website" varchar(50) default '0',
  "linkedin" varchar(100) default '0',
  "github" varchar(100) default '0',
  "twitter" varchar(100) default '0',
  "objective" varchar(750) default '0',
  "graduation" varchar(50) default '0',
  "graduation_college" varchar(75) default '0',
  "graduation_university" varchar(50) default '0',
  "graduation_year" varchar(50) default '0',
  "post_graduation" varchar(50) default '0',
  "post_graduation_college" varchar(75) default '0',
  "post_graduation_university" varchar(75) default '0',
  "post_graduation_year" varchar(50) default '0',
  "language1" varchar(50) default '0',
  "language2" varchar(50) default '0',
  "language3" varchar(50) default '0',
  "language4" varchar(50) default '0',
  "interest1" varchar(50) default '0',
  "interest2" varchar(50) NOT NULL default '0',
  "interest3" varchar(50) NOT NULL default '0',
  "interest4" varchar(50) NOT NULL default '0',
  "project_title" varchar(50) NOT NULL default '0',
  "project_des" varchar(50) NOT NULL default '0',
  "project2_title" varchar(50) NOT NULL default '0',
  "project2_des" varchar(1000) default NULL,
  "internship_title" varchar(50) NOT NULL default '0',
  "internship_company" varchar(50) NOT NULL default '0',
  "internship_year" varchar(50) NOT NULL default '0',
  "internship_des" varchar(50) NOT NULL default '0',
  "internship2_title" varchar(50) NOT NULL default '0',
  "internship2_company" varchar(50) NOT NULL default '0',
  "internship2_year" varchar(50) NOT NULL default '0',
  "internship2_des" varchar(50) NOT NULL default '0',
  "certification1" varchar(50) NOT NULL default '0',
  "certification2" varchar(50) NOT NULL default '0',
  "certification3" varchar(50) NOT NULL default '0',
  "skill1" varchar(50) NOT NULL default '0',
  "p1" varchar(50) NOT NULL default '0',
  "skill2" varchar(50) NOT NULL default '0',
  "p2" varchar(50) NOT NULL default '0',
  "skill3" varchar(50) NOT NULL default '0',
  "p3" varchar(50) NOT NULL default '0',
  "skill4" varchar(50) NOT NULL default '0',
  "p4" varchar(50) NOT NULL default '0',
  "skill5" varchar(50) NOT NULL default '0',
  "p5" varchar(50) NOT NULL default '0',
  PRIMARY KEY  ("resume_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_resume'
#

LOCK TABLES "tbl_resume" WRITE;
/*!40000 ALTER TABLE "tbl_resume" DISABLE KEYS;*/
REPLACE INTO "tbl_resume" ("resume_id", "student_id", "image", "name", "title", "email", "contact", "website", "linkedin", "github", "twitter", "objective", "graduation", "graduation_college", "graduation_university", "graduation_year", "post_graduation", "post_graduation_college", "post_graduation_university", "post_graduation_year", "language1", "language2", "language3", "language4", "interest1", "interest2", "interest3", "interest4", "project_title", "project_des", "project2_title", "project2_des", "internship_title", "internship_company", "internship_year", "internship_des", "internship2_title", "internship2_company", "internship2_year", "internship2_des", "certification1", "certification2", "certification3", "skill1", "p1", "skill2", "p2", "skill3", "p3", "skill4", "p4", "skill5", "p5") VALUES
	(1,1,'resume_photo_1673.png','Basima PH','Junior Software developer','basimahaneefa893@gmail.com','9848937832','Naukri.com','ghgwgdwg','hjdhfjhdejf','jegfuegfje','hello good morning','BCA','St joseph','mg','2019-2022','','','','','Jsp','PHP','Html','C','Travelling','Music','','','Agro Market','jsp','','','','','','','','','','','Python','','','Coding','85%','communication','70%','','','','','','50');
REPLACE INTO "tbl_resume" ("resume_id", "student_id", "image", "name", "title", "email", "contact", "website", "linkedin", "github", "twitter", "objective", "graduation", "graduation_college", "graduation_university", "graduation_year", "post_graduation", "post_graduation_college", "post_graduation_university", "post_graduation_year", "language1", "language2", "language3", "language4", "interest1", "interest2", "interest3", "interest4", "project_title", "project_des", "project2_title", "project2_des", "internship_title", "internship_company", "internship_year", "internship_des", "internship2_title", "internship2_company", "internship2_year", "internship2_des", "certification1", "certification2", "certification3", "skill1", "p1", "skill2", "p2", "skill3", "p3", "skill4", "p4", "skill5", "p5") VALUES
	(2,1,'resume_photo_1809.png','Basima PH','juihu','basimahaneefa893@gmail.com','9748284628','Naukri.com','ghgwgdwg','hjdhfjhdejf','jegfuegfje','asdfghjkl','BCA','St joseph','mg','2019-2022','','','','','Jsp','PHP','Html','C','Travelling','Music','','','Agro Market','erdtfyghuj','','','','','','','','','','','hyugu','','','Coding','85%','communication','70%','','','','','','63');
/*!40000 ALTER TABLE "tbl_resume" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_review'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_review" (
  "review_id" int(10) NOT NULL auto_increment,
  "review_datetime" datetime default NULL,
  "user_name" varchar(500) default '0',
  "user_rating" int(10) unsigned default NULL,
  "user_review" varchar(150) default NULL,
  "internship_id" int(10) default NULL,
  PRIMARY KEY  ("review_id"),
  UNIQUE KEY "review_id" ("review_id")
);



#
# Dumping data for table 'tbl_review'
#

# No data found.



#
# Table structure for table 'tbl_sector'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_sector" (
  "sector_id" int(11) NOT NULL auto_increment,
  "sector_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("sector_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_sector'
#

LOCK TABLES "tbl_sector" WRITE;
/*!40000 ALTER TABLE "tbl_sector" DISABLE KEYS;*/
REPLACE INTO "tbl_sector" ("sector_id", "sector_name") VALUES
	(1,'it');
/*!40000 ALTER TABLE "tbl_sector" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_state'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_state" (
  "state_id" int(11) NOT NULL auto_increment,
  "state_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("state_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_state'
#

LOCK TABLES "tbl_state" WRITE;
/*!40000 ALTER TABLE "tbl_state" DISABLE KEYS;*/
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	(1,'Kerala');
/*!40000 ALTER TABLE "tbl_state" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_student'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_student" (
  "student_id" int(11) NOT NULL auto_increment,
  "student_name" varchar(50) NOT NULL,
  "student_address" varchar(200) NOT NULL,
  "student_contact" varchar(50) NOT NULL,
  "student_email" varchar(50) NOT NULL,
  "student_gender" varchar(50) NOT NULL,
  "place_id" int(11) default NULL,
  "student_location" varchar(50) NOT NULL,
  "student_password" varchar(50) NOT NULL,
  "student_photo" varchar(100) NOT NULL,
  "student_proof" varchar(100) default NULL,
  "student_doj" date NOT NULL,
  "student_status" int(11) default '0',
  "isactive" int(11) default '0',
  PRIMARY KEY  ("student_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_student'
#

LOCK TABLES "tbl_student" WRITE;
/*!40000 ALTER TABLE "tbl_student" DISABLE KEYS;*/
REPLACE INTO "tbl_student" ("student_id", "student_name", "student_address", "student_contact", "student_email", "student_gender", "place_id", "student_location", "student_password", "student_photo", "student_proof", "student_doj", "student_status", "isactive") VALUES
	(1,'Basima PH','Pendanath
Kanjar','8281467390','basimahaneefa893@gmail.com','Female',1,'near po','1234','student_photo_1719.png','student_proof_1914.png','2023-02-20',0,1);
/*!40000 ALTER TABLE "tbl_student" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_syllabus'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_syllabus" (
  "syllabus_id" int(11) NOT NULL auto_increment,
  "internship_id" int(11) default NULL,
  "syllabus_material" varchar(100) NOT NULL,
  "syllabus_tumbnail" varchar(50) default NULL,
  PRIMARY KEY  ("syllabus_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_syllabus'
#

LOCK TABLES "tbl_syllabus" WRITE;
/*!40000 ALTER TABLE "tbl_syllabus" DISABLE KEYS;*/
REPLACE INTO "tbl_syllabus" ("syllabus_id", "internship_id", "syllabus_material", "syllabus_tumbnail") VALUES
	(1,1,'syllabus_pdf_1900.png','syllabus_pdf_Tumb1484.png');
/*!40000 ALTER TABLE "tbl_syllabus" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
