<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<%@ include file="../../specialEffects.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<script type="text/javascript" src="../../js/datepicker/WdatePicker.js"></script>
<script type="text/javascript">
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
		// 			var id = document.getElementById("id").value;
		// 			alert(id);

		var url = "http://localhost:8080/luojia/cxf/ExportServiceImpl";

		var requestBody = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:q0=\"http://impl.service.luojia.cn/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">"
				+ "<soapenv:Body><q0:get><arg0>"
				+ "8a63f9ca-1670-436a-96c7-e0f12b70e8d8"
				+ "</arg0></q0:get></soapenv:Body></soapenv:Envelope>";

		xmlHttpRequest.open("POST", url, true); //打开链接
		xmlHttpRequest.setRequestHeader("Content-Type", "text/xml;charset=UTF-8"); //设置请求头
		xmlHttpRequest.send(requestBody); //发送soap请求

		xmlHttpRequest.onreadystatechange = _back;
	}

	// 回调函数
	function _back() {
		if (xmlHttpRequest.readyState == 4) {
			if (xmlHttpRequest.status == 200) {
				var retXml = xmlHttpRequest.responseXML;
				var ret = retXml.getElementsByTagName("return")[0]; // 获取return 结点信息

				var test = ret.getElementsByTagName("customerContract")[0].firstChild.nodeValue;
				var customerContract = ret.getElementsByTagName("customerContract")[0].firstChild.nodeValue; //获取到报运号
				document.getElementById("customerContract").innerHTML = customerContract;
				
				var inputDate =  ret.getElementsByTagName("inputDate")[0].firstChild.nodeValue;	//获取到报运号
				document.getElementById("inputDate").innerHTML = inputDate.substring(0,10);
				
				var lcno =  ret.getElementsByTagName("lcno").item(0).firstChild.nodeValue;
				document.getElementById("lcno").innerHTML = lcno;
				
				var consignee =  ret.getElementsByTagName("consignee")[0].firstChild.nodeValue;
				document.getElementById("consignee").innerHTML = consignee;
				
				var shipmentPort =  ret.getElementsByTagName("shipmentPort")[0].firstChild.nodeValue;
				document.getElementById("shipmentPort").innerHTML = shipmentPort;
				
				var destinationPort =  ret.getElementsByTagName("destinationPort")[0].firstChild.nodeValue;
				document.getElementById("destinationPort").innerHTML = destinationPort;
				
				var transportMode =  ret.getElementsByTagName("transportMode")[0].firstChild.nodeValue;
				document.getElementById("transportMode").innerHTML = transportMode;
				
				var priceCondition =  ret.getElementsByTagName("priceCondition")[0].firstChild.nodeValue;
				document.getElementById("priceCondition").innerHTML = priceCondition;
				
				var marks =  ret.getElementsByTagName("marks")[0].firstChild.nodeValue;
				document.getElementById("marks").innerHTML = marks;
				
				var remark =  ret.getElementsByTagName("remark")[0].firstChild.nodeValue;
				document.getElementById("remark").innerHTML = remark;
				
				var state =  ret.getElementsByTagName("state")[0].firstChild.nodeValue;
				if(state=='0'){
					state = "您的订单正在处理中";
				}else if(state=='1'){
					state = "已上报，待装箱";
				}else if(state=='2'){
					state = "已装箱，待委托";
				}else if(state=='3'){
					state = "已委托，待发票通知";
				}else if(state=='4'){
					state = "已发票，流程顺利完成!";
				}
				document.getElementById("state").innerHTML = "<font color='orange'>"+state+"</font>";
			} else {
				// 无法正确访问出口报运服务
				alert("error")
			}
		}
	}
</script>
</head>
<body>
	<form method="post">
		<div id="menubar">
			<div id="middleMenubar">
				<div id="innerMenubar">
					<div id="navMenubar">
						<ul>
							<li id="view"><a href="#" onclick="sendMsg();this.blur();">查看</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="textbox" id="centerTextbox">

			<div class="textbox-header">
				<div class="textbox-inner-header">
					<div class="textbox-title">出口报运跟踪</div>
				</div>
			</div>
			<div>

				<div>
					<table class="commonTable" cellspacing="1">
						<tr>
							<td class="columnTitle_mustbe">报运编号：</td>
							<td class="tableContent"><input type="text" name="id"
								id="id" value="a81f5a3f-386d-4b31-a03f-e81a8fe28a1d" /></td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">报运号：</td>
							<td class="tableContent" id="customerContract"></td>
							<td class="columnTitle_mustbe">制单日期：</td>
							<td class="tableContent" id="inputDate"></td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">信用证号：</td>
							<td class="tableContent" id="lcno"></td>
							<td class="columnTitle_mustbe">收货人及地址：</td>
							<td class="tableContent" id="consignee"></td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">装运港：</td>
							<td class="tableContent" id="shipmentPort"></td>
							<td class="columnTitle_mustbe">目的港：</td>
							<td class="tableContent" id="destinationPort"></td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">运输方式：</td>
							<td class="tableContentAuto" id="transportMode"></td>
							<td class="columnTitle_mustbe">价格条件：</td>
							<td class="tableContentAuto" id="priceCondition"></td>
						</tr>
						<tr>
							<td class="columnTitle_mustbe">唛头：</td>
							<td class="tableContent" id="marks"></td>
							<td class="columnTitle_mustbe">备注：</td>
							<td class="tableContent" id="remark"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

