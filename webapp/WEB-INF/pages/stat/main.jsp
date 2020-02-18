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
	background: url(${ctx}/images/olmsg/tjfx.png);
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
		<div class="slideshow-image" style="background-image: url('${ctx}/images/11.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/12.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj8.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj1.png')"></div>
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
					<td colspan="2" class="subModelTitle0"><span0>统计分析介绍</span0></td>
				</tr>
				<tr>
					<td class="subModelTitle"><span>生产厂家销售情况</span></td>
					<td class="model_intro_right"><span1>和公司合作的生产厂家销售情况饼形图</span1><br>
					</td>
				</tr>
				<tr>
					<td class="subModelTitle"><span>产品销售排行</span></td>
					<td class="model_intro_right"><span1>统计公司最畅销的产品是哪些？</span1><br><span1>统计公司最滞销的产品是哪些？</span1>
					</td>
				</tr>
				<tr>
					<td class="subModelTitle"><span>系统访问</span></td>
					<td class="model_intro_right"><span1>统计系统一天用户访问系统的情况，何时访问频繁，何时访问较少，方便开发人员对系统进行优化。</span1></td>
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