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

	<div id="slider"> 
    
    <!--
	#################################
		- 轮播图 -
	#################################
	-->
    <div class="tp-banner-container">
      <div class="tp-banner" >
        <ul>
          <li id="slide1" data-transition="3dcurtain-vertical" data-slotamount="7" data-masterspeed="500"  data-thumb="images/slider/slide1.jpg" data-title="Second Slide"> 
            <!-- MAIN IMAGE --> 
            <img src="images/dummy.png"  alt="laptopmockup_sliderdy" data-lazyload="images/slider/slide1.jpg" data-bgposition="right bottom" data-kenburns="on" data-duration="12000" data-ease="Power0.easeInOut" data-bgfit="115" data-bgfitend="100" data-bgpositionend="center top"> 
            <!-- LAYERS --> 
            
            <!-- LAYER NR. 1 -->
            <div class="tp-caption text1 skewfromrightshort fadeout"
			data-x="380"
			data-y="150" 
			data-speed="800"
			data-start="1000"
			data-easing="Power3.easeInOut"
			data-splitin="words"
			data-splitout="none"
			data-elementdelay="0.1"
			data-endelementdelay="0.1"
			data-endspeed="300"
			style="z-index: 3; white-space: nowrap;">Flowers</div>
            
            <!-- LAYER NR. 2 -->
            <div class="tp-caption text2 skewfromrightshort fadeout"
			data-x="380"
			data-y="250" 
			data-speed="500"
			data-start="1500"
			data-easing="Power3.easeInOut"
			data-splitin="chars"
			data-splitout="none"
			data-elementdelay="0.1"
			data-endelementdelay="0.1"
			data-endspeed="300"
			style="z-index: 4; white-space: nowrap;">弄花人欲醉，<br>余香引蝶飞，<br>
              </div>
            
          <!-- SLIDE  -->
          <li id="slide2" data-transition="3dcurtain-vertical" data-slotamount="7" data-masterspeed="500" data-thumb="images/slider/slide2.jpg"  data-title="First Slide"> 
            <!-- MAIN IMAGE --> 
            <img src="images/dummy.png"  alt="laptopmockup_sliderdy" data-lazyload="images/slider/slide2.jpg" data-bgposition="right top" data-kenburns="on" data-duration="12000" data-ease="Power0.easeInOut" data-bgfit="115" data-bgfitend="100" data-bgpositionend="center bottom"> 
            <!-- LAYERS --> 
            
            <!-- LAYER NR. 1 -->
            <div class="tp-caption text5 skewfromrightshort fadeout"
			data-x="1080"
			data-y="150" 
			data-speed="800"
			data-start="1000"
			data-easing="Power3.easeInOut"
			data-splitin="words"
			data-splitout="none"
			data-elementdelay="0.1"
			data-endelementdelay="0.1"
			data-endspeed="300"
			style="z-index: 3; white-space: nowrap;">一份特别的 </div>
            
            <!-- LAYER NR. 2 -->
            <div class="tp-caption text4 skewfromleftshort fadeout"
			data-x="1110"
			data-y="230" 
			data-speed="500"
			data-start="1500"
			data-easing="Power3.easeInOut"
			data-splitin="chars"
			data-splitout="none"
			data-elementdelay="0.1"
			data-endelementdelay="0.1"
			data-endspeed="300"
			style="z-index: 4; white-space: nowrap;">花束</div>
            
            <!-- LAYER NR. 3 -->
            <div class="tp-caption text2 skewfromrightshort fadeout"
			data-x="1050"
			data-y="350" 
			data-speed="1000"
			data-start="4200"
			data-easing="Power3.easeInOut"
			data-splitin="none"
			data-splitout="none"
			data-elementdelay="0.1"
			data-endelementdelay="0.1"
			data-endspeed="300"
			style="z-index: 5; white-space: nowrap;">装饰的最佳选择</div>
          </li>
          
          <!-- SLIDE  -->
          <li id="slide3" data-transition="3dcurtain-vertical" data-slotamount="7" data-masterspeed="500" data-thumb="images/slider/slide3.jpg"  data-title="Third Slide"> 
            <!-- MAIN IMAGE --> 
            <img src="images/dummy.png"  alt="laptopmockup_sliderdy" data-lazyload="images/slider/slide3.jpg" data-bgposition="right top" data-kenburns="on" data-duration="12000" data-ease="Power0.easeInOut" data-bgfit="115" data-bgfitend="100" data-bgpositionend="left center"> 
            <!-- LAYERS --> 
            
            <!-- LAYER NR. 1 -->
            <div class="tp-caption text7 skewfromrightshort fadeout"
			data-x="650"
			data-y="150" 
			data-speed="800"
			data-start="1000"
			data-easing="Power3.easeInOut"
			data-splitin="words"
			data-splitout="none"
			data-elementdelay="0.1"
			data-endelementdelay="0.1"
			data-endspeed="300"
			style="z-index: 3; white-space: nowrap;">花调坊</div>
            
            <!-- LAYER NR. 2 -->
            <div class="tp-caption text5 skewfromleftshort fadeout"
			data-x="610"
			data-y="280" 
			data-speed="500"
			data-start="1500"
			data-easing="Power3.easeInOut"
			data-splitin="chars"
			data-splitout="none"
			data-elementdelay="0.1"
			data-endelementdelay="0.1"
			data-endspeed="300"
			style="z-index: 4; white-space: nowrap;">每天都是情人节</div>
            
            <!-- LAYER NR. 3 -->
            <div class="tp-caption text6 skewfromrightshort fadeout"
			data-x="740"
			data-y="390" 
			data-speed="1000"
			data-start="3500"
			data-easing="Power3.easeInOut"
			data-splitin="none"
			data-splitout="none"
			data-elementdelay="0.1"
			data-endelementdelay="0.1"
			data-endspeed="300"
			style="z-index: 5; white-space: nowrap;">爱是给予.爱是铭记.</div>
          </li>
        </ul>
        <!--          <div class="tp-bannertimer"></div>
