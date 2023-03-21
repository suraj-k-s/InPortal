<%-- 
    Document   : ResumeBuilder
    Created on : Aug 25, 2022, 10:15:27 AM
    Author     : Georgekutty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InPortal::Resume Builder</title>
        <style>
            @media print {
	.noprint {
		visibility: hidden;
		margin: 0px;
		padding: 0px;
		height: 0px;
	}
}
* {
	box-sizing: border-box;
}
html,
body {
	margin: 0px;
}
body {
	min-width: 320px;
	background: hsla(0, 0%, 98%, 1);
}
section {
	//position: relative;
	margin: 0px auto;
	width: auto;
}
.page-break {
	position: absolute;
	top: 1078px;
	width: 100%;
	height: 0px;
	border-bottom: 1px dotted black;
	display: none;
}
article {
	margin: 0px auto 10px auto;
	padding: 36px;
	width: 100%;
	background: white;
}
table.psnl-info {
	padding: 10px;
	width: 100%;
}
table.psnl-info td {
	width: 33.33%;
	word-break: break-all;
}
/*  author: Jenny HOU */
/* original codepen project: https://codepen.io/c53hzn/pen/PgayKq */
.rsm-header {
	margin: 0px 10px;
}
.rsm-header h2 {
	margin: 0px;
}
.rsm-header hr {
	margin: 0px 0px 10px 0px;
	border: 1px solid black;
}
.rsm-cmpnt {
	padding: 0px 10px 10px 10px;
}
.rsm-cmpnt p {
	margin: 0px;
}
/*  author: Jenny HOU */
/* original codepen project: https://codepen.io/c53hzn/pen/PgayKq */
.rsm-cmpnt-top {
	margin: 0px auto 6px auto;
	display: flex;
}
.rsm-cmpnt-top div {
	flex: 1;
	font-weight: bold;
}
.text-left {
	text-align: left;
}
.text-center {
	text-align: center;
}
.text-right {
	text-align: right;
}
.font-10 {
	font-size: 10px;
}
.font-20 {
	font-size: 20px;
}
/*  author: Jenny HOU */
/* original codepen project: https://codepen.io/c53hzn/pen/PgayKq */
.rsm-cmpnt-mid {
	margin: 0px auto 6px auto;
	font-size: 14px;
	font-style: italic;
}
.rsm-cmpnt-btm ul {
	margin: 0px auto 6px auto;
	padding-left: 25px;
	list-style: circle;
}
.rsm-cmpnt-btm li {
	font-size: 14px;
}
#addDropBtn {
	position: fixed;	
	font-size: 18px;
	height: 20px;
	user-select: none;
	cursor: pointer;
	display: none;
}
#dropBtn,#addBtn {
	color: black;
	width: 20px;
	height: 20px;
	line-height: 16px;
	border: 1px solid black;
	display: inline-block;
}
/*  author: Jenny HOU */
/* original codepen project: https://codepen.io/c53hzn/pen/PgayKq */
.cmpnt-btn {
	background: #d8d8d8;
}
.cmpnt-p-btn {
	background: #eaeaea;
}
.cmpnt-li-btn {
	background: white;
}

@media (min-width: 768px) {
	section {
		margin: 50px auto;
		width: 792px;
	}
	.page-break {
		display: block;
	}
}

        </style>
    </head>
    <body>
      
     <jsp:include page="StudentHomeHeader.jsp" />   
  


