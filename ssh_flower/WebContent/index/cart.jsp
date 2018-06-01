<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<s:if test="session.username!=null && session.total_count!=null && session.total_count>0">
<div class="cart">
	<div class="home_cart_content">
		用户：${username}  | 商品：${total_count }  | 总价：￥${total_price }
	</div>
	<div class="cart_title">
		<a href="cart.action"><img src="images/cart.gif" alt="购物车"/></a>
	</div>
</div>
</s:if>
