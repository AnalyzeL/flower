<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv=content-type content="text/html; charset=gb2312">
	<link href="css/admin.css" type="text/css" rel="stylesheet">
</head>
<body>
	<table cellspacing=0 cellpadding=0 width="100%" background="images/header_bg.jpg" border=0>
		<tr height=56>
			<td width=260><img height=56  width=260 src="images/header_left.jpg"></td>
			<td style="font-weight: bold; color: #fff; padding-top: 20px">
				当前用户：${admin} &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
				<a style="color: #fff" onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="login.jsp" target=_top>退出系统</a> 
			</td>
			<td align=right width=268><img height=56 width=268 src="images/header_right.jpg"></td>
		</tr>
	</table>
	<table cellspacing=0 cellpadding=0 width="100%" border=0>
		<tr bgcolor=#1c5db6 height=4>
			<td></td>
		</tr>
	</table>
</body>
</html>
