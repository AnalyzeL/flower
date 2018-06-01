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
		<tr height=28><td background="images/title_bg1.jpg">当前位置 &raquo; 物流管理</td></tr>
		<tr><td bgcolor=#b1ceef height=1></td></tr>
		<tr height=20><td background="images/shadow_bg.jpg"></td></tr>
	</table>


		<form action="LogisticsUpdate.action" method="post">
			<input type="hidden" name="logistics.id" value="${logistics.id}">
			<input type="hidden" name="logistics.logisticsName" value="${logistics.logisticsName}">
			物流:${logistics.logisticsName}<br>
			价格:<input type="text" name="logistics.price" value="${logistics.price}" required="required"/>
					<input type="submit" value="更新">
		</form>

</body>
</html>