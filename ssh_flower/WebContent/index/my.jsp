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
            修改个人信息<font color=red style="font-size:30px">${msg}</font>
            <h2>基本信息</h2>
              <form name="login" action="updateMy.action" method="post">
                   <div class="form-group">
                   	<input type="hidden" name="customer.username" value="${customer.username}"/>  
                   </div>
                  
                  <div class="form-group">
                    <label for="phone">电话</label>
                    <input type="text" class="form-control" id="phone"  name="customer.phone" value="${customer.phone}">
                  </div>
                  <div class="form-group">
                    <label for="address">地址</label>
                    <input type="text" class="form-control" id="address"  name="customer.address" value="${customer.address}">
                  </div>

                  <button type="submit" class="btn btn-default">保存</button>
                </form>
                <h2>安全信息</h2>
              <form name="login" action="updatePassword.action" method="post">
                   <div class="form-group">
                   	<input type="hidden" name="customer.username" value="${customer.username}"/>  
                   </div>
                  
                  <div class="form-group">
                    <label for="Password">原密码</label>
                    <input type="password" class="form-control" id="Password"  name="customer.password">
                  </div>
                  <div class="form-group">
                    <label for="Password">新密码</label>
                    <input type="password" class="form-control" id="Password"  name="password1">
                  </div>
                  <div class="form-group">
                    <label for="Password">新密码</label>
                    <input type="password" class="form-control" id="Password"  name="password2">
                  </div>

                  <button type="submit" class="btn btn-default">保存</button>
                </form>
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
