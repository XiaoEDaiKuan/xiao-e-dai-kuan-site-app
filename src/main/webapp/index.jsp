<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>首页</title>
<%@include file="WEB-INF/inc/globalScript.jsp" %>
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
<div id="full-screen-slider">
  <ul id="slides">
    <li class="pic1"><a href="#"></a></li>
    <li class="pic2"><a href="#"></a></li>
    <li class="pic3"><a href="#"></a></li>
  </ul>
  <div class="sy_login">
    <div class="sy_login1">
    </div>
    <div class="sy_login2">
      <h1>玖富专业贷款搜索平台</h1>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th width="20%">职业身份：</th>
          <td><div id="tm2008style">
	<select name="language_tm20081" id="language_tm2008">
		<option value="企业主">企业主</option>
		<option value="个体户" >个体户</option>
		<option value="上班族" >上班族</option>
		<option value="无固定职业" >无固定职业</option>
	</select>
</div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th>贷款用途：</th>
          <td><div id="tm2008style">
	<select name="language_tm20082" id="language_tm2008">
		<option value="不限">不限</option>
		<option value="经营贷款" >经营贷款</option>
		<option value="消费贷款" >消费贷款</option>
		<option value="购车贷款" >购车贷款</option>
		<option value="购房贷款" >购房贷款</option>
	</select>
</div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th>贷款金额：</th>
          <td><div id="tm2008style">
	<select name="language_tm20083" id="language_tm2008">
		<option value="万元">万元</option>
		<option value="3万元" >3万元</option>
		<option value="5万元" >5万元</option>
		<option value="10万元" >10万元</option>
		<option value="20万元" >20万元</option>
		<option value="50万元" >50万元</option>
		<option value="100万元" >100万元</option>
		<option value="其他" >其他</option>
	</select>
</div></td>
          <td>不足1万可用小数表示</td>
        </tr>
        <tr>
          <th>贷款期限：</th>
          <td><div id="tm2008style">
	<select name="language_tm20084" id="language_tm2008">
		<option value="3个月">3个月</option>
		<option value="6个月" >6个月</option>
		<option value="12个月" selected="selected" >12个月</option>
		<option value="2年" >2年</option>
		<option value="3年" >3年</option>
		<option value="5年" >5年</option>
		<option value="10年" >10年</option>
	</select>
</div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><a href="贷款搜索.html"><input name="" type="button" value="" class="btn1" /></a></td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </div>
  </div>
</div>
<div class="main1">
  <ul>
    <li class="short"><a href="kuaisu" target="_blank"><b>快速贷款专区</b><br />
      资金要得急 还款期限短</a></li>
    <li class="high"><a href="tigao" target="_blank"><b>提高额度专区</b><br />
      分级评分 逐级增加额度</a></li>
    <li class="pos"><a href="pos"><b>POS贷款专区</b><br />
      POS流水评估 简便贷款</a></li>
    <li class="loan"><a href="#"><b>XX贷款专区</b><br />
      简单说明</a></li>
  </ul>
</div>
<div class="main2">
  <div class="main2_left">
    <div class="credit ground">
      <div class="credit_title"> <span class="credit_title1 font_f">热门信用贷款</span> <span class="credit_title2">无需抵押 担保</span> <a target="_blank" href="贷款搜索.html">更多信用贷款</a> </div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
        <tr>
          <td width="11%"><img src="images/credit01.jpg" width="40" height="21" /></td>
          <td width="18%">平安银行-新一贷</td>
          <td width="61%">有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td width="10%"><a href="产品申请.html" target="_blank">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit02.jpg" width="39" height="22" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html" target="_blank">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit03.jpg" width="25" height="24" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html" target="_blank">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit04.jpg" width="18" height="22" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html" target="_blank">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit05.jpg" width="25" height="12" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html" target="_blank">查看</a></td>
        </tr>
      </table>
    </div>
    <div class="credit ground">
      <div class="credit_title"> <span class="credit_title1 font_f">热门特色贷款</span></div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
        <tr>
          <td width="11%"><img src="images/credit01.jpg" width="40" height="21" /></td>
          <td width="18%">平安银行-新一贷</td>
          <td width="61%">有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td width="10%"><a href="产品申请.html" target="_blank">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit02.jpg" width="39" height="22" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html" target="_blank">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit03.jpg" width="25" height="24" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html" target="_blank">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit04.jpg" width="18" height="22" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html" target="_blank">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit05.jpg" width="25" height="12" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html" target="_blank">查看</a></td>
        </tr>
      </table>
    </div>
  </div>
  <div class="main2_right">
    <div class="ad1"><a href="产品申请.html" target="_blank"></a></div>
    <div class="sina">
      <div class="sina_border">
      <div class="sina1"><a href="#" class="sina2"></a><p>平台微博加关注</p></div>
      <div class="sina1"><a href="#" class="weixin"></a><p>平台微信二维码</p></div> 
      </div>   
    </div>
    <%@include file="WEB-INF/inc/daikuanTools.jsp" %>
  </div>
