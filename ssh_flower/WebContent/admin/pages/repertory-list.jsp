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
		<tr height=28><td background="images/title_bg1.jpg">当前位置 &raquo; 虚拟库存</td></tr>
		<tr><td bgcolor=#b1ceef height=1></td></tr>
		<tr height=20><td background="images/shadow_bg.jpg"></td></tr>
	</table>


		<table border="1" class="listtable">
			<tr>
				<th>编号</th><th>线下商店</th><th>鲜花种类</th><th>数量</th>
			</tr>
			<!-- 用struts的iterator标签遍历集合 -->
			<s:iterator value="#request.repertoryReally">
	          	<tr>
	          		<td><s:property value="id"/></td>
	          		<td><s:property value="offlinestoreName"/></td>
	          		<td><s:property value="flowerName"/></td>
	          		<td><s:property value="num"/></td>
	        	</tr>
	        </s:iterator>
	        
		</table>

</body>
</html>