--> </div>
    </div>
  </div>
  <!-- jtv bottom banner section -->
  <div class="jtv-bottom-banner-section">
    <div class="container">
      <div class="row">
        <div class="col-sm-4">
          <div class="jtv-img-box">  <img src="images/jtv-banner1.jpg" alt="bottom banner">
            <div class="jtv-banner-info"> <span>特殊的礼物</span>
              <h3>生日花朵</h3>
            </div>
            </a> </div>
        </div>
        <div class="col-sm-4">
          <div class="jtv-img-box"> <img src="images/jtv-banner2.jpg" alt="bottom banner">
            <div class="jtv-banner-info"> <span>爱的典藏</span>
              <h3>婚礼鲜花</h3>
            </div>
            </a> </div>
        </div>
        <div class="col-sm-4">
          <div class="jtv-img-box">  <img src="images/jtv-banner3.jpg" alt="bottom banner">
            <div class="jtv-banner-info"> <span>只为伊人笑</span>
              <h3>诗情花艺</h3>
            </div>
            </a> </div>
        </div>
      </div>
    </div>
  </div>
	<section class="special-products">
    <div class="container">
      <div class="slider-items-products">
        <div class="jtv-special-block">
          <div class="jtv-block-inner">
            <div class="block-title">
              <h2>热销花束</h2>
            </div>
            <div class="jtv-decs-text">野菊花绿色的茎又细又长。茎上的叶子很特别，好似一把绿色的小锯子，它好像是由一位能工巧匠精心雕刻出来的。茎的顶上总是托着一朵或几朵小黄花。花蕊是椭圆形的，黄里带点儿绿色。细细长长的花瓣均匀地围在花蕊周围。每当花苞开放，一股浓郁的清香顿时散发出来。</div>
            <div class="jtv-box-timer">
              <div class="countbox_1 timer-grid"></div>
            </div>
          </div>
          <div id="special-slider" classa="product-flexslider hidden-buttons">
            <div class="slider-items slider-width-col4 products-grid block-content">
            <s:iterator value="#request.flowers">
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
              </div>
              </s:iterator>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
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
<script>
				jQuery(document).ready(function() {
				
					
								
					jQuery('.tp-banner').show().revolution(
					{
						dottedOverlay:"none",
						delay:16000,
						startwidth:1920,
						startheight:600,
						hideThumbs:200,
						
						thumbWidth:100,
						thumbHeight:50,
						thumbAmount:5,
						
						navigationType:"none",
						navigationArrows:"solo",
						navigationStyle:"none",
						
						touchenabled:"on",
						onHoverStop:"on",
						
						swipe_velocity: 0.7,
						swipe_min_touches: 1,
						swipe_max_touches: 1,
						drag_block_vertical: false,
												
						parallax:"mouse",
						parallaxBgFreeze:"on",
						parallaxLevels:[7,4,3,2,5,4,3,2,1,0],
												
						keyboardNavigation:"off",
						
						navigationHAlign:"center",
						navigationVAlign:"bottom",
						navigationHOffset:0,
						navigationVOffset:20,

						soloArrowLeftHalign:"left",
						soloArrowLeftValign:"center",
						soloArrowLeftHOffset:20,
						soloArrowLeftVOffset:0,

						soloArrowRightHalign:"right",
						soloArrowRightValign:"center",
						soloArrowRightHOffset:20,
						soloArrowRightVOffset:0,
								
						shadow:0,
						fullWidth:"on",
						fullScreen:"off",

						spinner:"none",
						
						stopLoop:"off",
						stopAfterLoops:-1,
						stopAtSlide:-1,

						shuffle:"off",
						
						autoHeight:"off",						
						forceFullWidth:"off",						
												
						hideTimerBar:"on",												
						hideThumbsOnMobile:"off",
						hideNavDelayOnMobile:1500,						
						hideBulletsOnMobile:"off",
						hideArrowsOnMobile:"off",
						hideThumbsUnderResolution:0,
						
						hideSliderAtLimit:0,
						hideCaptionAtLimit:0,
						hideAllCaptionAtLilmit:0,
						startWithSlide:0,
						videoJsPath:"rs-plugin/videojs/",
						fullScreenOffsetContainer: ""	
					});
					
					
         snowFall.snow(document.getElementById("slider"), {image : "images/flake.png", minSize: 1, maxSize:12});
                   
					

				});	//ready
				
			</script><!-- Hot Deals Timer 1--> 
			<script>
var dthen1 = new Date();
start = "04/30/18 00:00:00 AM";
start_date = Date.parse(start);
var dnow1 = new Date(start_date);
if (CountStepper > 0)
ddiff = new Date((dnow1) - (dthen1));
else
ddiff = new Date((dthen1) - (dnow1));
gsecs1 = Math.floor(ddiff.valueOf() / 1000);

var iid1 = "countbox_1";
CountBack_slider(gsecs1, "countbox_1", 1);
</script>

</script>
</body>
</html>
