<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>加盟商</title>
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
    <li><a href="agsup.jsp">代理支持</a></li>
    <li><a href="agprs.jsp">代理流程</a></li>
    <li><a href="agsuc.jsp">成功案例</a></li>
    <li><a href="#" class="hover">加盟商</a></li>
  </ul>
</div>
<div class="agent_support_banner"></div>
<div class="case_title font_f">玖富“向阳花”创业扶持计划代理商：</div>
<div class="join clear">
  <div class="join_left float_l">
    <b>北京恒生信业信息技术有限公司</b>
    <p>地址：北京市朝阳区建国路88号建国门外soho现代城B509</p>
    <b>郑州市邦融信息技术有限公司</b>
    <p>地址：郑州市金水区金水路288号14号楼20层2010号</p>
  </div>
  <div class="join_right float_r">
    <b>武汉点融信息技术有限公司</b>
    <p>地址：武汉市东湖开发区珞瑜路世界城广场写字楼第1幢1单元22层08-11房</p>
    <b>南京捷信文信息技术有限公司</b>
    <p>地址：南京市白下区中山东路300号长发大厦A座10层D室</p>
  </div>
</div>

<div class="story_title font_f">玖富微金融服务中心</div>
<div class="service clear">
  <div class="service_left float_l">
    <b>广州第一微金融服务中心</b>
    <p>地址：广州市越秀区解放北路837号农业银行二楼<br />联系电话：020-37948323</p>
    <b>佛山微金融服务中心</b>
    <p>地址：佛山市禅城区城门头路18号ICC大厦1505<br />联系电话：0757-63220101</p>
    <b>常州微金融服务中心</b>
    <p>地址：常州市天宁区延陵西路29号投资广场16楼<br />联系电话：0519-88296191</p>
    <b>青岛微金融服务中心</b>
    <p>地址：青岛市市南区香港中路36号招银大厦1501<br />联系电话：0532-86677808</p>
    <b>重庆微金融服务中心</b>
    <p>地址：重庆市江北区杨河一村78号重庆国际商会大厦4楼403号<br />联系电话：023-88731877</p>
    <b>扬州微金融服务中心</b>
    <p>地址：扬州文昌中路六号首席国际大厦A座615、616室</p>
    <b>贵阳微金融服务中心</b>
    <p>地址：贵阳市云岩区中华中路108号901室</p>
    <b>成都第二微金融服务中心</b>
    <p>地址：成都市金牛区蜀汉路526号附1号攀枝花市商业银行</p>
    <b>鹰潭微金融服务中心</b>
    <p>地址：江西省鹰潭市月湖区胜利东路8号（月湖区政府对面）鹰潭农商银行小微金融部3楼</p>
    <b>上海第二微金融服务中心</b>
    <p>地址：上海市黄浦区西藏中路18号1005室</p>
    <b>南京微金融服务中心</b>
    <p>地址：南京鼓楼区中山北路2号紫峰大厦1808室</p>
    <b>天津微金融服务中心</b>
    <p>地址：天津和平区西康路与成都道交口东北侧路赛顿大厦3-1-2403-2402室</p>
  </div>
  <div class="service_right float_r">
    <b>广州第二微金融服务中心</b>
    <p>地址：广州市海珠区新港中路376号浩蕴商务大厦1410室<br />联系电话：020-89562997</p>
    <b>宁波微金融服务中心</b>
    <p>地址：宁波市江东区百丈路会展中心大厦A座28B<br />联系电话：0574-87374675</p>
    <b>武汉微金融服务中心</b>
    <p>地址：武汉市江汉区解放大道686号世贸大厦4701-05室<br />联系电话：027-85575856</p>
    <b>石家庄微金融服务中心</b>
    <p>地址：石家庄市长安区建设南大街29号众鑫大厦21层2110号<br />联系电话：0311-66694796</p>
    <b>成都第一微金融服务中心</b>
    <p>地址：四川省成都市锦江区锦东路568号摩根中心2栋12层1202-1203室<br />联系电话：028-65852620</p>
    <b>洪泽微金融服务中心</b>
    <p>地址：江苏省淮安市洪泽县高良涧镇信用社</p>
    <b>攀枝花微金融服务中心</b>
    <p>地址：四川省攀枝花市机场路88号</p>
    <b>江门微金融服务中心</b>
    <p>地址：广东江门市蓬江区东华一路兴华苑2号-1501房</p>
    <b>上海第一微金融服务中心</b>
    <p>地址：上海市浦东新区浦东南路588号浦发大厦29楼C座<br />联系电话：021-60440904</p>
    <b>广州微金融服务中心</b>
    <p>地址：广州市天河区黄埔大道西76号富力盈隆广场609</p>
    <b>苏州微金融服务中心</b>
    <p>地址：苏州高新区狮山路22号1幢101室（苏州人才广场）1105、1106、1107单元</p>
    <b>厦门微金融服务中心</b>
    <p>地址：厦门市思明区新景中心c栋905-907室</p>
  </div>
</div>

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
