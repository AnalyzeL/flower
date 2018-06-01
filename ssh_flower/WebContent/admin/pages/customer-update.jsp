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
		<tr height=28><td background="images/title_bg1.jpg">当前位置 &raquo; 顾客管理</td></tr>
		<tr><td bgcolor=#b1ceef height=1></td></tr>
		<tr height=20><td background="images/shadow_bg.jpg"></td></tr>
	</table>


		<form action="customerUpdate.action" method="post">
					<input type="hidden" name="customer.id" value="${customer.id}">
			用户:<input type="text" name="customer.username" value="${customer.username}" required="required"/><br>
			密码:<input type="text" name="customer.password" value="${customer.password}" required="required"/><br>
			电话:<input type="text" name="customer.phone" value="${customer.phone}"/><br>
			地址:<input type="text" name="customer.address" value="${customer.address}"/>
					<input type="submit" value="更新">
		</form>

</body>
</html>