<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    
<!--手机菜单 -->
<div id="jtv-mobile-menu">
  <ul>
    <li><a href="index.action">主页</a></li>
    <s:if test="session.username==null">
    <li><a href="registerpage.action">注册 </a></li>
    </s:if>
    <s:if test="session.username==null">
    <li><a href="loginpage.action">登录 </a></li>
    </s:if>
  	 
    <li><a href="#">鲜花品种</a>
      <ul>
      
        <li> <a href="list.action?id=1">浪漫爱情</span></a></li>
       	<li> <a href="list.action?id=2">生日礼物</span></a></li>
       	<li> <a href="list.action?id=3">节日祝福</span></a></li>
       	<li> <a href="list.action?id=4">慰问探望</span></a></li>
       	<li> <a href="list.action?id=5">致谢致歉</span></a></li>
       	<li> <a href="list.action?id=6">婚礼庆典</span></a></li>
       	<li> <a href="list.action?id=7">商务用花</span></a></li>
       	<li> <a href="list.action?id=8">家居生活</span></a></li>
       	<li> <a href="list.action?id=9">盆栽绿植</span></a></li>
	  </ul>
	</li>
	<s:if test="session.username!=null">
	<li><a href="my.action">修改个人资料</a></li>
	 </s:if>
	<s:if test="session.username!=null">
    <li><a href="order.action">历史订单</a></li>
     </s:if>
    <s:if test="session.username!=null">
    <li><a href="logout.action">退出</a></li>
     </s:if>
 
</div>
<div id="page"> 
 <!-- Header -->
  <header>
    <div class="header-container">
      <div class="header-top">
        <div class="container">
          <div class="row"> 
            <!-- Header Language -->
            <div class="col-xs-12 col-sm-6">
              <div class="welcome-msg hidden-xs">Welcome to Petunia! </div>
            </div>
            <div class="col-xs-6 hidden-xs"> 
              <!-- Header Top Links -->
              <div class="jtv-top-links">
                <div class="links">
                  <ul>
                  	 <s:if test="session.username==null">
                    <li> <a title="Checkout" href="registerpage.action"><span class="hidden-xs">注册</span></a> </li>
                    </s:if>
                    <s:if test="session.username!=null">
                    <li>
                      <div class="dropdown block-company-wrapper hidden-xs"> <a role="button" data-toggle="dropdown" data-target="#" class="block-company dropdown-toggle" href="#"> 我的 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                          <li><a href="my.action"> 修改个人信息 </a> </li>
                          <li><a href="order.action" > 历史订单 </a> </li>
                        </ul>
                      </div>
                    </li>
                    </s:if>
                    <s:if test="session.username==null">
                    <li> <a href="loginpage.action" ><span class="hidden-xs">登录</span></a> </li>
                    </s:if>
                    <s:if test="session.username!=null">
                    <li> <a href="logout.action"><span class="hidden-xs">退出</span></a> </li>
                    </s:if>
                  </ul>
                </div>
              </div>
              <!-- End Header Top Links --> 
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
            <div class="jtv-top-cart-box"> 
              <!-- Top Cart -->
              <s:if test="session.username!=null && session.total_count!=null && session.total_count>0">
              <div class="mini-cart">
                <div data-toggle="dropdown" data-hover="dropdown" class="basket dropdown-toggle" > 
                <a  href="" > <span class="cart_count">${total_count }</span><span class="price">购物车 / ￥${total_price }</span> </a> </div>
                <div>
               
                  <div class="jtv-top-cart-content" > 
                    
                    <!--block-subtitle-->
                    <ul class="mini-products-list" id="cart-sidebar">
                    <s:iterator value="#request.orders">
                      <li class="item">
                        <div class="item-inner"> <a class="product-image" title="Product Title Here" href="intro.action?id=<s:property value="flower.id"/>"><img alt="Product Title Here" src="../<s:property value="flower.photo"/>"> </a>
                          <div class="product-details">
                            <div class="access"><a class="jtv-btn-remove" title="Remove This Item" href="shopcartDelete.action?id=<s:property value="id"/>">Remove</a>  </div>
                            <p class="product-name"><a href="intro.action?id=<s:property value="flower.id"/>"><s:property value="flower.name"/></a> </p>
                            <strong><s:property value="total"/></strong> x <span class="price">$<s:property value="flower.price"/></span> </div>
                           
                        </div>
                      </li>
                      </s:iterator>
                    </ul>
                     
                    <!--actions-->
                    <div class="actions">
                      <a href="orderAdd.action" class="view-cart"><span>支付</span></a> 
                    </div>
                  </div>
                </div>
              </div>
              </s:if>
            </div>
          </div>
          <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 jtv-logo-box"> 
            <!-- Header Logo -->
            <div class="logo"> <a title="eCommerce" href="index.action"><img alt="eCommerce" src="images/logo.png"> </a> </div>
            <!-- End Header Logo --> 
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- end header --> 
  <!-- Navigation -->
  
  <nav>
    <div class="container">
      <div class="mm-toggle-wrap">
        <div class="mm-toggle"><i class="fa fa-align-justify"></i><span class="mm-label">Menu</span> </div>
      </div>
      <div class="nav-inner"> 
        <!-- BEGIN NAV -->
        <ul id="nav" class="hidden-xs">
          <li class="drop-menu"><a href="index.action" class="level-top active"><span>主页</span></a></li>
         <s:iterator value="#request.navigations">
          <li class="nav-custom-link mega-menu"> <a href="list.action?id=<s:property value="id"/>" class="level-top"> <span><s:property value="name"/></span> </a>
            <div class="jtv-menu-block-wrapper custom-menu" >
              <div class="header-nav-dropdown-wrapper" style="margin:0 auto">
              	<s:iterator value="flowers">
                <div class="jtv-custom-box">
                  <h4 class="heading" onclick="location='intro.action?id=<s:property value="id"/>'"><s:property value="name"/></h4>
                </div>
               </s:iterator>
              </div>
            </div>
          </li>
          </s:iterator>
        </ul>
      </div>
    </div>
  </nav>
  <!-- end nav --> 
  
</body>
</html>
