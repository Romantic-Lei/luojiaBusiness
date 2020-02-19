<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<%@ include file="../../specialEffects.jsp"%>
<%@ include file="../../background.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<script type="text/javascript"
	src="${ctx}/components/jquery-ui/jquery-1.2.6.js"></script>
<script type="text/javascript" src="${ctx}/js/tabledo.js"></script>

<script type="text/javascript" src="../../js/datepicker/WdatePicker.js"></script>

</head>
<body>
	<form method="post">
		<input type="hidden" name="id" value="${obj.id }" />

		<div id="menubar">
			<div id="middleMenubar">
				<div id="innerMenubar">
					<div id="navMenubar">
						<ul>
							<li id="back"><a href="list.action">返回</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="textbox" id="centerTextbox">

			<div class="textbox-header">
				<div class="textbox-inner-header">
					<div class="textbox-title">查看出口报运信息</div>
				</div>
			</div>
			<div>
				<div>
					<table class="commonTable" cellspacing="1">
						<tr>
							<td class="columnTitle_mustbe">合同或确认书号：</td>
							<td class="tableContent">${obj.customerContract }</td>
							<td class="columnTitle_mustbe">制单日期：</td>
							<td class="tableContent"><fmt:formatDate
									value="${obj.inputDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">信用证号：</td>
							<td class="tableContent">${obj.lcno }</td>
							<td class="columnTitle_mustbe">收货人及地址：</td>
							<td class="tableContent">${obj.consignee }</td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">装运港：</td>
							<td class="tableContent">${obj.shipmentPort }</td>
							<td class="columnTitle_mustbe">目的港：</td>
							<td class="tableContent">${obj.destinationPort }</td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">运输方式：</td>
							<td class="tableContentAuto"><c:if
									test="${obj.transportMode =='SEA' }">SEA</c:if> <c:if
									test="${obj.transportMode =='AIR' }">AIR</c:if></td>
							<td class="columnTitle_mustbe">价格条件：</td>
							<td class="tableContentAuto"><c:if
									test="${obj.priceCondition =='FOB' }">FOB</c:if> <c:if
									test="${obj.priceCondition =='CIF' }">CIF</c:if></td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">唛头：</td>
							<td class="tableContent">${obj.marks }</td>
							<td class="columnTitle_mustbe">备注：</td>
							<td class="tableContent">${obj.remark }</td>
						</tr>
					</table>
				</div>
			</div>
	</form>
</body>
</html>

