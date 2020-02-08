<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../base.jsp"%>
<%@ include file="../specialEffects.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>模块介绍</title>
<link rel="stylesheet" rev="stylesheet" type="text/css"
	href="${ctx}/skin/default/css/main.css" media="all" />
<link rel="stylesheet" rev="stylesheet" type="text/css"
	href="${ctx}/skin/default/css/backgroundChange.css" media="all" />
	<style>
.curbody {
	CURSOR: url(${ctx}/images/olmsg/pic738x57.jpg);
	background: url(${ctx}/images/olmsg/xtgl.png);
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
</style>
</head>
<script type="text/javascript"
	src="${ctx}/components/jquery-ui/jquery-3.3.1.min.js">
</script>
<script language="javascript"> 
/**
 * 加载魔法圈
 */
$(document).ready(function () {

   $(".div0").css("transform","rotate(-21600deg)");
   $(".div1").css("transform","rotate(25200deg)");
   $(".div2").css("transform","rotate(-21600deg)");
});
</script>
<body class="curbody">
    <div class="slideshow">
		<div class="slideshow-image" style="background-image: url('${ctx}/images/14.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/13.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/16.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/17.png'"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/18.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/19.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/21.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/22.png')"></div>
	</div>
	<img src="${ctx}/skin/default/images/1.png" class="div0" />
	<img src="${ctx}/skin/default/images/2.png" class="div1" />
	<img src="${ctx}/skin/default/images/7.png" class="div2" />
	<form>
	<div style="background-color: rgba(255, 255, 255, 0.4);width: 1160px;height: 510px">
		<div class="textbox"></div>

		<div class="modelDiv">

			<table class="modelTable" cellspacing="1">
				<tr>
					<td colspan="2" class="subModelTitle0"><span0>系统维护模块介绍</span0></td>
				</tr>
				<tr>
					<td colspan="2" class="model_intro_right"><font size="2px" style="text-align: center; color: #b00db9;">权限管理</font></td>
				</tr>
				<tr>
					<td class="model_intro_left"><span>多维权限控制模型：</span></td>
					<td class="model_intro_right"><span1>横向模块权限控制(菜单、按钮、状态、功能点),
						纵向数据权限控制(行政部门、职务等级、管辖部门、管辖人员)。
						<p>严密的数据访问控制,充分保障数据的安全性。</p></span1>
					</td>
				</tr>
				<tr>
					<td class="model_intro_left"><span>角色管理：</span></td>
					<td class="model_intro_right"><span1>对人员角色进行权限分配, 实现用户权限批量设置,
						支持细粒度权限控制分配(菜单、按钮、状态、功能点)。</span1></td>
				</tr>
				<tr>
					<td class="model_intro_left" width="169"><span>部门管理：</span></td>
					<td class="model_intro_right" width="81%"><span1>对企业部门进行维护和管理。</span1></td>
				</tr>
				<tr>
					<td class="model_intro_left" width="169"><span>用户管理：</span></td>
					<td class="model_intro_right" width="81%"><span1>可对系统操作用户进行维护管理,
						维护信息包括用户账号、所属部门、功能权限等, 并支持对特殊用户账号锁定禁用操作。 <br />管辖部门管辖人员：实现对特定部门,
						特定人员分管关系。</span1>
					</td>
				</tr>

				<tfoot>
					<tr>
						<td colspan="2" class="model_intro_right"></td>
					</tr>
				</tfoot>
			</table>

		</div>
		</div>
	</form>
</body>

</html>