<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ include file="../../specialEffects.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>员工部门修改</title>

<script type="text/javascript" src="${ctx }/components/jquery-ui/jquery-1.2.6.js"></script>
<script type="text/javascript">
	function getGMT(date){
		var date = new Date(parseInt(date));
		var year = date.getFullYear();
		var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
		var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
		date = year + "-" + month + "-" + currentDate;
		return date;
	}
	
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
					
					// 拼接查询到的员工信息，默认勾选，用户直接点击删除即可
					document.getElementById("innerEmp").innerHTML = "<tr class=\"odd\" onmouseover=\"this.className='highlight'\" onmouseout=\"this.className='odd'\">"
						+ "<td><input type=\"checkbox\" checked=\"checked\" name=\"id\" value= "+data.uid+" /></td>"
						+ "<td>1</td>"
						+ "<td>" + data.userName + "</td>"
						+ "<td>******</td>"
						+ "<td>" + data.email + "</td>"
						+ "<td>" + getGMT(data.createTime) + "</td>"
						+ "<td>" + data.seniority + "天</td>"
						+ "<td>" + getGMT(data.birthday) + "</td>"
						+ "<td>" + data.nextBirthday + "</td>"
						+ "<td>" + data.department + "</td>"
						+ "</tr>";

						//	                <fmt:formatDate value="${releaseTime}" pattern="yyyy-MM-dd"/>
				} else {
					alert("员工不存在");
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
							<td class="tableHeader">员工姓名</td>
							<td class="tableHeader">员工密码</td>
							<td class="tableHeader">员工邮箱</td>
							<td class="tableHeader">入职日期</td>
							<td class="tableHeader">员工工龄</td>
							<td class="tableHeader">员工生日</td>
							<td class="tableHeader">下次生日</td>
							<td class="tableHeader">所属部门</td>
						</tr>
					</thead>
					<tbody class="tableBody" id="innerEmp">
						<c:forEach items="${dataList}" var="o" varStatus="status" >
							<tr class="odd" onmouseover="this.className='highlight'"
								onmouseout="this.className='odd'">
							<td><input type="checkbox" name="id" value="${o.uid}"/></td>
							<!-- 序号是当前索引加1 -->
							<td>${status.index+1}</td>
							<td>${o.userName}</td>
							<td>******</td>
							<td>${o.email}</td>
							<td><fmt:formatDate value="${o.createTime}" pattern="yyyy-MM-dd" /></td>
							<td>${o.seniority}天</td>
							<td><fmt:formatDate value="${o.birthday}" pattern="yyyy-MM-dd"/></td>
							<td>
								<c:choose >
									<c:when test="${o.nextBirthday<=30}"><b><font color="gren" >${o.nextBirthday}天</font></b></c:when>
									<c:otherwise>${o.nextBirthday}天</c:otherwise>
								</c:choose>
							</td>
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