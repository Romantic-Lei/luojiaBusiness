<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../specialEffects.jsp"%>
<%@ include file="../base.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<title></title>
<link rel="stylesheet" rev="stylesheet" type="text/css"
	href="${ctx}/skin/default/css/default.css" media="all" />
<link rel="stylesheet" rev="stylesheet" type="text/css"
	href="${ctx}/skin/default/css/backgroundChange.css" media="all" />

<script type="text/javascript"
	src="/components/jquery-ui/jquery-1.2.6.js"></script>
<script language="javascript" src="${ctx}/js/common.js"></script>
<style>
.curbody {
	CURSOR: url(${ctx}/images/olmsg/pic738x57.jpg);
	background: url(${ctx}/images/olmsg/timg1.png);
}

.msgcontent {
	width: 218px;
	overflow: hidden;
	word-break: break-all;
	padding: 10px;
	font-size: 14px;
	color: #339966;
	font-family: Tahoma;
	line-height: 180%;
}

.msgcontent p {
	text-indent: 0px;
}

.msgcontent ul {
	margin: 0px;
}

.msgbackcontent {
	width: 218px;
	overflow: hidden;
	word-break: break-all;
	padding: 10px;
	font-size: 14px;
	color: #339966;
	font-family: Tahoma;
	line-height: 180%;
}

.msgbackcontent p {
	text-indent: 0px;
}

.msgbackcontent ul {
	margin: 0px;
}

.div0 {
	transition-duration: 600s;
	width: 450px;
	position: fixed;
	top: 1px;
	left: 1px;
	z-index: -2;
	/* transition-timing-function: ease-out; */
}

.div1 {
	transition-duration: 600s;
	width: 350px;
	position: fixed;
	bottom: 0px;
	right: 400px;
	z-index: -1;
	/* transition-timing-function: ease-out; */
}

.div2 {
	transition-duration: 600s;
	width: 450px;
	position: fixed;
	top: 1px;
	right: -5px;
	z-index: -1;
	/* transition-timing-function: ease-out; */
}

.d1 {
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	width: 100%;
	background: url(${ctx}/images/olmsg/C0FFE51.gif);
	background-attachment: fixed;
}

li {
	text-indent: 0px;
	margin: 0px;
	list-style: default;
}
</style>

</head>

<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- 引入魔法圈转动需要的js -->
<script type="text/javascript"
	src="${ctx}/components/jquery-ui/jquery-3.3.1.min.js"></script>
<script language="javascript"> 
<!-- 控制层移动start of script -->
var Obj='';
var index=10000;//z-index;
var color='';
var str='';
document.onmouseup=MUp
document.onmousemove=MMove

/**
 * 加载魔法圈
 */
$(document).ready(function () {

   $(".div0").css("transform","rotate(21600deg)");
   $(".div1").css("transform","rotate(-25200deg)");
   $(".div2").css("transform","rotate(21600deg)");
});
 
function MMove(){
	if(Obj!=''){
		document.all(Obj).style.left=event.x-pX;
		document.all(Obj).style.top=event.y-pY;
	}
}
 
function MUp(){
	if(Obj!=''){
		document.all(Obj).releaseCapture();
		Obj='';
	}
	var srcEle = event.srcElement;
	
	var children = srcEle.children;
	if(children.length>0){
		children[1].value = "1";		//isChange
		children[2].value = event.x-pX;
		children[3].value = event.y-pY;
	}
}
 
function MDown(objtd,id){
	Obj=id
	document.all(Obj).setCapture()
	pX = event.x-document.all(Obj).style.pixelLeft;
	pY = event.y-document.all(Obj).style.pixelTop;
}
 
//-- 控制层移动end of script -->
//获得焦点;
function getFocus(obj)
{
       if(obj.style.zIndex!=index)
       {
               index = index + 2;
               var idx = index;
               obj.style.zIndex=idx;
               //obj.nextSibling.style.zIndex=idx-1;
       }
}
 
//针对未已阅的、未回复的、工作任务
function msgrevoke( id ){
	if(confirm("是否确定要撤销此条信息?")){
		//_Submit("/home/olmsgRevokeAction.do?flag=revoke&id="+id,null,"撤销");
	}
}
 
//需回复的留言
function msgback( id ){
	//_Submit("/home/olmsgUpdateAction.do?flag=back&id="+id,null,"回复");
}
 
