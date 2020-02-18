<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ include file="../../texiao.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<style>
.curbody {
	CURSOR: url(${ctx}/images/olmsg/pic738x57.jpg);
	background: url(${ctx}/images/olmsg/lsgxht.jpg);
}
</style>
</head>

<body class="curbody">
	<form name="icform" method="post">

		<div id="menubar">
			<div id="middleMenubar">
				<div id="innerMenubar">
					<div id="navMenubar">
						<ul>
							<li id="view"><a href="#"
								onclick="formSubmit('${ctx}/cargo/contracthis/toview.action','_self');this.blur();">查看</a></li>
							<li id="delete"><a href="#"
								onclick="formSubmit('delete.action','_self');this.blur();">删除</a></li>
							<li id="print"><a href="#"
								onclick="formSubmit('print.action','_self');this.blur();">打印</a></li>
							<li id="new"><a href="#"
								onclick="formSubmit('${ctx}/cargo/contracthis/pigeouthole.action','_self');this.blur();"
								title="取消归档">取消</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 页面主体部分（列表等） -->
		<div class="textbox" id="centerTextbox">
			<div class="textbox-header">
				<div class="textbox-inner-header">
					<div class="textbox-title">历史合同列表</div>
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
								<td class="tableHeader">客户名称</td>
								<td class="tableHeader">合同号</td>
								<td class="tableHeader">货物数/附件数</td>
								<td class="tableHeader">制单人</td>
								<td class="tableHeader">审单人</td>
								<td class="tableHeader">验货员</td>
								<td class="tableHeader">签单日期</td>
								<td class="tableHeader">交货期限</td>
								<td class="tableHeader">船期</td>
								<td class="tableHeader">总金额</td>
							</tr>
						</thead>
						<tbody class="tableBody">

							<c:forEach items="${dataList}" var="o" varStatus="status">
								<tr class="odd" onmouseover="this.className='highlight'"
									onmouseout="this.className='odd'">
									<td><input type="checkbox" name="id" value="${o.id}" /></td>
									<!-- 序号是当前索引加1 -->
									<td>${status.index+1}</td>
									<td>${o.customName}</td>
									<td><a href="toview.action?id=${o.id}">${o.contractNo}</a></td>
									<td align="center">${o.cpnum}/${o.extnum}</td>
									<td>${o.inputBy}</td>
									<td>${o.checkBy}</td>
									<td>${o.inspector}</td>
									<td><fmt:formatDate value="${o.signingDate}"
											pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatDate value="${o.deliveryPeriod}"
											pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatDate value="${o.shipTime}"
											pattern="yyyy-MM-dd" /></td>
									<td>${o.totalAmount}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
	</form>
</body>
</html>

