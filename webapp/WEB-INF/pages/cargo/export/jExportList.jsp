<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ include file="../../specialEffects.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
</head>

<body>
	<form name="icform" method="post">

		<div id="menubar">
			<div id="middleMenubar">
				<div id="innerMenubar">
					<div id="navMenubar">
						<ul>
							<li id="view"><a href="#"
								onclick="formSubmit('toview.action','_self');this.blur();">查看</a></li>
							<li id="update"><a href="#"
								onclick="formSubmit('toupdate.action','_self');this.blur();">修改</a></li>
							<li id="delete"><a href="#"
								onclick="formSubmit('delete.action','_self');this.blur();">删除</a></li>
							<li id="new"><a href="#"
								onclick="formSubmit('submit.action','_self');this.blur();">上报</a></li>
							<li id="new"><a href="#"
								onclick="formSubmit('cancel.action','_self');this.blur();">取消</a></li>
							<li id="new"><a href="#"
								onclick="formSubmit('${ctx}/cargo/packinglist/tocreate.action','_self');this.blur();">装箱</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 页面主体部分（列表等） -->
		<div class="textbox" id="centerTextbox">
			<div class="textbox-header">
				<div class="textbox-inner-header">
					<div class="textbox-title">出口报运列表</div>
				</div>
			</div>

			<div>

				<div class="eXtremeTable">
					<table id="ec_table" class="tableRegion" width="98%">
						<thead>
							<tr>
								<!-- 当前复选框选中时，将id放进去 -->
								<td class="tableHeader"><input type="checkbox" name="selid"
									onclick="checkAll('id',this)"></td>
								<td class="tableHeader">序号</td>
								<td class="tableHeader">合同或确认书号</td>
								<td class="tableHeader">信用证号</td>
								<td class="tableHeader">货物数/附件数</td>
								<td class="tableHeader">收货人地址</td>
								<td class="tableHeader">装运港</td>
								<td class="tableHeader">目的港</td>
								<td class="tableHeader">运输方式</td>
								<td class="tableHeader">价格条件</td>
								<td class="tableHeader">制单日期</td>
								<td class="tableHeader">状态</td>
							</tr>
						</thead>
						<tbody class="tableBody">

							<c:forEach items="${dataList}" var="o" varStatus="status">
								<tr class="odd" onmouseover="this.className='highlight'"
									onmouseout="this.className='odd'">
									<td><input type="checkbox" name="id" value="${o.id}" /></td>
									<!-- 序号是当前索引加1 -->
									<td>${status.index+1}</td>
									<td><a href="toview.action?id=${o.id}">${o.customerContract}</a></td>
									<td>${o.lcno}</td>
									<td align="center">${o.epnum}/${o.extnum}</td>
									<td>${o.consignee}</td>
									<td>${o.shipmentPort}</td>
									<td>${o.destinationPort}</td>
									<td>${o.transportMode}</td>
									<td>${o.priceCondition}</td>
									<td><fmt:formatDate value="${o.inputDate}"
											pattern="yyyy-MM-dd" /></td>
									<td><c:if
											test="${o.state == 1 || o.state == 2 || o.state == 3 || o.state == 4}">
											<font style="color: green">已上报</font>
										</c:if> <c:if test="${o.state == 0}">
											<font style="color: gray">草稿</font>
										</c:if></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>

			</div>
	</form>
</body>
</html>

