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
	  <!-- Breadcrumbs -->
  <div class="breadcrumbs">
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <ul>
            <li class="home"> <a href="index.action" title="Go to Home Page">主页</a> <span>/</span> </li>
             <li> <a href="shop_grid.html" title="">${flower.category.name}</a> <span>/</span> </li>
            <li> <strong>${flower.name}</strong> </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  
   <!-- Main Container -->
  <section class="main-container col1-layout">
    <div class="main">
      <div class="container">
        <div class="row">
          <div class="col-main">
            <div class="product-view">
              <div class="product-essential">
                <form action="shopcartAddByNum.action" method="post" id="product">
                  <div class="product-img-box col-lg-5 col-sm-6 col-xs-12">
                    <div class="product-image">
                      <div class="product-full"> <img id="product-zoom" src="../${flower.photo}" data-zoom-image="images/products/img02.jpg" alt="product-image"> </div>
                      </div>
                    </div>
                    <!-- end: more-images --> 
                  <div class="product-shop col-lg-7 col-sm-6 col-xs-12">
                    <div class="product-name">
                      <h1>${flower.name}</h1>
                    </div>
                    
                    <div class="price-block">
                      <div class="price-box">
                        <p class="special-price"> <span id="product-price-48" class="price"> ￥${flower.price} </span> </p>
                      </div>
                    </div>
                    <div class="info-orther">
                      <p>库存: <span class="in-stock">${flower.stock}</span></p>
                    </div>
                    <div class="short-description">
                      <h2>描述</h2>
                      <p>产品描述:${flower.intro} </p>
                    </div>
                    <div class="form-option">
                      <p class="form-option-title">可选项:</p>
                      <div class="add-to-box">
                        <div class="add-to-cart">
                          <div class="pull-left">
                            <div class="custom pull-left">
                              <label>数量 :</label>
                              <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 0 ) result.value--;return false;" class="reduced items-count" type="button"><i class="fa fa-minus">&nbsp;</i></button>
                              <input type="text" class="input-text qty" title="Qty" value="1" maxlength="12" id="qty" name="qty">
                              <input type="hidden" value="${flower.id}"  name="flowerid">
                              <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;" class="increase items-count" type="button"><i class="fa fa-plus">&nbsp;</i></button>
                            </div>
                          </div>
                          <button type="submit" class="button btn-cart" title="Add to Cart"><span>加入购物车</span></button>
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Main Container End --> 
	<!-- Related Products Slider -->
  
  <div class="container">
    <div class="related-section">
      <div class="slider-items-products">
        <div class="related-block">
          <div class="jtv-block-inner">
            <div class="block-title">
              <h2>猜你喜欢</h2>
            </div>
          </div>
          <div id="related-products-slider" class="product-flexslider hidden-buttons">
            <div class="slider-items slider-width-col4 products-grid block-content">
            <s:iterator value="#request.likeFlowers">
              <div class="item">
                <div class="item-inner">
                  <div class="item-img">
                    <div class="item-img-info"> <a class="product-image" title="Product Title Here" href="intro.action?id=<s:property value="id"/>"> <img alt="Product Title Here" src="../<s:property value="photo"/>"> </a>
                     
                    </div>
                  </div>
                  <div class="item-info">
                    <div class="info-inner">
                      <div class="item-title"> <a title="Product Title Here" href="intro.action?id=<s:property value="id"/>"> <s:property value="name"/> </a> </div>
                      <div class="item-content">
                        <div class="rating"> </div>
                        <div class="item-price">
                          <div class="price-box"> <span class="regular-price"> <span class="price">$<s:property value="price"/></span> </span> </div>
                        </div>
                        <div class="action">
                          <button class="button btn-cart" type="button" title="" data-original-title="Add to Cart"><span>加入购物车</span> </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              </s:iterator>
             
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Related Products Slider End --> 
	<jsp:include page="footer.jsp"/>
<!-- jquery js --> 
<script src="js/jquery.min.js"></script> 

<!-- bootstrap js --> 
<script src="js/bootstrap.min.js"></script> 

<!-- jquery-ui js --> 
<script src="js/jquery-ui.js"></script> 
<!-- owl.carousel.min js --> 
<script src="js/owl.carousel.min.js"></script> 

<!-- jtv-jtv-mobile-menu js --> 
<script src="js/jtv-mobile-menu.js"></script> 

<!-- countdown js --> 
<script src="js/countdown.js"></script> 

<!-- main js --> 
<script src="js/main.js"></script>
</body>
</html>