<section style="border-radius: 4px; box-shadow: gray 1px 1px 3px 2px; overflow: hidden;" title="This is a sample resume. Click to edit. Use Tab key to go to next input box. You can add/remove any element you like. Press CTRL+P to save as PDF!">
<!-- 	<div class="page-break"></div> -->
	<article>
		<table class="psnl-info">
			<tbody>
				<tr>
					<td rowspan="2" class="text-left" contenteditable>Tel: (917)285-7362</td>
					<td class="text-center font-20" contenteditable>Harold Finch</td>
					<td rowspan="2" class="text-right" contenteditable>email: haroldbird233@gmail.com</td>
				</tr>
				<tr>
					<td class="text-center font-20" contenteditable>"Harry"</td>
				</tr>
				<tr>
					<td></td>
					<td class="text-center font-18" contenteditable>(from <em>Person of Interest</em>)</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<div class="rsm-header">
			<h2 contenteditable>Work Experience</h2>
			<hr>
		</div>
		<div class="rsm-cmpnt">
			<div class="rsm-cmpnt-top">
				<div class="text-left">
					<div contenteditable>N/A</div>
					<div contenteditable>Billionaire</div>
				</div>
				<div class="text-right font-10">
					<div contenteditable>??? - 2016</div>
					<div contenteditable>New York</div>
				</div>
			</div>
			<div class="rsm-cmpnt-mid" contenteditable>
				His source of wealth is unknown yet reliable.
			</div>
			<div class="rsm-cmpnt-btm">
				<p contenteditable>Develop an all-seeing AI:</p>
				<ul>
					<li contenteditable>Taught the Machine to save everyone</li>
					<li contenteditable>Taught the Machine how to play chess</li>
				</ul>
				<p contenteditable>Save the irrelevant numbers:</p>
				<ul>
					<li contenteditable>Identify the irrelevant number as victim or perpetrator</li>
					<li contenteditable>Saved everyone</li>
					<li contenteditable>Failed to save himself</li>
				</ul>
			</div>
		</div>
		<div class="rsm-cmpnt">
			<div class="rsm-cmpnt-top">
				<div class="text-left">
					<div contenteditable>Universal Heritage Insurance</div>
					<div contenteditable>Insurance Underwriter</div>
				</div>
				<div class="text-right font-10">
					<div contenteditable>??? - 2016</div>
					<div contenteditable>New York</div>
				</div>
			</div>
			<div class="rsm-cmpnt-mid" contenteditable>
				An insurance company.
			</div>
			<div class="rsm-cmpnt-btm">
				<p contenteditable>Work as an investigator:</p>
				<ul>
					<li contenteditable>Approach families of the numbers and collect relevant information, sometimes provide anonymous financial aid</li>
				</ul>
				<p contenteditable>Save the irrelevant numbers:</p>
				<ul>
					<li contenteditable>Identify the irrelevant number as victim or perpetrator</li>
				</ul>
			</div>
		</div>
		<div class="rsm-cmpnt">
			<div class="rsm-cmpnt-top">
				<div class="text-left">
					<div contenteditable>IFT, Inc.</div>
					<div contenteditable>Software Engineer</div>
				</div>
				<div class="text-right font-10">
					<div contenteditable>1983 - 2011</div>
					<div contenteditable>New York</div>
				</div>
			</div>
			<div class="rsm-cmpnt-mid" contenteditable>
				This company receives a reputation as a world leader in computer technology.
			</div>
			<div class="rsm-cmpnt-btm">
				<p contenteditable>Work as a low-level employee:</p>
				<ul>
					<li contenteditable>Pretend to be inefficient in coding</li>
					<li contenteditable>Constantly disappearing from work</li>
				</ul>
				<p contenteditable>Secretly being a high level executive:</p>
				<ul>
					<li contenteditable>Hired someone secretly(219)</li>
					<li contenteditable>Fired himself secretly(102)</li>
				</ul>
			</div>
		</div>
		
		<div class="rsm-header">
			<h2 contenteditable>Education</h2>
			<hr>
		</div>
		<div class="rsm-cmpnt">
			<div class="rsm-cmpnt-top">
				<div class="text-left">
					<div contenteditable>Massachusetts Institute of Technology</div>
					<div contenteditable>Engineering</div>
				</div>
				<div class="text-right font-10">
					<div contenteditable>1980 - 1983</div>
					<div contenteditable>Cambridge, MA</div>
				</div>
			</div>
			<div class="rsm-cmpnt-btm">
				<p contenteditable>Education highlights:</p>
				<ul>
					<li contenteditable>Dropout</li>
				</ul>
			</div>
		</div>
		<div class="rsm-header">
			<h2 contenteditable>Professional Skills</h2>
			<hr>
		</div>
		<div class="rsm-cmpnt">
			<div class="rsm-cmpnt-top">
				<div class="text-left">
					<div contenteditable>Hacking skills</div>
				</div>
			</div>
			<div class="rsm-cmpnt-btm">
				<p contenteditable>C language, etc</p>
				<ul>
					<li contenteditable>Instructed a student on building a large program once in an undercover mission when he pretended to be a math teacher</li>
				</ul>
			</div>
		</div>
		<div class="rsm-cmpnt">
			<div class="rsm-cmpnt-top">
				<div class="text-left">
					<div contenteditable>Financial knowledge</div>
				</div>
			</div>
			<div class="rsm-cmpnt-btm">
				<p contenteditable>Expert in stock market manipulation</p>
				<ul>
					<li contenteditable>Short sold a medical company's stocks</li>
					<li contenteditable>Prevented a financial crisis in a stock exchange</li>
				</ul>
			</div>
		</div>
		<div class="rsm-cmpnt">
			<div class="rsm-cmpnt-top">
				<div class="text-left">
					<div contenteditable>People skills</div>
				</div>
			</div>
			<div class="rsm-cmpnt-btm">
				<p contenteditable>Compassion and selfless love</p>
				<ul>
					<li contenteditable>"Human-interaction" is said to not be his best strength, however Finch has demonstrated his kindness and caring for all man-kind, including those posing against him</li>
				</ul>
			</div>
		</div>
	</article>