function msgupdate( id , flag ){
	if(flag=="read"){
		if(!confirm("是否确定已阅此条信息?")){
			return false;
		}
	}else if(flag=="accept"){
		if(!confirm("是否确定接受此任务?")){
			return false;
		}
	}else if(flag=="fail"){
		if(!confirm("是否确定此任务未完成?")){
			return false;
		}
	}else if(flag=="success"){
		if(!confirm("是否确定此任务已完成?")){
			return false;
		}
	}else if(flag=="finished"){
		if(!confirm("是否确定完成?")){
			return false;
		}
	}else if(flag=="edit"){
		if(id == "ff8080813d00613e013d0067909e0009"){
			var addValue = prompt();
			$("#addEdit").append("<font color = 'red'>" + addValue + "</font>");
		}
		if(id == "ff8080813d00613e013d00681494000a"){
			var addValue = prompt();
			$("#rightAddEdit").append("<font color = 'red'>" + addValue + "</font>");
		}
	}
	//_Submit("/home/olmsgUpdateAction.do?flag="+flag+"&id="+id,null,"修改");
	
}
 
function msgdel( id ){
	if(confirm("是否确定要删除此条信息?")){
		if(id == "ff8080813d00613e013d0067909e0009"){
			$("#addEdit").empty();
			$("#addEdit").append("欢迎使用珞珈商贸信息管理平台" + "<br/>");
		}
		if(id == "ff8080813d00613e013d00681494000a"){
			$("#rightAddEdit").empty();
			$("#rightAddEdit").append("本系统为珞珈商贸项目二期，目前已实现企业基本信息管理功能<br/>");
			
		}
		//_Submit("/home/olmsgDeleteAction.do?delId="+id,null,"删除");
	}else{
		alert("已取消删除");
	}
}
 
function msgstate( id , flag ){
	if(flag=="read"){
		if(!confirm("是否确定已阅此条信息?")){
			return false;
		}
	}else if(flag=="accept"){
		if(!confirm("是否确定接受此任务?")){
			return false;
		}
	}else if(flag=="fail"){
		if(!confirm("是否确定此任务未完成?")){
			return false;
		}
	}else if(flag=="success"){
		if(!confirm("是否确定此任务已完成?")){
			return false;
		}
	}else if(flag=="finished"){
		if(!confirm("是否确定完成?")){
			return false;
		}
	}
	//_Submit("/home/olmsgStateAction.do?flag="+flag+"&delId="+id,null,"已阅");
}
 
function changRowColor(obj){
	//obj.removeAttribute("className");
	//alert(obj.className);
	//obj.setAttribute("bgcolor","#FFECB0");
	//obj.sytle.backgroundColor = "#FFECB0";
}
 
function removeOverRowColor(obj){
	//alert(obj.getAttribute("style"));
}
 
function killErrors() {
	return true;
}
 
window.onerror = killErrors;
</script>

