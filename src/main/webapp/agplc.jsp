<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>代理政策</title>
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
    <li><a href="agrsn.jsp">代理理由</a></li>
    <li><a href="#" class="hover">代理政策</a></li>
    <li><a href="agsup.jsp">代理支持</a></li>
    <li><a href="agprs.jsp">代理流程</a></li>
    <li><a href="agsuc.jsp">成功案例</a></li>
    <li><a href="agfnch.jsp">加盟商</a></li>
  </ul>
</div>
<div class="policy_banner"></div>

<div class="policy_box clear">
  <div class="policy_left float_l">
    <h1>合作模式</h1>
    <p>玖富与代理商本着互利共赢的原则开展合作，即使您无经验无资源，玖富助您轻松做老板！只要经过申请认证，即可加入玖富“向阳花”创业扶持计划，成为玖富“向阳花”代理商的一员。代理流程简单，代理商仅需向玖富推介贷款客户并对客户做后期续贷维护。</p>
    <p>玖富对代理商提供审核风控技术，从前端到后台，全方位助力加盟商开展业务。玖富根据业绩情况向代理商支付对应佣金，并为贷款客户联络合适的资金出借人。</p><br /><br /><br /><br />
    <h1>佣金算例</h1>
    <p>代理商的佣金根据放款额按照比例计算。(可参考右图)</p><br /><br /><br />
    <h1>合作期限</h1>
    <p>“向阳花”计划的首次合约期限为5年，合约期满后如双方无异议，可自动续约5年。
</p>
  </div>
  <div class="policy_right float_r">
    <img src="images/model_img.png" /><img src="images/algorithm.png" width="430" height="126" /> 
    <p>算一下营业成本，你就知道，你能赚多少！</p>
  </div>
</div>

<div class="agent_reason_foot"></div><div class="agent_reason_btn"><input name="" type="button" value=""  onclick="location.href='agprs.jsp'"  /></div>

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
