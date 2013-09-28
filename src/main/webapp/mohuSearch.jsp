<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>推荐产品</title>
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

<div class="Fuzzysearch">
	<div class="top Fuzzysearch1">
    	<div class="main3 padding-bt ground">
  <div class="credit_title"> 
    <span class="credit_title1 font_f Fuzzysearch2">不知道自己的贷款需求？看看同地区同行业的人选择什么产品</span>
  </div>
  <div class="Fuzzysearch3">
  	<div class="Fuzzysearch4 ClearFix"><h1>请选择您的地区:</h1><p><a href="#">北京</a><a href="#">上海</a><a href="#">黑龙江</a><a href="#">乌鲁木齐</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">秦皇岛</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a></p></div>
    <div class="Fuzzysearch5"><a href="模糊搜索结果.html"><img src="images/img3.jpg" width="154" height="29" /></a></div>
    </div>
</div>
<div class="main3 ground  Fuzzysearch6">
  <div class="credit_title"> 
    <span class="credit_title1 font_f">热门贷款推荐</span>
  </div>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
        <tr>
          <td width="8%"><img src="images/credit01.jpg" width="40" height="21" /></td>
          <td width="20%">平安银行-新一贷</td>
          <td width="65%">有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td width="7%"><a href="产品申请.html">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit02.jpg" width="39" height="22" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit03.jpg" width="25" height="24" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit04.jpg" width="18" height="22" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html">查看</a></td>
        </tr>
        <tr>
          <td><img src="images/credit05.jpg" width="25" height="12" /></td>
          <td>平安金融-薪金贷</td>
          <td>有1年以上房贷记录即可申请，条件宽松，当天放款</td>
          <td><a href="产品申请.html">查看</a></td>
        </tr>
      </table>
</div>
    </div>
</div>

<%@include file="WEB-INF/inc/globalFooterMenu.jsp" %>
<%@include file="WEB-INF/inc/globalFooter.jsp" %>
</body>
</html>
    