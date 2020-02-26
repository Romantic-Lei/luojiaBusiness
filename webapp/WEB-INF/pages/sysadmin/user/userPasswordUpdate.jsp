<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ include file="../../specialEffects.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<script type="text/javascript" src="../../js/datepicker/WdatePicker.js"></script>
<style>
.curbody {
	CURSOR: url(${ctx}/images/olmsg/pic738x57.jpg);
	background: url(${ctx}/images/bj7.png);
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
							<li id="update"><a href="#"
								onclick="formSubmit('updateByOwn.action','_self');this.blur();">确定</a></li>
							<li id="back"><a href="#"
								onclick="formSubmit('${ctx}/sysadmin/user/list.action','_self');this.blur();">重置</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 页面主体部分（列表等） -->
		<div class="textbox" id="centerTextbox">
			<div class="textbox-header">
				<div class="textbox-inner-header">
					<div class="textbox-title">用户信息修改</div>
				</div>
			</div>

			<div>

				<div class="eXtremeTable">
					<table id="ec_table" class="tableRegion" width="98%">
						<thead>
							<tr>
								<td class="tableHeader">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
								<td class="tableHeader">&nbsp;<input type="text" name="userName" value="${name }" readonly="readonly" /></td>
							</tr>
							<tr>
								<td class="tableHeader">所属部门：</td>
								<td class="tableHeader">&nbsp;<input type="text" name="department" value="${dept }" readonly="readonly" /></td>
							</tr>
							<tr>
								<td class="tableHeader">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
								<td class="tableHeader">&nbsp;<input type="text" name="email" value="${email }" readonly="readonly" /></td>
							</tr>
							<tr>
								<td class="tableHeader">生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日：</td>
								<td class="tableHeader">&nbsp;<input type="text"
								style="width: 130px;" name="birthday"
								value="<fmt:formatDate value="${birthday }" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({el:this,isShowOthers:false,dateFmt:'yyyy-MM-dd HH:mm:ss'});" /></td>
							</tr>
							<tr>
								<td class="tableHeader">新&nbsp;&nbsp;密&nbsp;码：</td>
								<td class="tableHeader">&nbsp;<input type="password" name="passWord"/>${tip }</td>
							</tr>
							<tr>
								<td class="tableHeader">确认密码：</td>
								<td class="tableHeader">&nbsp;<input type="password" name="rePwd"/>${tips }</td>
							</tr>
						</thead>
					</table>
				</div>

			</div>
	</form>
</body>
</html>

