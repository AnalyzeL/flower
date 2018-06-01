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
		<tr height=28><td background="images/title_bg1.jpg">当前位置 &raquo; 掌柜管理</td></tr>
		<tr><td bgcolor=#b1ceef height=1></td></tr>
		<tr height=20><td background="images/shadow_bg.jpg"></td></tr>
	</table>


		<table border="1" class="listtable">
			<tr>
				<th>编号</th><th>用户名</th><th>密码</th><th>操作</th>
			</tr>
			<!-- 用struts的iterator标签遍历集合 -->
			<s:iterator value="#request.managers">
	          	<tr>
	          		<td><s:property value="id"/></td>
	          		<td><s:property value="username"/></td>
	          		<td><s:property value="password"/></td>
	          		<td>
		          		<s:if test="id==1">系统保护用户</s:if>
		          		<s:else>
		          			<a href="managerUpdatepage.action?manager.id=<s:property value="id"/>">修改</a>
		          			<a href="managerDelete.action?manager.id=<s:property value="id"/>">删除</a>
	          			</s:else>
	          		</td>
	        	</tr>
	        </s:iterator>
	        
		</table>

</body>
</html>