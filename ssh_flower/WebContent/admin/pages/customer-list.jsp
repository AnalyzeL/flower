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


		<table border="1" class="listtable" style="text-align:right">
			<tr>
				<th>编号</th><th>用户名</th><th>密码</th>
				<th>电话</th><th>地址</th><th>消费总额</th><th>用户分类</th><th>操作</th>
			</tr>
			<!-- 用struts的iterator标签遍历集合 -->
			<s:iterator value="#request.customerAlls">
	          	<tr>
	          		<td><s:property value="customer.id"/></td>
	          		<td><s:property value="customer.username"/></td>
	          		<td><s:property value="customer.password"/></td>
	          		<td><s:property value="customer.phone"/></td>
	          		<td><s:property value="customer.address"/></td>
	          		<td><s:property value="consumption"/></td>
	          		<td><s:property value="userclassname"/></td>
	          		<td><a href="customerUpdatepage.action?customer.id=<s:property value="customer.id"/>">修改</a>
	          			<a href="customerDelete.action?customer.id=<s:property value="customer.id"/>">删除</a></td>
	        	</tr>
	        </s:iterator>
	        
		</table>

</body>
</html>