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


		<form action="flowerByCategory.action">
			<select name="categoryid" style="width:100px">
				<option value="0">全部</option>
				<s:iterator value="#request.categories">
					<option value=<s:property value="id"/> <s:if test="id==categoryid">selected="selected"</s:if>>
						<s:property value="name"/>
					</option>
				</s:iterator>
			</select><input type="submit" value="按类别查询">
		</form><br>

		<table border="1" class="listtable">
			<tr>
				<th>编号</th><th>名称</th><th>图片</th><th>类别</th><th>介绍</th><th>价格</th><th>库存</th><th>推荐</th><th>操作</th>
			</tr>
			<!-- 用struts的iterator标签遍历集合 -->
			<s:iterator value="#request.flowers">
	          	<tr>
	          		<td><s:property value="id"/></td>
	          		<td><a href="../index/intro.action?flower.id=<s:property value="id"/>" target="_blank"><s:property value="name"/></a></td>
	          		<td><a href="../index/intro.action?flower.id=<s:property value="id"/>" target="_blank"><img src="../<s:property value="photo"/>" width="80" height="70"/></a></td>
	          		<td><s:property value="category.name"/></td>
	          		<td><s:property value="intro"/></td>
	          		<td><s:property value="price"/></td>
	          		<td><a href="RepertoryFlowerList.action?id=<s:property value="id"/>"><s:property value="stock"/></a></td>
	          		<td><s:if test="hot==1">是</s:if><s:else>否</s:else></td>
	          		<td><a href="flowerUpdatepage.action?flower.id=<s:property value="id"/>">修改</a>
	          			<a href="flowerDelete.action?flower.id=<s:property value="id"/>">删除</a></td>
	        	</tr>
	        </s:iterator>
		</table>

</body>
</html>