<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<%@ include file="../../specialEffects.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<script type="text/javascript" src="../../js/datepicker/WdatePicker.js"></script>
</head>
<body>
	<form method="post">

		<div id="menubar">
			<div id="middleMenubar">
				<div id="innerMenubar">
					<div id="navMenubar">
						<ul>
							<li id="save"><a href="#" title="手工创建单元格样式"
								onclick="formSubmit('printHSSF1.action','_self');">打印一</a></li>
							<li id="save" ><a href="#" title="excel 2003以下模板打印"
								onclick="formSubmit('printHSSF.action','_self');">打印二</a></li>
							<li id="save"><a href="#" title="excel 2007以上版本模板打印"
								onclick="formSubmit('print.action','_self');">打印三</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="textbox" id="centerTextbox">

			<div class="textbox-header">
				<div class="textbox-inner-header">
					<div class="textbox-title">出货表月统计</div>
				</div>
			</div>
		</div>
			<div>
				<div>
					<table class="commonTable" cellspacing="1">
						<tr>
							<td class="columnTitle_mustbe">船期：</td>
							<td class="tableContent"><input type="text"
								style="width: 90px;" name="inputDate" value="2018-12"
								onclick="WdatePicker({el:this,isShowOthers:true,dateFmt:'yyyy-MM'});" />
							</td>
						</tr>
					</table>
				</div>
			</div>
	</form>
</body>
</html>

