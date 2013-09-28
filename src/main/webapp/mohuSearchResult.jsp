<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>推荐匹配</title>
<%@include file="WEB-INF/inc/globalScript.jsp" %>
<script type="text/javascript" src="Scripts/ScrollPic.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	$("#pop_city").click(function(){
		tipsWindown("您可以选择以下地区：","iframe:iframe:pop_city.html","500","200","true","","false","text","");
	});
	$("#pop_question").click(function(){
		tipsWindown("我要提问：","iframe:iframe:pop_question.html","550","465","true","","false","text","");
	});
	
	});	
	
	setTimeout('_magicTimeout()',20*1000);
    function _magicTimeout(){
	   $('.time_box').hide();
    }	
</script>
</head>

<body>
<%@include file="WEB-INF/inc/globalHeader.jsp" %>
<div class="Fuzzysearch">
	<div class="top Fuzzysearch1">
    	<div class="main3 padding-bt ground">
  <div class="credit_title"> 
    <span class="credit_title1 font_f Fuzzysearch2">不知道自己的贷款需求？看看同地区同行业的人选择什么产品</span>
  </div>
  <div class="Fuzzysearch3">
  	<div class="Fuzzysearch4 ClearFix"><h1>请选择您的地区:</h1><p><a href="#">北京</a><a href="#">上海</a><a href="#">黑龙江</a><a href="#">乌鲁木齐</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">秦皇岛</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a></p></div>
  	<div class="Fuzzysearch5"><a href="#"><img src="images/img4.jpg" width="109" height="29" /></a></div>
    </div>
</div>
<div class="main3 ground  Fuzzysearch6">
  <div class="credit_title Fuzzysearch7"> 
    <span class="credit_title1 Fuzzysearch8">根据您的选择，我们向您推荐该地区行业的<em>8</em>款团购贷款产品</span>
  </div>
  
  <div class=blk_29>
<div class=LeftBotton id=LeftArr></div>
<div class=Cont id=ISL_Cont_1><!-- 图片列表 begin -->
<div class=box><A class="imgBorder" href="#" target=_blank><img src="images/img6.jpg" width="130" height="79" /></A> </div>
<div class=box><A class="imgBorder" href="#" target=_blank><img src="images/img9.jpg" width="130" height="79" /></A> </div>
<div class=box><A class="imgBorder" href="#" target=_blank><img src="images/img6.jpg" width="130" height="79" /></A> </div>
<div class=box><A class="imgBorder" href="#" target=_blank><img src="images/img6.jpg" width="130" height="79" /></A> </div>
<div class=box><A class="imgBorder" href="#" target=_blank><img src="images/img6.jpg" width="130" height="79" /></A> </div>
<div class=box><A class="imgBorder" href="#" target=_blank><img src="images/img6.jpg" width="130" height="79" /></A> </div>
<div class=box><A class="imgBorder" href="#" target=_blank><img src="images/img6.jpg" width="130" height="79" /></A> </div>
<div class=box><A class="imgBorder" href="#" target=_blank><img src="images/img6.jpg" width="130" height="79" /></A> </div>
<!-- 图片列表 end --></div>

<div class="RightBotton" id="RightArr"></div></div>
<script type="text/javascript">
    window.onload = function(){
      var scrollPic_02 = new ScrollPic();
      scrollPic_02.scrollContId   = "ISL_Cont_1"; //内容容器ID
      scrollPic_02.arrLeftId      = "LeftArr";//左箭头ID
      scrollPic_02.arrRightId     = "RightArr"; //右箭头ID

      scrollPic_02.frameWidth     = 830;//显示框宽度
      scrollPic_02.pageWidth      = 172; //翻页宽度

      scrollPic_02.speed          = 5; //移动速度(单位毫秒，越小越快)
      scrollPic_02.space          = 10; //每次移动像素(单位px，越大越快)
      scrollPic_02.autoPlay       = false; //自动播放
      scrollPic_02.autoPlayTime   = 3; //自动播放间隔时间(秒)

      scrollPic_02.initialize(); //初始化
    }
</script>
  
</div>
<div class="main3 ground  Fuzzysearch6">
  <div class="credit_title"> 
    <span class="credit_title1 font_f">大家都在贷</span>
  </div>
  <div class="Loansearch11 ClearFix">
  	<div class="Loansearch19"><a href="#"><img src="images/img18.jpg" width="94" height="29" /></a></div>
  	<div class="Loansearch12">
    	<div class="Loansearch13">
        	<h1>华夏银行</h1>
            <p><span class="Loansearch14">无需抵押</span><br /><span class="Loansearch14 Loansearch15">上班族可申请</span><br /><span class="Loansearch14 Loansearch16">5天放款</span></p>
        </div>
    	<img src="images/img13.jpg" width="42" height="42" />
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>打卡工资大于4000<br />有职业身份要求<br />对工作年限有要求</p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>利率<br />总利息<span>0.90万元</span><br /></p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p><br />有<span>205</span>人申请<br /></p>
        </div>
    </div>
  </div>
  <%@include file="WEB-INF/inc/productInRow.jsp" %>
</div>
    </div>
</div>

<%@include file="WEB-INF/inc/globalFooterMenu.jsp" %>
<%@include file="WEB-INF/inc/globalFooter.jsp" %>
</body>
</html>
    