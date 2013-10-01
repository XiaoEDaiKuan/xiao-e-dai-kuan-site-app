<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<%@include file="WEB-INF/inc/globalScript.jsp" %>
<script>
<!--
/*第一种形式 第二种形式 更换显示样式*/
function setTab(name,cursel,n){
for(i=1;i<=n;i++){
var menu=document.getElementById(name+i);
var con=document.getElementById("con_"+name+"_"+i);
menu.className=i==cursel?"hover":"";
con.style.display=i==cursel?"block":"none";
}
}
//-->
</script>

<script type="text/javascript">
	$(document).ready(function() {
	<%if(request.getSession().getAttribute("custName") == null){%>
	$("#pop_login").click(function(){
		tipsWindown("您当前尚未登录，若想要申请贷款，请先登录。","iframe:iframe:pop_login.html","450","320","true","","false","text","");
	});
	<%}else{%>
	$("#pop_login").click(function(){
		tipsWindown("请填写贷款信息","iframe:iframe:requestProductInfo","450","215","true","","false","text","");
	});
	<%}%>
	$("#pop_save").click(function(){
		tipsWindown("产品信息保存到邮箱","iframe:iframe:pop_save.html","580","215","true","","false","text","");
	});
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
    	<div class="application ClearFix clear">
        	<div class="applicationright">
               <div class="assistant ground">
      <div class="credit_title"> <span class="credit_title1 font_f">贷款助手</span></div>
      <div class="assistant1">
        <div class="assistant1_1"><a href="#" class="cal"></a></div>
        <div class="assistant1_2"><a href="#">云信用评分器</a><br />测测你能贷多少</div>
      </div>
    </div>
    <div class="strategy ground">
    <div class="credit_title"> <span class="credit_title1 font_f">贷款攻略</span> <a target="_blank" href="http://beijing.rong360.com/s_tp2m10t12?from=hp">更多</a></div>
    <ul class="strategy_list">
      <li><a href="#">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="#">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="#">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="#">购买二手房 你可能忽视了这些</a></li>
      <li><a href="#">5种贷款方式大汇总 谁是你心中的主角</a></li>
      <li><a href="#">看中介攻心术如何让你"非买不可"</a></li>
    </ul>
  </div>
            </div>
        	<div class="applicationleft">
            	<div class="credit ground Loansearch3 clear">
      <div class="credit_title"> <span class="credit_title1 font_f">花旗银行-幸福时代</span></div>
      <div class="applicationleft1 ClearFix">
      	<ul class="applicationleft4">
        	<li>贷款金额<span>100</span>万元</li>
            <li>期限<span>10</span>月</li>
            <li>总利息<span>100</span>万元</li>
            <li>月供<span>100</span>元</li>
            <li>利率说明:月利率<span>100</span></li>
            <li>提前还款说明</li>
        </ul>
      	<div class="applicationleft2"><img src="images/img19.jpg" width="110" height="67" /></div>
        <div class="Loansearch13 applicationleft3">
            <p><span class="Loansearch14">无需抵押</span><br /><span class="Loansearch14 Loansearch15">上班族可申请</span><br /><span class="Loansearch14 Loansearch16">5天放款</span></p>
            <a href="#"><img src="images/img21.jpg" width="94" height="29" id="pop_login" /></a>
        </div>
      </div>
    </div>
    <div class="credit ground  applicationleft13">
  <div class="credit_title Fuzzysearch7"> 
    <div class="credit_title font_f Fuzzysearch2 applicationleft5"> <span>贷款须知</span><a href="#" id="pop_save">保存此内容到我的邮箱</a> </div>
  </div>
  <div class="applicationleft6">
  	<div class="applicationleft7">
    	<h1>申请条件</h1>
        <p>有1年以上房贷记录即可申请，条件宽松，当天放款<br />有1年以上房贷记录即可申请，条件宽松，当天放款</p>
    </div>
    <div class="applicationleft7">
    	<h1>所需材料</h1>
        <p>有1年以上房贷记录即可申请，条件宽松，当天放款<br />有1年以上房贷记录即可申请，条件宽松，当天放款</p>
    </div>
    <div class="applicationleft7">
    	<h1>利率说明</h1>
        <p>有1年以上房贷记录即可申请，条件宽松，当天放款<br />有1年以上房贷记录即可申请，条件宽松，当天放款</p>
    </div>
    <div class="applicationleft7 applicationleft8">
    	<h1>常见问题</h1>
        <div class="applicationleft9">
        	<div class="applicationleft10"><span>2013-10-10</span><p>问题:了房间啊设立考间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近点附近；垃圾水电费健康</p></div>
            <div class="applicationleft10 applicationleft11"><span>2013-10-10</span><p>回答:了房间啊设立考间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近间啊设立考点附近点附近；垃圾水电费健康</p></div>
        </div>
        <div class="applicationleft9">
        	<div class="applicationleft10"><span>2013-10-10</span><p>问题:了房间啊设立考间啊设立费健康</p></div>
            <div class="applicationleft10 applicationleft11"><span>2013-10-10</span><p>回答:了房间啊</p></div>
        </div>
        <div class="applicationleft12"><a href="#" id="pop_question"><img src="images/img25.jpg" width="94" height="29" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/img26.jpg" width="94" height="29" /></a></div>
    </div>
  </div>
</div>
            </div>
            
        </div>
<div class="main3 ground  Fuzzysearch6">
  <div class="credit_title"> 
    <span class="credit_title1 font_f">热门贷款推荐</span>
  </div>
  <%@include file="WEB-INF/inc/productInRow.jsp" %>
</div>
    </div>
</div>

<%@include file="WEB-INF/inc/globalFooterMenu.jsp" %>
<%@include file="WEB-INF/inc/globalFooter.jsp" %>
</body>
</html>
 