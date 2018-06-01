<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>管理中心</title>
		<meta http-equiv=content-type content="text/html; charset=gb2312">
		<meta http-equiv=pragma content=no-cache>
		<meta http-equiv=cache-control content=no-cache>
		<meta http-equiv=expires content=-1000>
		<link href="css/admin.css" type="text/css" rel="stylesheet">
	</head>
	
	<frameset border=0 framespacing=0 rows="60, *" border=0>
		<frame name=header src="head.jsp" frameborder=0 noresize scrolling=no>
		<frameset cols="170, *">
			<frame name=menu src="menu.jsp" frameborder=0 noresize >
			<frame name=main src="main.jsp" frameborder=0 noresize scrolling=yes>
		</frameset>
	</frameset>
	
	<noframes>
	</noframes>
</html>