</section>

         <jsp:include page="StudentHomeFooter.jsp" />    
    </body>
    <script>
    var addDropBtn = "<div id=\"addDropBtn\"><div id=\"dropBtn\">－</div>&nbsp;<div id=\"addBtn\">＋</div></div>";
$("body").append(addDropBtn);
var isCtrlDown = false;
$("body").on("keydown", function(e) {
	if (e.keyCode == 17) {
		isCtrlDown = true;
	} else if (e.keyCode == 80 && isCtrlDown) {
		//adjust printing styles
		$("section").css("margin", 0);
		$("body").css("background", "white");
		$("#addDropBtn").hide();
		$(".page-break").hide();
		$("article").css("padding", 0);
		$(":focus").blur();
		window.print();
		//adjust back to preview styles
		$("section").css("margin", "50px auto");
		$("body").css("background", "black");
		$(".page-break").show();
		$("article").css("padding", 36);
		return false;
	}
});
$("body").on("keyup", function(e) {
	if (e.keyCode == 17) {
		isCtrlDown = false;
	}
});
$("body").on("keydown", "[contenteditable]", function(e) {
	if (e.keyCode == 13) {
		e.preventDefault();//prevent line break
		$(this).blur();
	}
});
// author: Jenny HOU
// original codepen project: https://codepen.io/c53hzn/pen/PgayKq
/* contenteditable元素内粘贴纯文本 */
// http://www.debug8.com/javascript/t_9884.html
$("body").on("paste", "[contenteditable]", function (event){
	var e = event || window.event;
	// 阻止默认粘贴
	e.preventDefault();
	// 粘贴事件有一个clipboardData的属性，提供了对剪贴板的访问
	// clipboardData的getData(fomat) 从剪贴板获取指定格式的数据
	var text =  (e.originalEvent || e).clipboardData.getData('text/plain') || prompt('在这里输入文本');
	// 插入
	document.execCommand("insertText", false, text || "");//paste as plain text
});
/* contenteditable元素内粘贴纯文本 */

// object to store add_drop element
var ele_to_be_addDroped = {
	cmpnt_index: 0,
	cmpnt_p_index: 0,
	cmpnt_li_index: 0,
	ele: ""
};
function addDropBtn_right(a) {// the distance between addDropBtn and right window edge
	return ($(window).width() - ($(a).offset().left + $(a).outerWidth()));;
}
// author: Jenny HOU
// original codepen project: https://codepen.io/c53hzn/pen/PgayKq
$("body").on("mouseenter", ".rsm-cmpnt", function() {
	var that = this;
	ele_to_be_addDroped.cmpnt_index = $(".rsm-cmpnt").index(this);//overall index, not by category
	ele_to_be_addDroped.ele = this;
	$("#addDropBtn").css("top", $(that).offset().top - $(window).scrollTop() - 2);
	$("#addDropBtn").css("right", addDropBtn_right(that) + 4);
	$("#addBtn").attr("class", "cmpnt-btn");
	$("#dropBtn").attr("class", "cmpnt-btn");
	if (!$(this).prev().hasClass("rsm-header")) {//if component is the first in its category
		$("#dropBtn").show();//only drop btn will be applicable
	} else {
		$("#dropBtn").hide();
	}
	$("#addDropBtn").show();
});

