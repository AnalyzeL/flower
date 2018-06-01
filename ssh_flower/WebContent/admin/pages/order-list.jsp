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
		<tr height=28><td background="images/title_bg1.jpg">当前位置 &raquo; 订单管理</td></tr>
		<tr><td bgcolor=#b1ceef height=1></td></tr>
		<tr height=20><td background="images/shadow_bg.jpg"></td></tr>
	</table>

	<table><tr><td>	
		<form action="orderByFlower.action">
			<select name="flowerid" style="width:100px">
				<option value="0">全部</option>
				<s:iterator value="#request.flowers">
					<option value=<s:property value="id"/> <s:if test="id==flowerid">selected="selected"</s:if>>
						<s:property value="name"/>
					</option>
				</s:iterator>
			</select><input type="submit" value="按商品查询">
		</form></td><td>	
		
		<form action="orderByCustomer.action">
			<select name="customerid" style="width:100px">
				<option value="0">全部</option>
				<s:iterator value="#request.customers">
					<option value=<s:property value="id"/> <s:if test="id==customerid">selected="selected"</s:if>>
						<s:property value="username"/>
					</option>
				</s:iterator>
			</select><input type="submit" value="按顾客查询">
		</form></td></tr>
		
	</table><br>
	
		<table border="1" class="listtable">
			<tr>
				<th>订单号</th><th>商品名</th><th>数量</th><th>顾客</th><th>联系电话</th><th>发货地址</th><th>发货状态</th><th>操作</th>
			</tr>
			<!-- 用struts的iterator标签遍历集合 -->
			<s:iterator value="#request.orders">
	          	<tr>
	          		<td><s:property value="id"/></td>
	          		<td><a href="../index/intro.action?flower.id=<s:property value="flower.id"/>" target="_blank"><s:property value="flower.name"/></a></td>
	          		<td><s:property value="total"/></td>
	          		<td><s:property value="customer.username"/></td>
	          		<td><s:property value="customer.phone"/></td>
	          		<td><s:property value="customer.address"/></td>
	          		<td>未发</td>
	          		<!--<a href="orderDispose.action?id=<s:property value="id"/>&flowerid=<s:property value="flower.id"/>">发货</a>&nbsp  -->
	          		<td><a href="Logisticschose.action?id=<s:property value="id"/>&flowerid=<s:property value="flower.id"/>">发货</a>&nbsp;
	          				<a href="orderRemove.action?id=<s:property value="id"/>">删除</a></td>
	        	</tr>
	        </s:iterator>
	        
		</table><br><br>

</body>
</html>