<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link href="cssnew/publlc.css" type="text/css" rel="stylesheet" />
<link href="cssnew/home.css" type="text/css" rel="stylesheet" />
<link href="cssnew/tipswindown.css" type="text/css" rel="stylesheet" />
<link href="cssnew/css.css" type="text/css" rel="stylesheet" />
<link href="cssnew/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>
<script type="text/javascript" src="Scripts/tipswindown.js"></script>
<script type="text/javascript" src="Scripts/pop_zidong.js"> </script>
<script type="text/javascript" src="Scripts/zhijiedai.js"> </script>

<style type="text/css">
.pop_contact .pop_city a.C_${sessionScope.currentRegion.id}{
	color:#f68a55;
	font-weight:bold;
	border-bottom:solid #f68a55 1px;
}
</style>
<c:if test="${sessionScope.regionAvailable ne '1'}">
<script type="text/javascript">
$(document).ready(function(){
	layer();
});

</script>
</c:if>
<script type="text/javascript">
	$(document).ready(function() {
		$("#pop_city").click(function(){
			tipsWindown("您可以选择以下地区：","iframe:iframe:pop_city.jsp",
					"500","200","true","","false","text","");
		});
		
		$("#pop_question").click(function(){
			tipsWindown("我要提问：", "iframe:iframe:postQuestionForm",
					"550", "465", "true", "", "false", "text", "");
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
	});	
	
	setTimeout('_magicTimeout()',20*1000);
    function _magicTimeout(){
	   $('.time_box').hide();
    }
</script>
</head>

<body>
<!--================== 自动弹出框 城市切换 开始 ==================-->
<div id="brg"></div>
<div id="showdiv">
   <div id="close_bj"><span class="font_f">提示</span>
    <div id="close"></div>
   </div>
   <div id="testdiv">
    <div class="testdiv1">根据您的IP地址，您在${sessionScope.currentRegion.name}。</div>
    <div class="testdiv2">目前玖富云金融平台尚未在该地区开通线下贷款业务，金融机构无法接受您的贷款申请。您可以切换至以下地区浏览平台产品服务以及使用平台功能。</div>
    <div class="pop_contact">
		<div class="testdiv3">请选择以下地区</div>
		<div class="pop_city">
			<c:forEach var="alr" items="${applicationScope.allowLoanRegions}">
				<!--<a href="selectCity?setcity=${alr.id}" class="C_${alr.id}">${alr.name}</a>-->
				<a href="#" onclick="location.href='selectCity?setcity=${alr.id}&from='+escape(location.href)" class="C_${alr.id}">${alr.name}</a>
			</c:forEach>
		</div>
		<div class="pop_city2"><b>温馨提示：</b>请选择您的真实所在地，否则金融机构不能受理您的贷款申请。</div>
     </div>
  </div>
 </div>
 <!--================== 自动弹出框 城市切换 结束 ==================-->
<div class="n_top3">
  <div class="n_top4">
    <div class="n_top4_left"><font>客服热线：400-810-2599</font><a href="http://weibo.com/jiufutougu" target="_blank"><img src="images/n_weibo.jpg" width="62" height="22" /></a></div>
    <div class="n_top4_right">
	    <c:if test="${not empty sessionScope.custName}">${sessionScope.custName}, 欢迎您！<font>|</font> <a href="logOut">退出</a> <font>|</font></c:if>
		<c:if test="${empty sessionScope.custName}"><a href="reg">注册</a><font>|</font><a href="loginView">登录</a><font>|</font></c:if>
		<a href="myDaikuan">会员中心</a><font>|</font>
		<a>信贷经理登录</a><font>|</font>
		<a>加盟商专区</a><font>|</font>
		<a href="http://zixun.9fbank.com" target="_blank">银行专区</a>
    </div>
  </div>
</div>
<div class="n_top">
  <div class="n_top1">
    <div class="logo"><a href="index.html"></a></div>
    <!--2013-11-15-->
    <div class="logo_wei">
      <div class="logo_title font_f">微金融&nbsp;&nbsp;云平台</div>
      <div class="city font_f"><font>${sessionScope.currentRegion.name}</font><a href="#" id="pop_city">[切换城市]</a></div>
    </div>
    <!--2013-11-15 end-->
    <div class="top_right">
    <!--<div class="top_right1"><a href="registered.html">注册</a><font>|</font><a href="login.html">登录</a><font>|</font><a href="members.html">我的会员中心</a><font>|</font><a href="login.html">信贷经理登录</a><font>|</font><a href="manager.html">信贷经理入驻</a></div>-->
  </div>
  </div>
  <div class="n_top2">
    <div class="underPmenu font_f" id="w_nav">
      <ul>
        <li class="hover"><a href="index.html">首页</a></li>
        <li><a href="directloan" target="_blank">直接贷</a></li>
        <li><a href="creditCust" target="_blank">信用码</a></li>
        <li><a href="http://tuan.9fbank.com/front/common/index" target="_blank">金融团</a><i></i></li>
        <li><a href="queryProduct" target="_blank">贷款池</a>
          <ul>
            <li class="subline"></li>
			<li><a href="queryProduct?loanUse=2" class="w_a1" target="_blank">消费贷款</a></li>
			<li><a href="queryProduct?loanUse=1" class="w_a1" target="_blank">经营贷款</a></li>
			<li><a href="queryProduct?loanUse=4" class="w_a1" target="_blank">购车贷款</a></li>
			<li><a href="queryProduct?loanUse=3" class="w_a1" target="_blank">购房贷款</a></li>
          </ul>
        </li>
        <li><a href="ask" target="_blank">贷款百科</a></li>
        <li><a href="#">代理商</a></li>
      </ul>
    </div>
  </div>
</div>

<div id="full-screen-slider">
  <ul id="slides">
    <li class="pic1"><a></a></li>
    <li class="pic2"><a></a></li>
    <li class="pic3"><a href="http://tuan.9fbank.com" target="_blank"></a></li>
  </ul>
  <div class="sy_login">
    <div class="sy_login1">
    </div>
    <div class="sy_login2 sy_login4">
    	<h1>直接贷</h1>
    	<form action="directOrder" method="post" target="_blank" id="directOrder">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th width="30%" height="24" align="right" valign="middle">姓名：</th>
          <td width="70%"><input name="applyName" type="text" class="sy_login6" id="applyName" />
              <span id="applyName_ok" class="tip_yes" style="display:none;"></span>
              <span id="applyName_error" class="e9" style="display:none;"></span>
          </td>
        </tr>
        <tr>
          <th height="24" align="right" valign="middle">手机号：</th>
          <td><input name="applyTelephone" type="text" class="sy_login6" id="applyTelephone" />
                <span id="applyTelephone_ok" class="tip_yes" style="display:none;"></span>
                <span id="applyTelephone_error" class="e9" style="display:none;"></span>
          </td>
        </tr>
        <tr>
          <th height="24" align="right" valign="middle">所在城市：</th>
          <td><select id="provinceList">
            <option value="">请选择</option>
	        <c:forEach var="prov" items="${provinces}">
	        <option value="${prov.id}">${prov.name}</option>
	        </c:forEach>
          </select>
          <select id="cityList" name="cityId" >
            <option value="">请选择</option>
          </select>
                <span id="provinceList_ok" class="tip_yes" style="display:none;"></span>
                <span id="provinceList_error" class="e9" style="display:none;"></span>


          </td>
        </tr>
        <tr>
          <th height="24" align="right" valign="middle">申请额度：</th>
          <td><input name="applyAmt" type="text" class="sy_login5" id="loan_amt" />万元
                <span id="loan_amt_ok" class="tip_yes" style="display:none;"></span>
                <span id="loan_amt_error" class="e9" style="display:none;"></span>
          </td>
        </tr>
        <tr>
          <th height="24" align="right" valign="middle">贷款期限：</th>
          <td><input name="loanTime" type="text" class="sy_login5"  id="loan_issue"/>个月
                <span id="loan_issue_ok" class="tip_yes" style="display:none;"></span>
                <span id="loan_issue_error" class="e9" style="display:none;"></span>
          </td>
        </tr>
        <tr>
          <td height="40" align="right" valign="bottom">&nbsp;</td>
          <td align="right" valign="middle"><input type="button" value="立即申请" class="sy_login3"  id="zhijiedai_submit"/></td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</div>
<div class="main1">
  <ul>
    <li class="short"><a href="quickloan" target="_blank"><b>快速贷款专区</b><br />
      资金要得急 还款期限短</a></li>
    <li class="high"><a href="incramt" target="_blank"><b>提高额度专区</b><br />
      分级评分 逐级增加额度</a></li>
    <li class="pos"><a href="viewProduct?productId=1" target="_blank"><b>POS贷款专区</b><br />
      POS流水评估 简便贷款</a></li>
    <li class="loan"><a><b>提现卡专区</b><br />
      即将上线 尽请期待</a></li>
  </ul>
</div>
<div class="main2">
  <div class="main2_left">
    <div class="credit ground">
      <div class="credit_title"> <span class="credit_title1 font_f">小微快速贷款精选</span> <span class="credit_title2">无需抵押 担保</span> <a target="_blank" href="queryProduct">更多信用贷款</a> </div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		<c:forEach var="hcrProd" items="${hcrProds.items}">
		<tr>
          <td width="11%"><img src="images/products/40x20/${hcrProd.icon}" width="40" height="20" /></td>
          <td width="18%">${hcrProd.name}</td>
          <td width="61%" style="line-height: 16px">${hcrProd.desc}</td>
          <td width="10%">
          <c:choose>
          	<c:when test="${not empty hcrProd.linkUrl}">
              <a href="${hcrProd.linkUrl}" target="_blank">查看</a>
          	</c:when>
          	<c:otherwise>
              <a href="viewProduct?productId=${hcrProd.id}" target="_blank">查看</a>
          	</c:otherwise>
          </c:choose>
          </td>
        </tr>
		</c:forEach>
      </table>
    </div>
    <div class="credit ground">
      <div class="credit_title"> <span class="credit_title1 font_f">银行特色贷款精选</span></div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		<c:forEach var="hchProd" items="${hchProds.items}">
		<tr>
          <td width="11%"><img src="images/products/40x20/${hchProd.icon}" width="40" height="20" /></td>
          <td width="18%">${hchProd.issueOrgan}-${hchProd.name}</td>
          <td width="61%">${hchProd.desc}</td>
          <td width="10%">
          <c:choose>
          	<c:when test="${not empty hchProd.linkUrl}">
              <a href="${hchProd.linkUrl}" target="_blank">查看</a>
          	</c:when>
          	<c:otherwise>
              <a href="viewProduct?productId=${hchProd.id}" target="_blank">查看</a>
          	</c:otherwise>
          </c:choose>
          </td>
        </tr>
		</c:forEach>
      </table>
    </div>
  </div>
  <div class="main2_right">
    <div class="ad1"><a href="viewProduct?productId=4" target="_blank"></a></div>
    <%@include file="../inc/daikuanTools.jsp"%>
    <div class="assistant ground">
      <div class="credit_title"> <span class="credit_title1 font_f">他们已经成功贷款</span></div>
      <marquee onmouseover="this.stop()" onmouseout="this.start()" scrollamount="2" scrolldelay="0" direction="up" width="100%" height="100%">
      <ul class="success">
      <c:forEach var="sucOrder" items="${sucOrders.items}">
      	<li>${sucOrder.applyName}先生已经成功获得${sucOrder.product.name}</li>
      </c:forEach>
      </ul>
      </marquee>
    </div>
  </div>
</div>
<div class="main3 padding-bt ground">
  <div class="credit_title"> 
    <span class="credit_title1 font_f">云金融平台入驻银行</span>
    <p>9大总行 10多家区域银行 17处小微金融服务中心  覆盖全国28区的云金融网络</p>
  </div>
  <div class="cloud">
    <div id="demo">
    <div id="indemo">
    <div id="demo1">
    <div><img src="images/bankicon/116x28/abc.jpg" width="116" height="28" /><br /><img src="images/bankicon/116x28/ceb.jpg" width="116" height="28" /></div>
    <div><img src="images/bankicon/116x28/boc.jpg" width="116" height="28" /><br /><img src="images/bankicon/116x28/cmbc.jpg" width="116" height="28" /></div>
    <div><img src="images/bankicon/116x28/bcm.jpg" width="116" height="28" /><br /><img src="images/bankicon/116x28/icbc.jpg" width="116" height="28" /></div>
    <div><img src="images/bankicon/116x28/cgb.jpg" width="116" height="28" /><br /><img src="images/bankicon/116x28/cbc.jpg" width="116" height="28" /></div>
    <div><img src="images/bankicon/116x28/hsb.jpg" width="116" height="28" /><br /><img src="images/bankicon/116x28/jiangsu.jpg" width="116" height="28" /></div>
    <div><img src="images/bankicon/116x28/cmb.jpg" width="116" height="28" /><br /><img src="images/bankicon/116x28/psbc.jpg" width="116" height="28" /></div>
    <div><img src="images/bankicon/116x28/chongqi.jpg" width="116" height="28" /><br /><img src="images/bankicon/116x28/hb.jpg" width="116" height="28" /></div>
    <div><img src="images/bankicon/116x28/dalian.jpg" width="116" height="28" /><br /><img src="images/bankicon/116x28/btcb.jpg" width="116" height="28" /></div>
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
<%@include file="../inc/globalFooterMenu.jsp" %>
<%@include file="../inc/globalFooter.jsp" %>
</body>
</html>