</div>
<div class="main3 padding-bt ground">
  <div class="credit_title"> 
    <span class="credit_title1 font_f">云金融平台</span>
    <p>XX家银行 XX家小贷公司  XX家分支机构组成  覆盖全国XX地区的云金融网络</p>
  </div>
  <div class="cloud">
    <div id="demo">
    <div id="indemo">
    <div id="demo1">
    <div><img src="images/bank01.jpg" width="116" height="28" /><br /><img src="images/bank02.jpg" width="116" height="28" /></div>
    <div><img src="images/bank01.jpg" width="116" height="28" /><br /><img src="images/bank02.jpg" width="116" height="28" /></div>
    <div><img src="images/bank01.jpg" width="116" height="28" /><br /><img src="images/bank02.jpg" width="116" height="28" /></div>
    <div><img src="images/bank01.jpg" width="116" height="28" /><br /><img src="images/bank02.jpg" width="116" height="28" /></div>
    <div><img src="images/bank01.jpg" width="116" height="28" /><br /><img src="images/bank02.jpg" width="116" height="28" /></div>
    <div><img src="images/bank01.jpg" width="116" height="28" /><br /><img src="images/bank02.jpg" width="116" height="28" /></div>
    <div><img src="images/bank01.jpg" width="116" height="28" /><br /><img src="images/bank02.jpg" width="116" height="28" /></div>
    </div>
    <div id="demo2"></div>
    </div>
    </div>
    <script>
	<!--
	var speed=20;
	var tab=document.getElementById("demo");
	var tab1=document.getElementById("demo1");
	var tab2=document.getElementById("demo2");
	
	tab2.innerHTML=tab1.innerHTML;
	function Marquee(){
	if(tab2.offsetWidth-tab.scrollLeft<=0)
	tab.scrollLeft-=tab1.offsetWidth
	else{
	tab.scrollLeft++;
	}
	}
	var MyMar=setInterval(Marquee,speed);
	tab.onmouseover=function() {clearInterval(MyMar)};
	tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
	-->
	</script>
  </div>
</div>

<div class="main4">
  <div class="ask ground">
    <div class="credit_title"> <span class="credit_title1 font_f">大家都在问</span> <a target="_blank" href="贷款问答1.html">更多问题</a><input name="" type="button" value="我要提问" id="pop_question" /> </div>
    <ul class="question_list">
      <li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
      <li><a href="贷款问答2.html" target="_blank">房地产公司上班可以贷款吗？</a></li>
      <li><a href="贷款问答2.html" target="_blank">本人现在的月收入在2000至3000左右，且本单位...</a></li>
      <li><a href="贷款问答2.html" target="_blank">我现在在工厂打工，月收入3500，有工资卡作证。想...</a></li>
      <li class="border-bt"><a href="贷款问答2.html" target="_blank">我在人人贷的贷款被拒，还能在友信贷款吗？</a></li>
    </ul>
  </div>
  <div class="strategy ground">
    <%@include file="WEB-INF/inc/gonglueList.jsp" %>
  </div>
</div>
<%@include file="WEB-INF/inc/globalFooterMenu.jsp" %>
<%@include file="WEB-INF/inc/globalFooter.jsp" %>
</body>
</html>