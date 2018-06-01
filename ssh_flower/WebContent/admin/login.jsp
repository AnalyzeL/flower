<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
	<title>掌柜登陆</title>
	<meta http-equiv=content-type content="text/html; charset=gb2312">
	<link href="css/admin.css" type="text/css" rel="stylesheet">
</head>
<body>
	<table height="100%" cellspacing=0 cellpadding=0 width="100%" bgcolor=#002779 border=0>
		<tr>
			<td align="center">
				<table cellspacing=0 cellpadding=0 width=468 border=0>
					<tr>
						<td><img height=23 src="images/login_1.jpg" width=468></td>
					</tr>
					<tr>
						<td><img height=147 src="images/login_2.jpg" width=468></td>
					</tr>
				</table>
				<table cellspacing=0 cellpadding=0 width=468 bgcolor=#ffffff border=0>
					<tr>
						<td width=16><img height=122 src="images/login_3.jpg" width=16></td>
						<td align="center">
						
						<form action="managerLogin.action" method="post" name="form" >
							<table cellspacing=0 cellpadding=0 width=230 border=0>
									<tr height=5>
										<td width=5></td>
										<td width=56></td>
										<td></td>
									</tr>
									<tr height=36>
										<td></td>
										<td>用户:</td>
										<td>
											<input name="manager.username" value="1" style="border-right: #000000 1px solid; border-top: #000000 1px solid; border-left: #000000 1px solid; border-bottom: #000000 1px solid" 
													maxlength=30 size=24 >
										</td>
									</tr>
									<tr height=36>
										<td>&nbsp; </td>
										<td>密码:</td>
										<td>
											<input name="manager.password" value="1" style="border-right: #000000 1px solid; border-top: #000000 1px solid; border-left: #000000 1px solid; border-bottom: #000000 1px solid" 
													type=password maxlength=30 size=24 >
										</td>
									</tr>
									<tr height=5><td colspan=3></td></tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>
											<!--  <input type=image height=20 width=70 src="images/bt_login.jpg">-->
											<input type="submit" value="登录"/>&nbsp;
											<font color="red">${msg }</font>
										</td>
									</tr>
							
							</table>
						</form>
						
						</td>
						<td width=16><img height=122 src="images/login_4.jpg" width=16></td>
					</tr>
				</table>
				<table cellspacing=0 cellpadding=0 width=468 border=0>
					<tr>
						<td><img height=16 src="images/login_5.jpg" width=468></td>
					</tr>
				</table>
				<table cellspacing=0 cellpadding=0 width=468 border=0>
					<tr>
						<td align=right>
							<img height=26 src="images/login_6.jpg" width=165 border=0>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
