<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ include file="../../specialEffects.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>员工部门修改</title>

<script type="text/javascript" src="${ctx }/components/jquery-ui/jquery-1.2.6.js"></script>
<script type="text/javascript">
	function getUser(){
		var email = document.getElementsByName("email")[0].value;
		$.ajax({
			url : "${ctx}/sysadmin/user/updateByEmail.action",
			type : "POST",
			data : {
				email : email
			},
			success : function(data) {
				data = JSON.parse(data);
				// 查询到了符合条件的员工就去操作
				if (null != data) {
					console.log(data);
					document.getElementById("innerEmp").innerHTML = "<tr class=\"odd\" onmouseover=\"this.className='highlight'\" onmouseout=\"this.className='odd'\">"
						+ "<td><input type=\"checkbox\" checked=\"checked\" name=\"id\" value= "+data.uid+" /></td>"
						+ "<td>1</td>"
						+ "<td>" + data.uid + "</td>"
						+ "<td>" + data.userName + "</td>"
						+ "<td>******</td>"
						+ "<td>" + data.email + "</td>"
						+ "<td>" + data.department + "</td>"
						+ "</tr>";
				}
			},
			error : function(msg) {
				console.log(msg);
			}
		});
	}
	
</script>

<body class="curbody">
	<c:if test="${dept == '人事部'}">
	<form name="icform" method="post">
		<div id="menubar">
			<div id="middleMenubar">
				<div id="innerMenubar">
					<div id="navMenubar">
						<ul>
							<li id="update"><a href="#"
								onclick="formSubmit('deleteById.action','_self');this.blur();">删除</a></li>
							<li id="back"><a href="#"
								onclick="formSubmit('${ctx}/sysadminMain.action','_self');this.blur();">返回</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 页面主体部分（列表等） -->
		<div class="textbox" id="centerTextbox">
			<div class="textbox-header">
				<div class="textbox-inner-header">
					<div class="textbox-title">
						查询员工信息
						<input type="text" name="email" placeholder="输入员工邮箱查询删除" onchange="getUser();"/>
					</div>
				</div>
			</div>
			<div class="eXtremeTable">
				<table id="ec_table" class="tableRegion" width="98%">
					<thead>
						<tr>
							<!-- 当前复选框选中时，将id放进去 -->
							<td class="tableHeader"><input type="checkbox" name="selid"
								onclick="checkAll('id',this)"/></td>
							<td class="tableHeader">序号</td>
							<td class="tableHeader">UID</td>
							<td class="tableHeader">员工姓名</td>
							<td class="tableHeader">员工密码</td>
							<td class="tableHeader">员工邮箱</td>
							<td class="tableHeader">所属部门</td>
						</tr>
					</thead>
					<tbody class="tableBody" id="innerEmp">
						<c:forEach items="${dataList}" var="o" varStatus="status" >
							<tr class="odd" onmouseover="this.className='highlight'"
								onmouseout="this.className='odd'">
							<td><input type="checkbox" name="id" value="${o.uid}" /></td>
							<!-- 序号是当前索引加1 -->
							<td>${status.index+1}</td>
							<td>${o.uid}</td>
							<td>${o.userName}</td>
							<td>******</td>
							<td>${o.email}</td>
							<td>${o.department}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	</c:if>
	<c:if test="${dept != '人事部' }">
   		 <font style="color: orange" size="6px">对不起，您没有权限修改您的部门，请联系人事部修改！</font>
	</c:if>
</body>