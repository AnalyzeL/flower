<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<link type="text/css" href="css/admin.css" rel="stylesheet">
</head>
<body>
	<table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
		<tr height=28><td background="images/title_bg1.jpg">当前位置 &raquo; 发货</td></tr>
		<tr><td bgcolor=#b1ceef height=1></td></tr>
		<tr height=20><td background="images/shadow_bg.jpg"></td></tr>
	</table>
	</br>
	
	<table><tr><td>	
			选择物流：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="logisticss" style="width:100px">
				<s:iterator value="#request.logisticss">
					<option value=<s:property value="id"/> >
						<s:property value="logisticsName"/>
					</option>
				</s:iterator>
			</select><br>
			选择发货商店：<select name="repertoryReally" style="width:100px">
				<s:iterator value="#request.repertoryReally">
					<option value=<s:property value="id"/> >
						<s:property value="offlinestoreName"/>
					</option>
				</s:iterator>
			</select><br>
			<a href="orderDispose.action?id=<s:property value="order_id"/>">发货</a>
		</td><td>	
		
		
		
	

</body>
</html>