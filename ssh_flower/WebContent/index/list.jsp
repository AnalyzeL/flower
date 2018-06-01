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
            <li> <strong>${categorie.name}</strong> </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- Breadcrumbs End --> 
	 <!-- Main Container -->
  <section class="main-container col2-left-layout">
    <div class="container">
      <div class="row">
        <div class="col-sm-9 col-xs-12 col-sm-push-3">
          <div class="category-description std">
            <div class="slider-items-products">
              <div id="category-desc-slider" class="product-flexslider hidden-buttons">
                <div class="slider-items slider-width-col1 owl-carousel owl-theme"> 
                  
                  <!-- Item -->
                  <div class="item"> <a href="#"><img alt="" src="images/category-img1.jpg"></a>
                    <div class="cat-img-title cat-bg cat-box">
                      <div class="small-tag">Flowers 2018</div>
                      <h2 class="cat-heading">特殊的礼物</h2>
                      <p>给特殊的你. </p>
                    </div>
                  </div>
                  <!-- End Item --> 
                  
                  <!-- Item -->
                  <div class="item"> <a href="#"><img alt="" src="images/category-img2.jpg"></a>
                    <div class="cat-img-title cat-bg cat-box">
                      <div class="small-tag">Flowers 2018</div>
                      <h2 class="cat-heading">特殊的礼物</h2>
                      <p>给特殊的你. </p>
                    </div>
                    <!-- End Item --> 
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <article class="col-main">
            <h2 class="page-heading"> <span class="page-heading-title">${categorie.name}</span> </h2>
           
            <div class="category-products">
              <ul class="products-grid">
              <s:iterator value="#request.flowers">
                <li class="item col-lg-4 col-md-4 col-sm-4 col-xs-6">
               
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
                            <button class="button btn-cart" type="button" title="" data-original-title="Add to Cart" onclick="location='shopcartAdd.action?flowerid=<s:property value="id"/>'"><span>加入购物车</span> </button>
                          </div>
                        </div>
                      </div>
                    </div>
                   
                  </div>
                </li>
                 </s:iterator>
              </ul> 
            </div>    
          </article>
          <!--	///*///======    End article  ========= //*/// --> 
        </div>
        <div class="sidebar col-sm-3 col-xs-12 col-sm-pull-9">
          <aside class="sidebar">
           
            
            <div class="custom-slider">
              <div>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                    <li class="active" data-target="#carousel-example-generic" data-slide-to="0"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                  </ol>
                  <div class="carousel-inner">
                    <div class="item active"><img src="images/slide3.jpg" alt="slide3">
                      <div class="carousel-caption">
                        <h3><a title=" Sample Product" href="#">特别的礼物</a></h3>
                        <p>给特别的你.</p>
                        <a class="link" href="#">Shop Now</a></div>
                    </div>
                    <div class="item"><img src="images/slide1.jpg" alt="slide1">
                      <div class="carousel-caption">
                        <h3><a title=" Sample Product" href="#">特别的礼物</a></h3>
                        <p>给特别的你.</p>
                      </div>
                    </div>
                    <div class="item"><img src="images/slide2.jpg" alt="slide2">
                      <div class="carousel-caption">
                        <h3><a title=" Sample Product" href="#">特别的礼物</a></h3>
                        <p>给特别的你.</p>
                      </div>
                    </div>
                  </div>
                  <a class="left carousel-control" href="#" data-slide="prev"> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#" data-slide="next"> <span class="sr-only">Next</span> </a></div>
              </div>
            </div>
             <s:if test="session.username!=null && session.total_count!=null && session.total_count>0">
            <div class="block block-cart">
                <div class="block-title ">我的购物车</div>
                <div class="block-content">
                  <div class="summary">
                    <p class="amount">在你的购物里有${total_count}样东西.</p>
                    <p class="subtotal"> <span class="label">共计:</span> <span class="price">${total_price }元</span> </p>
                  </div>
                  <div class="ajax-checkout">
                    <button class="button button-checkout" title="Submit" type="submit" onclick="location.href='orderAdd.action'"><span>支付</span></button>
                  </div>
                  <p class="block-subtitle">最近添加 </p>
                  <ul>
                  <s:iterator value="#request.orders">
                    <li class="item"> <a href="intro.action?id=<s:property value="flower.id"/>" title="Product Title Here" class="product-image"><img src="../<s:property value="flower.photo"/>" alt="Product Title Here"></a>
                      <div class="product-details">
                        <div class="access"> <a href="shopcartDelete.action?id=<s:property value="id"/>" title="Remove This Item" class="jtv-btn-remove"> <span class="icon"></span> Remove </a> </div>
                        <strong><s:property value="total"/></strong> x <span class="price">$<s:property value="flower.price"/></span>
                        <p class="product-name"> <a href="intro.action?id=<s:property value="flower.id"/>"><s:property value="flower.name"/></a> </p>
                      </div>
                    </li>
                     </s:iterator>
                  </ul>
                </div>
              </div>
			</s:if>
          </aside>
        </div>
      </div>
    </div>
  </section>
  <!-- Main Container End --> 
	
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
