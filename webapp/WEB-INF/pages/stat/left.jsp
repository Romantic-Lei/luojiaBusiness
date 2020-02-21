<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ include file="../specialEffects.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<script type="text/javascript"
	src="${ctx}/components/jquery-ui/jquery-1.2.6.js"></script>
</head>

<body id="left_frame">
	<div class="PositionFrame_black" id="PositionFrame"></div>


	<div id="sidebar" class="sidebar">
		<div class="sidebar_t">
			<div class="sidebar_t_l"></div>
			<div class="sidebar_t_c"></div>
			<div class="sidebar_t_r"></div>
		</div>
		<div class="panel">
			<div class="panel_icon">
				<img src="${ctx}/skin/default/images/icon/screen.png" />
			</div>
			<div class="panel-header">
				<div class="panel-title">统计查询</div>
				<div class="panel-content">
					<ul>
						<li><a href="${ctx}/stat/chart/factorySale.action"
							onclick="linkHighlighted(this)" target="main" id="aa_1">生产厂家销售情况</a></li>
						<li><a href="${ctx}/stat/chart/productSale.action"
							onclick="linkHighlighted(this)" target="main" id="aa_1">产品销售排行</a></li>
						<li><a href="${ctx}/stat/chart/onlineInfo.action"
							onclick="linkHighlighted(this)" target="main" id="aa_1">系统访问压力图</a></li>
						<li>json串完成功能</a></li>
						<li><a href="${ctx}/stat/chart/factorySaleJson.action"
							onclick="linkHighlighted(this)" target="main" id="aa_1">生产厂家销售情况</a></li>
						<li><a href="${ctx}/stat/chart/productSaleJson.action"
							onclick="linkHighlighted(this)" target="main" id="aa_1">产品销售排行</a></li>
						<li><a href="${ctx}/stat/chart/onlineInfoJson.action"
							onclick="linkHighlighted(this)" target="main" id="aa_1">系统访问压力图</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="sidebar_t">
			<div class="sidebar_b_l"></div>
			<div class="sidebar_t_c"></div>
			<div class="sidebar_b_r"></div>
		</div>
	</div>



</body>
</html>