// author: Jenny HOU
// original codepen project: https://codepen.io/c53hzn/pen/PgayKq
$("body").on("mouseleave", ".rsm-cmpnt", function() {
	$("#addDropBtn").hide();
});
$("body").on("mouseenter", ".rsm-cmpnt-btm p", function() {
	var that = this;
	ele_to_be_addDroped.cmpnt_index = $(".rsm-cmpnt").index($(that).parent().parent());
	ele_to_be_addDroped.cmpnt_p_index = $(this).index();
	ele_to_be_addDroped.ele = this;
	$("#addDropBtn").css("top", $(that).offset().top - $(window).scrollTop() - 3);
	$("#addDropBtn").css("right", addDropBtn_right(that) + 2);
	$("#addBtn").attr("class", "cmpnt-p-btn");
	$("#dropBtn").attr("class", "cmpnt-p-btn");
	if ($(this).index()) {
		$("#dropBtn").show();
	} else {
		$("#dropBtn").hide();
	}
	$("#addDropBtn").show();
});
$("body").on("mouseleave", ".rsm-cmpnt-btm p", function() {
	$("#addDropBtn").hide();
});
// author: Jenny HOU
// original codepen project: https://codepen.io/c53hzn/pen/PgayKq
$("body").on("mouseenter", ".rsm-cmpnt-btm li", function() {
	var that = this;
	ele_to_be_addDroped.cmpnt_index = $(".rsm-cmpnt").index($(that).parent().parent().parent());
	ele_to_be_addDroped.cmpnt_p_index = $(this).parent().prev().index();
	ele_to_be_addDroped.cmpnt_li_index = $(this).index();
	ele_to_be_addDroped.ele = this;
	$("#addDropBtn").css("top", $(that).offset().top - $(window).scrollTop() - 3);
	$("#addDropBtn").css("right", addDropBtn_right(that) + 2);
	$("#addBtn").attr("class", "cmpnt-li-btn");
	$("#dropBtn").attr("class", "cmpnt-li-btn");
	if ($(this).index()) {
		$("#dropBtn").show();
	} else {
		$("#dropBtn").hide();
	}
	$("#addDropBtn").show();
});
$("body").on("mouseleave", ".rsm-cmpnt-btm li", function() {
	$("#addDropBtn").hide();
});
$("body").on("mouseover", "#addDropBtn", function() {
	$("#addDropBtn").show();
});
$("body").on("mouseleave", "#addDropBtn", function() {
	$("#addDropBtn").hide();
});
// author: Jenny HOU
// original codepen project: https://codepen.io/c53hzn/pen/PgayKq
$("body").on("click", "#dropBtn", function() {
	var targetEle;
	if (ele_to_be_addDroped.ele.tagName == "DIV") {
		targetEle = $(".rsm-cmpnt").eq(ele_to_be_addDroped.cmpnt_index);
	} else if (ele_to_be_addDroped.ele.tagName == "P") {
		let div = $(".rsm-cmpnt").eq(ele_to_be_addDroped.cmpnt_index);
		targetEle = $(div).children(".rsm-cmpnt-btm").children().eq(ele_to_be_addDroped.cmpnt_p_index);
		$(targetEle).next().remove();// remove ul element next to p element
	} else if (ele_to_be_addDroped.ele.tagName == "LI") {
		let div = $(".rsm-cmpnt").eq(ele_to_be_addDroped.cmpnt_index);
		let p = $(div).children(".rsm-cmpnt-btm").children().eq(ele_to_be_addDroped.cmpnt_p_index);
		targetEle = $(p).next().children().eq(ele_to_be_addDroped.cmpnt_li_index);
	}
	$(targetEle).remove();
	$("#addDropBtn").hide();
});
$("body").on("click", "#addBtn", function() {
	var targetEle, newEle;
	if (ele_to_be_addDroped.ele.tagName == "DIV") {
		newEle = $(".rsm-cmpnt").eq(ele_to_be_addDroped.cmpnt_index).prop('outerHTML');
		targetEle = $(".rsm-cmpnt").eq(ele_to_be_addDroped.cmpnt_index);
	} else if (ele_to_be_addDroped.ele.tagName == "P") {
		let tempEle = ele_to_be_addDroped.ele;
		targetEle = $(tempEle).next();
		newEle = $(tempEle).prop("outerHTML") + $(targetEle).prop("outerHTML");
	} else if (ele_to_be_addDroped.ele.tagName == "LI") {
		let div = $(".rsm-cmpnt").eq(ele_to_be_addDroped.cmpnt_index);
		let p = $(div).children(".rsm-cmpnt-btm").children().eq(ele_to_be_addDroped.cmpnt_p_index);
		targetEle = $(p).next().children().eq(ele_to_be_addDroped.cmpnt_li_index);
		newEle = $(targetEle).prop("outerHTML");
	}
	$(targetEle).after(newEle);
	$("#addDropBtn").hide();
});
$("body").on("mouseenter", "[contenteditable]", function() {
	$(this).focus();
});
        
    </script>
     <script type="text/javascript">
	var sc_project = 11722433;
	var sc_invisible = 1;
	var sc_security = "7fc26bb9";
</script>
<script type="text/javascript" src="https://www.statcounter.com/counter/counter.js" async></script>
<noscript>
	<div class="statcounter"><a title="Web Analytics" href="https://statcounter.com/" target="_blank"><img class="statcounter" src="https://c.statcounter.com/11722433/0/7fc26bb9/1/" alt="Web Analytics"></ a>
	</div>
</noscript>
<!-- End of Statcounter Code -->
</html>
