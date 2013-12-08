<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>代理流程</title>
<link href="cssnew/agent.css" type="text/css" rel="stylesheet" />
<link href="cssnew/tipswindown.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/tipswindown.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#agent_city").click(function(){
		tipsWindown("您可以选择以下地区：","iframe:iframe:pop_city.jsp","500","200","true","","false","text","");
	});
	
	$("#agent_ok").click(function(){
		var pa = $("#agentform").serializeArray();
		var param = {}, isEmpty = false;
		
		$.each(pa, function(i,v){
			param[v.name] = v.value;
			if (!v.value) isEmpty = true;
		});
		
		if (isEmpty) return;
		
		$.ajax({
			url: 'createAgent',
			type: 'post',
			data: param,
			dataType: "text",
			success: function (data) {
				tipsWindown("提示","iframe:iframe:agentok.jsp","350","160","true","","false","text","");
			}
		});
	});

	$("#provinceList").change(function(){
		var checkValue = $(this).val();
		if (checkValue) {
			$.ajax({
				url: 'loadCities',
				type: 'post',
				data: {
					provinceId: checkValue
				},
				dataType: "json",
				success: function (data) {
					$("#cityList").find("option").each(function(){
			            $(this).remove();
			    	});
					$("<option value=''>请选择</option>").appendTo($("#cityList"));
					for (var i = 0; i < data.length; i++) {
						$("<option value='" + data[i].id +"'>" + data[i].name + "</option>").appendTo($("#cityList"));
					}
				}
			});
		}
	});
	
	$.ajax({
		url: 'loadProvinces',
		type: 'post',
		data: {},
		dataType: "json",
		success: function (data) {
			$("#provinceList").find("option").each(function(){
	            $(this).remove();
	    	});
			$("<option value=''>请选择</option>").appendTo($("#provinceList"));
			for (var i = 0; i < data.length; i++) {
				$("<option value='" + data[i].id +"'>" + data[i].name + "</option>").appendTo($("#provinceList"));
			}
		}
	});
	
});	
	
setTimeout('_magicTimeout()', 20*1000);
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
    <li><a href="#" class="hover">代理流程</a></li>
    <li><a href="agsuc.jsp">成功案例</a></li>
    <li><a href="agfnch.jsp">加盟商</a></li>
  </ul>
</div>
<div class="agent_process_banner"></div>
<div class="agent_process clear">
  <div class="agent_process_left float_l font_f">
    <h1>代理流程</h1>
    <div class="agent_process_left_img"></div>
    <div class="agent_process_applybox">
      <h1>申请代理</h1>
      <div class="agent_process_apply clear ">
      <form id="agentform">
        <div class="agent_process_apply_content float_l font_f_song">
          <p><font>姓名</font><span>
            <input name="name" type="text" />
            </span></p>
          <p><font>性别</font>
            <label>
              <input type="radio" name="gender" value="0" id="RadioGroup1_0" checked="checked" />
              男</label>
            <label>
              <input type="radio" name="gender" value="1" id="RadioGroup1_1" />
              女</label>
          </p>
          <p><font>联系电话</font><span>
            <input name="telephone" type="text" />
            </span></p>
          <p><font>拟代理城市</font>
            <select name="cityId" id="cityList">
              <option value=''>请选择</option>
            </select>
            <select id="provinceList">
              <option value=''>请选择</option>
            </select>
          </p>
        </div>
        </form>
        <div class="agent_process_apply_btn float_r"><input type="button" value="申请代理" id="agent_ok" /></div>
      </div>
    </div>
  </div>
  <div class="agent_process_right float_r">
    <h1>代理商所需条件</h1>
    <ul>
      <li>1.具有大专以上学历；</li>
      <li>2.具有一年及以上微金融或相关行业从业经验；</li>
      <li>3.具有一定的管理经验；</li>
      <li>4.有热情，有创业精神，有奋斗精神；</li>
      <li>5.认同玖富的公司文化；</li>
    </ul>
  </div>
</div>

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
