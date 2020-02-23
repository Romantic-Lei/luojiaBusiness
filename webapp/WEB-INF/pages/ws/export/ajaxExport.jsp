<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<%@ include file="../../specialEffects.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<script type="text/javascript" src="../../js/datepicker/WdatePicker.js"></script>

<script type="text/javascript">
	function doc(value) {
		if (value == 0) {
			document.getElementById('fm').hidden = true;
			document.getElementById('view').hidden = false;
			document.getElementById("putName").innerHTML = "信用证号：";
			document.getElementById("idOrLcno").value = "L/C";
			this.reset(); // 清空表格值
			
		} else if(value == 1) {
			document.getElementById('fm').hidden = true;
			document.getElementById('view').hidden = false;
			document.getElementById("putName").innerHTML = "报运编号：";
			document.getElementById("idOrLcno").value = "8a63f9ca-1670-436a-96c7-e0f12b70e8d8";
			this.reset(); // 清空表格值
		} else {
			document.getElementById('fm').hidden = false;
			document.getElementById('view').hidden = true;
			//document.getElementById('view').style.display="none"; // 显示报运表单查询框
			document.getElementById("putName").innerHTML = "报运编号：";
			document.getElementById("idOrLcno").value = "8a63f9ca-1670-436a-96c7-e0f12b70e8d8";
			this.reset(); // 清空表格值
		}

	}
	/* 
		开发步骤
		1、创建xmlHttpRquest对象
		2、open('POST', url, true)链接
		3、设置请求头
		4、send(xml)
		5、回调函数，接受响应xml
		6、从返回xml中抓取相关字段的信息
	 */
	var xmlHttpRequest = new XMLHttpRequest(); //创建XMLHTTP对象
	// alert(xmlHttpRequest);
	function sendMsg() {

		var idOrLcno = document.getElementById("idOrLcno").value;
		var num = document.getElementById("queryMode").value;

		var url = "http://localhost:8080/luojiaBusiness/cxf/ExportServiceImpl";
		var requestBody;
		if (num == 1) {
			requestBody = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:q0=\"http://impl.service.luojia.cn/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">"
					+ "<soapenv:Body><q0:get><arg0>"
					+ idOrLcno
					+ "</arg0></q0:get></soapenv:Body></soapenv:Envelope>";
		} else if (num == 0) {
			requestBody = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:q0=\"http://impl.service.luojia.cn/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">"
					+ "<soapenv:Body><q0:findByLcno><arg0>"
					+ idOrLcno
					+ "</arg0></q0:findByLcno></soapenv:Body></soapenv:Envelope>";
		}

		xmlHttpRequest.open("POST", url, true); //打开链接
		xmlHttpRequest.setRequestHeader("Content-Type",
				"text/xml;charset=UTF-8"); //设置请求头
		xmlHttpRequest.send(requestBody); //发送soap请求

		xmlHttpRequest.onreadystatechange = _back;
	}

	// 回调函数
	function _back() {
		if (xmlHttpRequest.readyState == 4) {
			if (xmlHttpRequest.status == 200) {
				var retXml = xmlHttpRequest.responseXML;
				var ret = retXml.getElementsByTagName("return")[0]; // 获取return 结点信息

				if (ret != null) {
					var test = ret.getElementsByTagName("customerContract")[0].firstChild.nodeValue;
					var customerContract = ret
							.getElementsByTagName("customerContract")[0].firstChild.nodeValue; //获取到报运号
					document.getElementById("customerContract").innerHTML = customerContract;

					var inputDate = ret.getElementsByTagName("inputDate")[0].firstChild.nodeValue; //获取到报运号
					document.getElementById("inputDate").innerHTML = inputDate
							.substring(0, 10);

					var lcno = ret.getElementsByTagName("lcno").item(0).firstChild.nodeValue;
					document.getElementById("lcno").innerHTML = lcno;

					var consignee = ret.getElementsByTagName("consignee")[0].firstChild.nodeValue;
					document.getElementById("consignee").innerHTML = consignee;

					var shipmentPort = ret.getElementsByTagName("shipmentPort")[0].firstChild.nodeValue;
					document.getElementById("shipmentPort").innerHTML = shipmentPort;

					var destinationPort = ret
							.getElementsByTagName("destinationPort")[0].firstChild.nodeValue;
					document.getElementById("destinationPort").innerHTML = destinationPort;

					var transportMode = ret
							.getElementsByTagName("transportMode")[0].firstChild.nodeValue;
					document.getElementById("transportMode").innerHTML = transportMode;

					var priceCondition = ret
							.getElementsByTagName("priceCondition")[0].firstChild.nodeValue;
					document.getElementById("priceCondition").innerHTML = priceCondition;

					var marks = ret.getElementsByTagName("marks")[0].firstChild.nodeValue;
					document.getElementById("marks").innerHTML = marks;

					var remark = ret.getElementsByTagName("remark")[0].firstChild.nodeValue;
					document.getElementById("remark").innerHTML = remark;

					var state = ret.getElementsByTagName("state")[0].firstChild.nodeValue;
					if (state == '0') {
						state = "您的订单正在处理中";
					} else if (state == '1') {
						state = "已上报，待装箱";
					} else if (state == '2') {
						state = "已装箱，待委托";
					} else if (state == '3') {
						state = "已委托，待发票通知";
					} else if (state == '4') {
						state = "已发票，流程顺利完成!";
					}
					document.getElementById("state").innerHTML = "<font color='orange'>"
							+ state + "</font>";
				} else {
					reset();
				}
			} else {
				// 无法正确访问出口报运服务
				alert("error")
			}
		}
	}
	
	function reset(){
		var space = " ";
		document.getElementById("customerContract").innerHTML = space;
		document.getElementById("inputDate").innerHTML = space;
		document.getElementById("lcno").innerHTML = space;
		document.getElementById("consignee").innerHTML = space;
		document.getElementById("shipmentPort").innerHTML = space;

		document.getElementById("destinationPort").innerHTML = space;
		document.getElementById("transportMode").innerHTML = space;
		document.getElementById("priceCondition").innerHTML = space;
		document.getElementById("marks").innerHTML = space;
		document.getElementById("remark").innerHTML = space;
		document.getElementById("state").innerHTML = space;
	}
