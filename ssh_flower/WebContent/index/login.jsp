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
            <font color=red style="font-size:30px">${msg}</font>
              <form name="login" action="login.action" method="post">
                  
                  <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control" id="username"   name="customer.username">
                  </div>
                  
                  <div class="form-group">
                    <label for="Password">密码</label>
                    <input type="password" class="form-control" id="Password"  name="customer.password">
                  </div>
                 
                  
                  <button type="submit" class="btn btn-default">登录</button>
                   <div class="form_row">还没有帐号? <a href="register.jsp">点击注册</a></div>   
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
