<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>代理理由</title>
<link href="cssnew/agent.css" type="text/css" rel="stylesheet" />
<link href="cssnew/tipswindown.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/tipswindown.js"></script>
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
    <li><a href="aghome.jsp">首页</a></li>
    <li><a href="#" class="hover">代理理由</a></li>
    <li><a href="agplc.jsp">代理政策</a></li>
    <li><a href="agsup.jsp">代理支持</a></li>
    <li><a href="agprs.jsp">代理流程</a></li>
    <li><a href="agsuc.jsp">成功案例</a></li>
    <li><a href="agfnch.jsp">加盟商</a></li>
  </ul>
</div>
<div class="agent_reason_banner"></div>
<div class="agent_reason_title font_f">为什么选择创业？</div>
<div class="agent_reason clear mar_t">
  <div class="agent_reason_left float_l"><img src="images/reason_pic1.jpg"/></div>
  <div class="agent_reason_right float_r"><img src="images/reason_font1.jpg" width="224" height="19" /><p>每天忙忙碌碌，只为月底的微薄工资，你是否心有不甘？每次开发客户辛勤沟通，只能拿到微薄的提成，你是否觉得事倍功半？每日奔波花费颇多，还要担心能不能报销，你是否觉得付出的不值得？<br />每月底薪1万，提成1万，何时才能买车买房？</p>
    <p><b>选择加盟，自己做老板，我的收入我做主！</b></p>
  </div>
</div>
<div class="agent_reason_hat clear mar_t">
  <div class="agent_reason_left float_l"><img src="images/reason_pic2.jpg" width="109" height="138" /></div>
  <div class="agent_reason_right float_r"><img src="images/reason_font2.jpg" width="224" height="19" />
    <p>辛勤奋斗数载，到头来还是为他人作嫁衣裳。默默无闻地做着“打工仔”一族，每天处理琐碎的小事，期待着老板给提职加薪，你的成长要看老板的心情！不如一鼓作气，翻身做自己的老板。脱掉“打工者”的帽子，让自己更快的成长。</p>
    <p><font>公司发展由你决定，员工收入由你做主！</font></p>
  </div>
</div>
<div class="agent_reason_mine clear mar_t">
  <div class="agent_reason_left float_l"><img src="images/reason_pic3.jpg" width="109" height="138" /></div>
  <div class="agent_reason_right float_r"><img src="images/reason_font3.jpg" width="205" height="19" />
    <p>作为团队经理、分部经理、区域总监……不论级别多高，总有一些事情需要你的上级审批决定。业绩任务有压力，发放工资不自主、采买设备不自主、上班时间不自主、假期休息不自主、招募团队不自主……受人约束的日子何时休！<br />选择创业，财务权、人事权、各项权力归你所有。不再被动地接受任务，背着业绩的压力诚惶诚恐。</p>
    <p><em>一切业务工作由你掌控，高业绩高收入尽在掌握之中。</em></p>
  </div>
</div>
<div class="agent_reason_boss clear mar_t">
  <div class="agent_reason_left float_l"><img src="images/reason_pic4.jpg" width="109" height="138" /></div>
  <div class="agent_reason_right float_r"><img src="images/reason_font4.jpg" />
    <p>微贷行业是朝阳行业，我们年轻的从业者有着大好的机会，但同时迅速面临行业整顿。如果瞻前顾后，等到行业变规范，蓝海变红海，机会就少了。不去抢占先机，就只能论资排辈等你的上级退休了。</p>
    <p><a>选择创业的方式，借助有力平台，抓住时机，一跃站在行业的前沿！</a></p>
  </div>
</div>

<div class="agent_reason_foot"></div>
<div class="agent_reason_btn"><input name="" type="button" value=""  onclick="location.href='agprs.jsp'"  /></div>


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
	版权所有：北京玖富时代投资顾问有限公司 copyright&copy;2012 京ICP备07003840<br />
	技术服务商：北京九富科技有限公司<br />
	公司总部地址：北京朝阳区麦子店街37号盛福大厦2580<br />
	传真：010-85276916&nbsp;&nbsp;&nbsp;&nbsp;邮编：100000
</div>
</div>



</body>
</html>
