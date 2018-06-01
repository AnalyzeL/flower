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
		<tr height=28><td background="images/title_bg1.jpg">当前位置 &raquo; 鲜花管理</td></tr>
		<tr><td bgcolor=#b1ceef height=1></td></tr>
		<tr height=20><td background="images/shadow_bg.jpg"></td></tr>
	</table>


		<form action="flowerAdd.action" method="post" enctype="multipart/form-data">
			名称:<input type="text" name="flower.name" required="required"/><br>
			类别:<select name="flower.category.id" style="width: 160px">
						<s:iterator var="category" value="categories">
							<option value="${category.id}">${category.name}</option>
						</s:iterator>
					</select><br>
			图片:<input type="file" name="photo" size="12" required="required"/><br>
			介绍:<textarea rows="2" cols="18" name="flower.intro" required="required"></textarea><br>
			价格:<input type="text" name="flower.price" required="required" placeholder="请输入数字"/><br>
			库存:<input type="text" name="flower.stock" required="required" placeholder="请输入数字"/><br>
			推荐:<select name="flower.hot" style="width: 160px">
						<option value="0">否</option>
						<option value="1">是</option>
					</select>
					<input type="submit" value="添加">
		</form>

</body>
</html>