<body class="curbody">
	<div class="slideshow">
		<div class="slideshow-image" style="background-image: url('${ctx}/images/6.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/4.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/2.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/3.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/5.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj3.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj4.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj5.png')"></div>
		
	</div>
	
		<img src="${ctx}/skin/default/images/1.png" class="div0" />
		<img src="${ctx}/skin/default/images/2.png" class="div1" />
		<img src="${ctx}/skin/default/images/7.png" class="div2" />
	</div>

	<form name="form2">
		<!-- 工具栏部分 ToolBar -->
		<div style="background-color: rgba(255, 255, 255, 0.4);width: 100%;height: 510px">
		<div id="menubar">
			<div id="middleMenubar">
				<div id="innerMenubar">
					<div id="navMenubar">
						<ul>

							<li id="new"><a href="#">新建</a></li>
							<li id="save"><a href="#" title="保存留言窗口的位置信息">位置</a></li>

							<li id="stat"><a href="#">历史</a></li>

						</ul>
					</div>
				</div>
			</div>
		

		<logic:notEmpty name="olmsgList">
			<div id='ff8080813d00613e013d0067909e0009'
				style='position: absolute; left: 122px; top: 97px; z-index: 1001; height: 164px; background: none;'
				onmousedown='getFocus(this)'>
				<table border=0 cellspacing="0" cellpadding="0" width="220">
					<tr class='d1'>
						<td style='cursor: move;'
							onmousedown="MDown(this,'ff8080813d00613e013d0067909e0009')"
							background="${ctx}/images/olmsg/C0FFE51.gif" height="45"><input
							type="hidden" name="id" class="input"
							value="ff8080813d00613e013d0067909e0009" /> <input type="hidden"
							name="isChange" class="input" value="0" /> <input type="hidden"
							name="posX" class="input" value="122" /> <input type="hidden"
							name="posY" class="input" value="97" /> &nbsp;</td>
					</tr>
					<tr>
						<td
							style='cursor: move; white-space: nowrap; background: rgba(225, 200, 66, 0.1);'
							width='100%'
							onmousedown="MDown('ff8080813d00613e013d0067909e0009')"
							background="${ctx}/images/olmsg/C0FFE52.gif">
							<div
								style="float: left; width: 130px; padding-left: 7px; font-family: Tahoma; color: gray; font-style: oblique;">
								<fmt:formatDate value="${now}" pattern="yyyy/M/d HH:mm:ss E" />
							</div>
							<div
								style="float: right; width: 80px; text-align: right; padding-right: 7px;">

								<a style='cursor: pointer;' title="编辑"
									onclick="msgupdate('ff8080813d00613e013d0067909e0009','edit')"><img
									src="${ctx}/images/olmsg/doc_edit.gif" /></a> <a
									style='cursor: pointer;' title="删除"
									onclick="msgdel('ff8080813d00613e013d0067909e0009')"><img
									src="${ctx}/images/olmsg/doc_del.gif" /></a>
							</div>
						</td>
					</tr>
					<tr>
						<td style='background: rgba(225, 225, 66, 0.1);'
							background="${ctx}/images/olmsg/C0FFE52.gif">
							<div class="msgcontent" id="addEdit">欢迎使用珞珈商贸信息管理平台<br/></div>
						</td>
					</tr>
					<tr>
						<td style='background: rgba(225, 225, 66, 0.1);' id="tagBPic"
							background="${ctx}/images/olmsg/C0FFE53.gif" height="63">
							<table border="0" width="100%" cellspacing="0" cellpadding="0">
								<tr>
									<td width="50" align="center"><img border="0"
										src="${ctx}/images/olmsg/2.gif"></td>
									<td style="text-align: right; padding-right: 8px;" nowrap>
										[备忘]</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			<div id='ff8080813d00613e013d00681494000a'
				style='position: absolute; left: 520px; top: 91px; z-index: 1002; height: 164px; background: none;'
				onmousedown='getFocus(this)'>
				<table border=0 cellspacing="0" cellpadding="0" width="220">
					<tr class='d1'>
						<td style='cursor: move;'
							onmousedown="MDown(this,'ff8080813d00613e013d00681494000a')"
							background="${ctx}/images/olmsg/FFE7E81.gif" height="45"><input
							type="hidden" name="id" class="input"
							value="ff8080813d00613e013d00681494000a" /> <input type="hidden"
							name="isChange" class="input" value="0" /> <input type="hidden"
							name="posX" class="input" value="442" /> <input type="hidden"
							name="posY" class="input" value="91" /> &nbsp;</td>
					</tr>
					<tr align="right">
						<td
							style='cursor: move; white-space: nowrap; background: rgba(225, 0, 20, 0.1);'
							width='100%'
							onmousedown="MDown('ff8080813d00613e013d00681494000a')"
							background="${ctx}/images/olmsg/FFE7E82.gif">
							<div
								style="float: left; width: 130px; padding-left: 7px; font-family: Tahoma; color: gray; font-style: oblique;">
								2019-03-22 13:38</div>
							<div
								style="float: right; width: 80px; text-align: right; padding-right: 7px;">
								<a style='cursor: pointer;' title="编辑"
									onclick="msgupdate('ff8080813d00613e013d00681494000a','edit')"><img
									src="${ctx}/images/olmsg/doc_edit.gif" /></a> <a
									style='cursor: pointer;' title="删除"
									onclick="msgdel('ff8080813d00613e013d00681494000a')"><img
									src="${ctx}/images/olmsg/doc_del.gif" /></a>
							</div>
						</td>
					</tr>
					<tr>
						<td style='background: rgba(225, 0, 20, 0.1);'
							background="${ctx}/images/olmsg/FFE7E82.gif">
							<div class="msgcontent" id="rightAddEdit">
								本系统为珞珈商贸项目二期，目前已实现企业基本信息管理功能<br/>
							</div>
						</td>
					</tr>
					<tr>
						<td style='background: rgba(225, 0, 20, 0.1);' id="tagBPic"
							background="${ctx}/images/olmsg/FFE7E83.gif" height="63">
							<table border="0" width="100%" cellspacing="0" cellpadding="0">
								<tr>
									<td width="50" align="center"><img border="0"
										src="${ctx}/images/olmsg/0.gif"></td>
									<td style="text-align: right; padding-right: 8px;" nowrap>
										[备忘] <!-- [回复] --> <!-- [回执] --> <!-- [撤销原因] --> <!-- state==99[完成] -->
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</logic:notEmpty>
</div>
</div>



	</form>
	</div>
</body>
</html>

