<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../base.jsp"%>
<%@ include file="../specialEffects.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>模块介绍</title>
<link rel="stylesheet" rev="stylesheet" type="text/css"
	href="${ctx}/skin/default/css/main.css" media="all" />
<link rel="stylesheet" rev="stylesheet" type="text/css"
	href="${ctx}/skin/default/css/default.css" media="all" />
<link rel="stylesheet" rev="stylesheet" type="text/css"
	href="${ctx}/skin/default/css/backgroundChange.css" media="all" />
<style>
.curbody {
	CURSOR: url(${ctx}/images/olmsg/pic738x57.jpg);
	background: url(${ctx}/images/olmsg/hygl.png);
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
		<div class="slideshow-image" style="background-image: url('${ctx}/images/1.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/10.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/20.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/15.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj1.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj8.png'"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj7.png')"></div>
		<div class="slideshow-image" style="background-image: url('${ctx}/images/bj6.png')"></div>
	</div>
	<img src="${ctx}/skin/default/images/1.png" class="div0" />
	<img src="${ctx}/skin/default/images/2.png" class="div1" />
	<img src="${ctx}/skin/default/images/7.png" class="div2" />
	<form>
	<div style="background-color: rgba(255, 255, 255, 0.5);width: 1160px;height: 510px">
		<div class="textbox"></div>

		<div class="modelDiv">

			<table class="modelTable" cellspacing="1">
				<tr>
					<td colspan="2" class="subModelTitle0"><span0>货运模块介绍</span></td>
				</tr>
				<tr>
					<td class="subModelTitle"> <span>购销合同</span> </td>
					<td class="model_intro_right"><span1>客户签单后，公司向厂家下达购销合同，包括货物的具体要求和交期。合同按不同厂家打印购销合同单，附件单独打印，由公司驻当地销售人员分发到各工厂。<br>
						归档：标识彻底完成的项目，方便统计。在报运时也不能在选这些合同。</span1><br>
					</td>
				</tr>
				<tr>
					<td class="subModelTitle"><span>出货表</span></td>
					<td class="model_intro_right"><span1>根据合同和指定的船期月份，统计当月的出货情况。</span1><br></td>
				</tr>
				<tr>
					<td class="subModelTitle"><span>出口报运单</span></td>
					<td class="model_intro_right"><span1>根据购销合同制定出口商品报运单。报运时可以将多个购销合同形成一单报运；也可以只走部分货物。<br>
						分批走货：合同可以多个一起报运; 而一个合同可以分多次走货; 根据合同和合同货物的走货状态可以查看合同的走货情况。</span1> <!-- 修改走货状态：1)合同新增货物、修改货物 2)报运货物修改、删除货物、增补货物、删除报运 -->
					</td>
				</tr>
				<tr>
					<td class="subModelTitle"><span>HOME装箱单</span></td>
					<td class="model_intro_right"><span1>根据出口报运单制定HOME装箱单，先制作HOME装箱单给客户看，客人同意，则直接制定相应装箱单；如有调整，则重新复制修改出口报运单，可能拆成多个报运。</span1><br></td>
				</tr>
				<tr>
					<td class="subModelTitle"><span>装箱单</span></td>
					<td class="model_intro_right"><span1>根据出口报运单制定装箱单，填写发票号、发票时间，以及客人等相关信息。</span1><br></td>
				</tr>
				<tr>
					<td class="subModelTitle"><span>委托书</span></td>
					<td class="model_intro_right"><span1>根据装箱制定海运或空运委托书。</span1><br></td>
				</tr>
				<tr>
					<td class="subModelTitle"><span>发票</span></td>
					<td class="model_intro_right"><span1>根据装箱制定发票。</span1><br></td>
				</tr>
				<tr>
					<td class="subModelTitle" nowrap><span>财务出口报运单</span></td>
					<td class="model_intro_right"><span1>根据报运制定财务出口报运单。</span1><br></td>
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