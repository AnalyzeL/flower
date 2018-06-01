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


		<form action="flowerUpdate.action" method="post" enctype="multipart/form-data">
					<input type="hidden" name="flower.id" value="${flower.id}">
			名称:<input type="text" name="flower.name" value="${flower.name}" required="required"/><br>
			类别:<select name="flower.category.id" style="width: 160px">
						<s:iterator var="category" value="categories">
							<option value="${category.id}" <s:if test="#category.id==flower.category.id">selected="selected"</s:if>>${category.name}</option>
						</s:iterator>
					</select><br>
			图片:<img src="../${flower.photo}" width="120" height="100"/><br>
					<input type="hidden" name="flower.photo" value="${flower.photo}"/>
			更换:<input type="file" name="photo" size="12"/><br>
			介绍:<textarea rows="2" cols="18" name="flower.intro" required="required">${flower.intro}</textarea><br>
			价格:<input type="text" name="flower.price" value="${flower.price}" required="required" placeholder="请输入数字"/><br>
			库存:<input type="text" name="flower.stock" value="${flower.stock}" required="required" placeholder="请输入数字"/><br>
			推荐:<select name="flower.hot" style="width: 160px">
						<option value="1" <s:if test="flower.hot==1">selected="selected"</s:if>>是</option>
						<option value="0" <s:if test="flower.hot==0">selected="selected"</s:if>>否</option>
					</select>
					<input type="submit" value="修改">
		</form>

</body>
</html>