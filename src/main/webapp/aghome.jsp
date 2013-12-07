<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>代理商</title>
<link href="cssnew/agent.css" type="text/css" rel="stylesheet" />
<link href="cssnew/tipswindown.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/tipswindown.js"></script>
<script language="javascript" src="Scripts/scroll.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	$("#agent_city").click(function(){
		tipsWindown("您可以选择以下地区：","iframe:iframe:pop_city.jsp","500","200","true","","false","text","");
	});
	
	});	
	
	setTimeout('_magicTimeout()',20*1000);
    function _magicTimeout(){
	   $('.time_box').hide();
    }	
</script>
</head>

<body>
<div class="agent_top">
  <div class="agent_logo float_l"><a href="index.html"><img src="images/logo.jpg" width="93" height="56" /></a></div>
  <div class="agent_ad_box font_f float_l">
    <div class="agent_ad">微金融&nbsp;&nbsp;云平台</div>
    <div class="agent_city"><font>${sessionScope.currentRegion.name}</font><a href="#" id="agent_city">[切换城市]</a></div>
  </div>
  <div class="agent_back float_r"><a href="index.html"><img src="images/back_9f.jpg" width="99" height="56" /></a></div>
</div>
<div class="agent_nav font_f">
  <ul>
    <li><a href="#" class="hover">首页</a></li>
    <li><a href="agrsn.jsp">代理理由</a></li>
    <li><a href="agplc.jsp">代理政策</a></li>
    <li><a href="agsup.jsp">代理支持</a></li>
    <li><a href="agprs.jsp">代理流程</a></li>
    <li><a href="agsuc.jsp">成功案例</a></li>
    <li><a href="agfnch.jsp">加盟商</a></li>
  </ul>
</div>
<div class="agent_banner"></div>
<div class="agent_main">
  <div class="agent_main_left float_l"></div>
  <div class="agent_main_right float_r">
    <div class="agent_main_apply">
      <input name="" type="button" value="" onclick="location.href='agprs.jsp'" />
    </div>
    <div class="agent_main_phone"></div>
    <div class="agent_main_add"> <img src="images/agent_join.jpg" />
      <p><a href="加盟商.html">全国已加盟网点</a></p>
    </div>
  </div>
</div>
<div class="agent_new">
  <div class="agent_new_img float_l"></div>
  <div class="agent_new_content float_l"><b>最新签约代理商：</b><span id="list_con">
    <ul class="list" id="news_list">
      <li><a>北京恒生信业信息技术有限公司成功加入玖富</a></li>
      <li><a>武汉点融信息技术有限公司成功加入玖富</a></li>
      <li><a>郑州市邦融信息技术有限公司成功加入玖富</a></li>
      <li><a>南京捷信文信息技术有限公司成功加入玖富</a></li>
    </ul>
    </span></div>
</div>
<script language="javascript">scrollTitle(3000,50);</script>
<!--<div class="agent_style">
  <div class="agent_style_title font_f">代理商风采</div>
  <div class="agent_style_box">
    <div class="agent_left_arrow"></div>
    <div class="agent_style_content"><a href="#"><img src="images/agent_style1.jpg" width="188" height="187" /></a><a href="#"><img src="images/agent_style2.jpg" width="188" height="187" /></a><a href="#"><img src="images/agent_style3.jpg" width="188" height="187" /></a><a href="#"><img src="images/agent_style4.jpg" width="188" height="187" /></a></div>
    <div class="agent_right_arrow"></div>
  </div>
</div>-->

<div class="agent_style">
  <div class="agent_style_title font_f">代理商风采</div>
  <div class="img-scroll">
    <div class="prev"></div>
    <div class="img-list">
      <ul>
        <li><img src="images/agent_style1.jpg" /></li>
        <li><img src="images/agent_style2.jpg" /></li>
        <li><img src="images/agent_style3.jpg" /></li>
        <li><img src="images/agent_style4.jpg" /></li>
        <li><img src="images/agent_style1.jpg" /></li>
        <li><img src="images/agent_style2.jpg" /></li>
      </ul>
    </div>
    <div class="next"></div>
  </div>
</div>
<script type="text/javascript">
 function DY_scroll(wraper,prev,next,img,speed,or)
 { 
  var wraper = $(wraper);
  var prev = $(prev);
  var next = $(next);
  var img = $(img).find('ul');
  var w = img.find('li').outerWidth(true);
  var s = speed;
  next.click(function()
       {
        img.animate({'margin-left':-w},function()
                  {
                   img.find('li').eq(0).appendTo(img);
                   img.css({'margin-left':0});
                   });
        });
  prev.click(function()
       {
        img.find('li:last').prependTo(img);
        img.css({'margin-left':-w});
        img.animate({'margin-left':0});
        });
  if (or == true)
  {
   ad = setInterval(function() { next.click();},s*300);
   wraper.hover(function(){clearInterval(ad);},function(){ad = setInterval(function() { next.click();},s*400);});

  }
 }
 DY_scroll('.img-scroll','.prev','.next','.img-list',6,true);// true为自动播放，不加此参数或false就默认不自动
</script>

<div class="agent_footer">
  <div class="agent_footer_img">
  	<img src="images/beida.gif" width="121" height="44" />
	<img src="images/itfusc.gif" width="109" height="35" />
	<img src="images/mm.gif" width="84" height="40" />
	<a href="http://www.9floan.com/Content/Help/credit.html" target="_blank"><img src="images/micro.gif" width="174" height="26" /></a>
	<a href="http://www.9floan.com/Content/Help/safe.html" target="_blank"><img src="images/anquan.gif" width="84" height="40" /></a>
	<a href="https://ss.knet.cn/verifyseal.dll?sn=e13091811010042535yjkx000000&comefrom=verify&trustKey=dn&trustValue=www.9fbank.com" target="_blank"><img src="images/kexin.gif" width="109" height="35" /></a>
  </div>
  <div class="agent_footer_font">
	<font>版权所有：北京玖富时代投资顾问有限公司 copyright&copy;2012 京ICP备07003840</font><br />
	技术服务商：北京九富科技有限公司<br />
	公司总部地址：北京朝阳区麦子店街37号盛福大厦2580<br />
	传真：010-85276916&nbsp;&nbsp;&nbsp;&nbsp;邮编：100000
</div>
</div>

</body>
</html>
