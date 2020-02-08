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
	background: url(${ctx}/images/olmsg/jcxx.png);
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
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj1.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj8.png'"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj7.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj6.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/2.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/5.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj4.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/10.png')"></div>
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
					<td colspan="2" class="subModelTitle0"><span0>基础信息管理模块介绍</span0></td>
				</tr>

				<!-- <tr>
					<td colspan="2" class="subModelTitle">基础代码管理</td>
				</tr>
				<tr>
					<td class="model_intro_left" width="169"><span>系统代码：</span></td>
					<td class="model_intro_right" width="81%"><span1>统一管理系统中的基础代码,
						相比“基础代码”它结果将形成多级树型结构。</span1></td>
				</tr> -->

				<tr>
					<td colspan="2" class="subModelTitle">基础信息管理</td>
				</tr>
				<tr>
					<td class="model_intro_left"><span>厂家信息：</span></td>
					<td class="model_intro_right"><span1>在购销合同中货物和附件中可选择对应的厂家。</span1></td>
				</tr>

				<tfoot>
					<tr>
						<td colspan="2" class="subModelTitle0"></td>
					</tr>
				</tfoot>
			</table>

		</div>
		</div>
	</form>
</body>

</html>