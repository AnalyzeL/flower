<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!-- Mobile specific metas  -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon  -->
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">

<!-- CSS Style -->
<link rel="stylesheet" href="style.css">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>花调坊</title>
<meta name="description" content="">
<meta name="keywords" content="">
</head>

<body class="cms-index-index cms-home-page">

	<jsp:include page="header.jsp"/>
<!-- End Bestsell Slider -->
<div style="height:100px;"></div>
  <div class="jtv-testimonial-block">
    <div class="container">
      <div class="row">
        <div class="col-md-12" data-wow-delay="0.2s">
          <div class="block-title col-center-block">
            <h2>${username}的订单</h2>
            <table class="table">
            	<thead>
            		<tr>
            			<th>下单时间</th>
            			<th>订单编号</th>
            			<th>商品名称</th>
            			<th>单价</th>
            			<th>数量</th>
            			<th>总价</th>
            			<th>状态</th>
            		</tr>
            	</thead>
            	<tbody>
            			<!-- 用struts的iterator标签遍历集合 -->
					<s:iterator value="#request.orders1">
			          	<tr>
			          		<td><s:date name="systime"  format="yyyy-MM-dd hh:mm:ss"/></td>
			          		<td><s:property value="id"/></td>
			          		<td><s:property value="flower.name"/></td>
			          		<td><s:property value="flower.price"/></td>
			          		<td><s:property value="total"/></td>
			          		<td><s:property value="flower.price * total"/></td>
			          		<td>
			          			<s:if test="dispose==0"><font style="color:red;">待处理</font></s:if>
			          			<s:if test="dispose==1">已发货</s:if>
			          		</td>
			        	</tr>
			        </s:iterator>
            	</tbody>
			</table>
          </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div style="height:100px;"></div>
	<jsp:include page="footer.jsp"/>
	<!-- jquery js --> 
<script src="js/jquery.min.js"></script> 

<!-- bootstrap js --> 
<script src="js/bootstrap.min.js"></script> 

<!-- owl.carousel.min js --> 
<script src="js/owl.carousel.min.js"></script> 

<!-- jtv-jtv-mobile-menu js --> 
<script src="js/jtv-mobile-menu.js"></script> 

<!-- countdown js --> 
<script src="js/countdown.js"></script> 

<!-- main js --> 
<script src="js/main.js"></script> 

<!-- rev-slider js --> 
<script src="js/rev-slider.js"></script> 
<script src='js/snowfall.min.js'></script> 
<script src='js/index.js'></script>
</body>
</html>