</script>
</head>
<body>
<div id="menubar">
			<div id="middleMenubar">
				<div id="innerMenubar">
					<div id="navMenubar">
						<ul>
							<li id="view" ><a href="#" onclick="sendMsg();this.blur();"hidden="false">查看</a></li>
						</ul>
						<form action="${ctx}/ws/export/get.action" method="post" id="fm" hidden="true">
							<div style="background-color: rgba(255, 255, 255, 0.4);width: 1160px;height: 1px">
								<input type="text" name="id" value="${id }" /> <input type="submit" value="物流单查询" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	
	<form method="post">
		
		<div class="textbox" id="centerTextbox">

			<div class="textbox-header">
				<div class="textbox-inner-header">
					<div class="textbox-title">
						出口报运跟踪 <select name="find" id="queryMode"
							onChange="doc(this.value)">
							<option value="0" selected="selected">信用证号查询</option>
							<option value="1">报运id查询</option>
							<option value="2">内网id查询</option>
						</select>
					</div>
				</div>
			</div>
		</div>

		<div class="textbox" id="centerTextbox">
			<div class="textbox-header">
				<div class="textbox-inner-header">
					<div class="textbox-title">
						状态： <span id="state"> <c:if test="${state == 5}">
										<font style="color: orange">您的订单正在报运中或者不存在,请稍后再试！</font>
									</c:if> <c:if test="${dataList.state == 0}">
										<font style="color: orange">您的订单正在处理中</font>
									</c:if> <c:if test="${dataList.state == 1}">
										<font style="color: orange">已上报，待装箱</font>
									</c:if> <c:if test="${dataList.state == 2}">
										<font style="color: gray">已上报，待装箱→</font>
										<font style="color: orange">已装箱，待委托</font>
									</c:if> <c:if test="${dataList.state == 3}">
										<font style="color: gray">已上报，待装箱→</font>
										<font style="color: gray">已装箱，待委托→</font>
										<font style="color: orange">已委托，待发票通知</font>
									</c:if> <c:if test="${dataList.state == 4}">
										<font style="color: gray">已上报，待装箱→</font>
										<font style="color: gray">已装箱，待委托→</font>
										<font style="color: gray">已委托，待发票通知→</font>
										<font style="color: orange">已发票，流程顺利完成!</font>
									</c:if>
								</span>
					</div>
				</div>
			</div>
			<div>

				<div>
					<table class="commonTable" cellspacing="1" id="clearTable">
						<tr>
							<td class="columnTitle_mustbe" id="putName">信用证号：</td>
							<td class="tableContent"><input type="text" name="lcno"
								id="idOrLcno" placeholder="L/C" value=""/></td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">报运号：</td>
							<td class="tableContent" id="customerContract">${dataList.customerContract }</td>
							<td class="columnTitle_mustbe">制单日期：</td>
							<td class="tableContent" id="inputDate"><fmt:formatDate
									value="${dataList.inputDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">信用证号：</td>
							<td class="tableContent" id="lcno">${dataList.lcno }</td>
							<td class="columnTitle_mustbe">收货人及地址：</td>
							<td class="tableContent" id="consignee">${dataList.consignee }</td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">装运港：</td>
							<td class="tableContent" id="shipmentPort">${dataList.shipmentPort }</td>
							<td class="columnTitle_mustbe">目的港：</td>
							<td class="tableContent" id="destinationPort">${dataList.destinationPort }</td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">运输方式：</td>
							<td class="tableContentAuto" id="transportMode">${dataList.transportMode }</td>
							<td class="columnTitle_mustbe">价格条件：</td>
							<td class="tableContentAuto" id="priceCondition">${dataList.priceCondition }</td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">唛头：</td>
							<td class="tableContent" id="marks">${dataList.marks }</td>
							<td class="columnTitle_mustbe">备注：</td>
							<td class="tableContent" id="remark">${dataList.remark }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

