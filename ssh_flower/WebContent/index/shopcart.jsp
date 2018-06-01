<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>购物车</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<jsp:include page="header.jsp"/>

	<div id="content_wrapper">
		<div id="content">
			<div class="content_section">

				<h2>${username}的购物车</h2>

					<table class="table_cart"  cellspacing=0 cellpadding=0 width="100%" border=1>
						<tr>
							<th>商品名称</th><th>单价</th><th>数量</th><th>总价</th><th>操作</th>
						</tr>
						<!-- 用struts的iterator标签遍历集合 -->
						<s:iterator value="#request.orders">
				          	<tr>
				          		<td><s:property value="flower.name"/></td>
				          		<td><s:property value="flower.price"/></td>
				          		<td><s:property value="total"/></td>
				          		<td><s:property value="flower.price * total"/></td>
				          		<td><a href="shopcartDelete.action?id=<s:property value="id"/>">删除</a></td>
				        	</tr>
				        </s:iterator>
				        
					</table>
		
					<input type="button" value="提交订单" onclick="location.href='orderAdd.action'" style="float:right;margin-top:10px;"/>
		
 			</div>
			<div class="cleaner"></div>
		</div>
		<div class="cleaner_h40"></div>
	</div>
	<div class="cleaner"></div>

	<jsp:include page="footer.jsp"/>
	
</body>
</html>
