<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../specialEffects.jsp"%>
<hr>
<font color="blue"><b>引入CSS、JS区域</b></font>
<hr>

<%@ include file="../../baselist.jsp"%>
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

							<hr>
							<font color="blue"><b>按钮区域</b></font>
							<hr>

							<li id="view"><a href="#"
								onclick="formSubmit('toview.action','_self');this.blur();">查看</a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 页面主体部分（列表等） -->
		<div class="textbox" id="centerTextbox">
			<div class="textbox-header">
				<div class="textbox-inner-header">
					<div class="textbox-title">生产厂家列表</div>
				</div>
			</div>

			<div>

				<div class="eXtremeTable">
					<table id="ec_table" class="tableRegion" width="98%">
						<thead>
							<tr>
								<td class="tableHeader"><input type="checkbox" name="selid"
									onclick="checkAll('id',this)"></td>
								<td class="tableHeader">序号</td>
								<td class="tableHeader">厂家全称</td>
								<td class="tableHeader">缩写</td>
								<td class="tableHeader">联系人</td>
								<td class="tableHeader">电话</td>
								<td class="tableHeader">手机</td>
								<td class="tableHeader">传真</td>
								<td class="tableHeader">验货员</td>
							</tr>
						</thead>
						<tbody class="tableBody">

							<c:forEach items="${dataList}" var="o" varStatus="status">
								<tr class="odd" onmouseover="this.className='highlight'"
									onmouseout="this.className='odd'">
									<td><input type="checkbox" name="id" value="${o.id}" /></td>
									<td>${status.index+1}</td>
									<td><a href="toview.action?id=${o.id}">${o.fullName}</a></td>
									<td>${o.factoryName}</td>
									<td>${o.contacts}</td>
									<td>${o.phone}</td>
									<td>${o.mobile}</td>
									<td>${o.fax}</td>
									<td>${o.inspector}</td>

								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>

			</div>
	</form>
</body>
</html>

