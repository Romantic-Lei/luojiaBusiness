<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ include file="../../specialEffects.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>员工部门修改</title>
<script type="text/javascript" src="${ctx }/components/jquery-ui/jquery-1.2.6.js"></script>
<script type="text/javascript">
	function getByEmail(){
		var email = document.getElementsByName("email")[0].value;
		$.ajax({
			url : "${ctx}/sysadmin/user/updateByEmail.action",
			type : "POST",
			data : {email : email},
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success : function(data) {
				data = JSON.parse(data)
				if(null == data){
					alert("员工邮箱不存在");
				} else {
					console.log(data);
					document.getElementsByName("userName")[0].value = data.userName,
					document.getElementsByName("department")[0].value = data.department,
					
					alert(data.email);
				}
		    },
		    error : function(msg) {
		    	console.log(msg);
		    }
		});
	}
</script>
<body class="curbody">
	<form name="icform" method="post">
		<div id="menubar">
			<div id="middleMenubar">
				<div id="innerMenubar">
					<div id="navMenubar">
						<ul>
							<li id="update"><a href="#"
								onclick="formSubmit('update.action','_self');this.blur();">确定</a></li>
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
					<div class="textbox-title">添加员工信息</div>
				</div>
			</div>
			<div class="eXtremeTable">
				<table id="ec_table" class="tableRegion" width="98%">
					<tr>
						<td class="tableHeader">员工姓名：</td>
						<td class="tableHeader">&nbsp;<input type="text" name="userName" /></td>
					</tr>
					<tr>
						<td class="tableHeader">员工邮箱：</td>
						<td class="tableHeader">
							&nbsp;<input type="text" name="email" onchange="getByEmail();"/>
						</td>
					</tr>
					<tr>
						<td class="tableHeader">员工部门：</td>
						<td class="tableHeader">&nbsp; <select name="department">
								<option value="---">请选择</option>
								<option value="财务部">财务部</option>
								<option value="销售部">销售部</option>
								<option value="市场部">市场部</option>
								<option value="商务部">商务部</option>
								<option value="行政部">行政部</option>
								<option value="人事部">人事部</option>
								<option value="客服部">客服部</option>
								<option value="后勤部">后勤部</option>
								<option value="软件开发部">软件开发部</option>
						</select>
						</td>
					</tr>
					<tr>
						<!--  人事添加员工信息时，会有初始密码，只允许员工自己修改自己密码 -->
						<td class="tableHeader">员工密码：</td>
						<td><input type="text" name="passWord" value="******" readonly="readonly" /></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>