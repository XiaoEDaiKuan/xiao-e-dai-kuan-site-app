<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>代理支持</title>
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
    <li><a href="agplc.jsp">代理政策</a></li>
    <li><a href="#" class="hover">代理支持</a></li>
    <li><a href="agprs.jsp">代理流程</a></li>
    <li><a href="agsuc.jsp">成功案例</a></li>
    <li><a href="agfnch.jsp">加盟商</a></li>
  </ul>
</div>
<div class="agent_support_banner"></div>
<div class="agent_reason_title font_f"><img src="images/support_title.jpg" width="275" height="42" /></div>

<div class="agent_support clear bg_color">
  <div class="agent_support_left float_l"><img src="images/support_pic1.jpg" width="213" height="178" /></div>
  <div class="agent_support_right float_r">
    <b>资金支持------创业贷款资金在手，无米之炊不再难为</b>
    <p>玖富可提供创业贷款资金，作为代理商新公司的开办费。</p>
    <b>系统支持------共享核心系统，专业助手助力发展</b>
    <p>玖富为代理商提供完整的信用评分技术系统平台和风险管理系统，包括IPC系统、BUS系统、RMS系统等，强大的微金融业务平台，有效降低非系统风险。</p>
  </div>
</div>
<div class="agent_support clear bg_color2">
  <div class="agent_support_left float_l"><img src="images/support_pic2.jpg" width="213" height="146" /></div>
  <div class="agent_support_right float_r">
    <b>培训支持------培训增效提能，专家指导事半功倍</b>
    <p>玖富将为代理商员工进行包括企业文化、内部规范、业务模式和业务能力提升等在内的多方面岗前培训，使每一位受训员工都拥有完备的技能水平、标准化的作业动作，以保证代理商的业务顺利起步并不断发展壮大。</p>
    <b>管理支持------全能管家，解除后顾无忧</b>
    <p>玖富为加盟商提供包括绩效体系、人员招聘、场地租赁及装修、设备采买指引等全方位指引。全能管家，为您解除后顾之忧。</p>
  </div>
</div>
<div class="agent_support clear bg_color3">
  <div class="agent_support_left float_l"><img src="images/support_pic3.jpg" width="213" height="135" /></div>
  <div class="agent_support_right float_r">
    <b>品牌支持——背靠大树，让你出手不凡</b>
    <p>玖富经过多年的业务拓展，积累了行业内的各类资源，拥有绝对的品牌优势。通过大数据和云计算，在零售金融、小微金融领域提供专业的业务解决方案，是中国领先的云金融业务服务平台，国内最大的微金融服务商。</p>
    <b>运营支持------精准运作，步步为赢</b>
    <p>玖富向代理商提供包括专业人员支持、制度方法指引、数据支持。团队一体化的审核服务，解决审核的后顾之忧；合规稽核技术共享、贷后数据管理，风险客户追踪的全方位风控模式，解决业务难题。</p>
  </div>
</div>
<div class="agent_support clear bg_color4">
  <div class="agent_support_left float_l"><img src="images/support_pic4.jpg" width="213" height="169" /></div>
  <div class="agent_support_right float_r">
    <b>网络支持------你开公司，我们找客户</b>
    <p>玖富名下网站为您提供海量的客户资源，让您不用出门，轻松做业务。</p>
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
