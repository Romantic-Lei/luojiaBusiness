<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="base.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>珞珈商务综合管理平台</title>
<script language='javascript'>
	history.go(1);
</script>
<link rel="stylesheet" rev="stylesheet" type="text/css"
	href="${ctx}/skin/default/css/login.css" media="all" />
<link rel="icon" href="${ctx}/skin/default/images/bussiness.ico"
	type="image/x-icon" />
</head>

<style>
body{
	background: url(${ctx}/skin/default/images/login/bg.png) no-repeat 50%; 
	margin:0px; 
	padding:0px; 
	font-size:12px; 
	color:#FFFFFF; 
	text-align:center; }
</style>

<body>
	<form action=""${ctx}/luojiaBusiness/login.action" method="post" name="Form1">
		<div id="warpbox">
			<div class="main">
				<div class="zck">
					<div class="zc">
						<div class="zc_line">
							邮 &nbsp;&nbsp;箱： <input type="text" value="" name="email" id="email" />
							<div id="ts" style="z-index: 1;"></div>
						</div>
						<div class="zc_line">
							密 &nbsp;&nbsp;码：    <input type="password" value="" name="passWord" onkeydown="KeyDown();"
								id="passWord">
						</div>
					</div>
					<div class="dl">
						<input class="loginImgOut" value="" type="submit" name="btnsubmit"
							onclick="formSubmit('${ctx}/login.action','_self');"
							onmouseover="this.className='loginImgOver'"
							onmouseout="this.className='loginImgOut'" />
						<input class="resetImgOut" value="" type="button" 
							onclick="clearInput();"
							onmouseover="this.className='resetImgOver'"
							onmouseout="this.className='resetImgOut'" />
					</div>
				</div>
				<div class="bqxx" style="text-align: right; margin-top: 0px;">
					<a href="https://www.baidu.com">系统帮助</a> | <a href="#" onclick="bookmarkit();">加入收藏</a>
				</div>

				<div class="mirro"></div>
				<logic:notEmpty name="loginFailed">
					<c:if test="${loginFailed==1}">
						<c:set var="errorInfo" value="用户名或密码错误, 请重新输入!" />
					</c:if>
					<c:if test="${loginFailed==2}">
						<c:set var="errorInfo" value="用户名不存在, 请重新输入!" />
					</c:if>
					<div class="erro" id="erro">
						<div class="erro_intro">${errorInfo}</div>
					</div>
				</logic:notEmpty>
			</div>
		</div>
	</form>

<script type="text/JavaScript">
	document.getElementById('login_main').userName.focus();
	function KeyDown(){
	  if (event.keyCode == 13)
	  {
	    event.returnValue=false;
	    event.cancel = true;
	    Form1.btnsubmit.click();
	  }
	}
	function clearInput(){
		document.getElementById('userName').value = "";
		document.getElementById('passWord').value = "";
	}
</script>

</body>
</html>


