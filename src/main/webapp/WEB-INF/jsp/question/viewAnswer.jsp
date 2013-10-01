<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款问答</title>
<%@include file="../../inc/globalScript.jsp" %>
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
</head>

<body>
<%@include file="../../inc/globalHeader.jsp" %>

<%@include file="../../inc/questionSearchForm.jsp" %>
<div class="top Fuzzysearch1 Loansquiz1">
	<div class="applicationright">
    <div class="strategy ground Loansquiz8">
      <div class="credit_title"> <span class="credit_title1 font_f">贷款攻略</span> <a target="_blank" href="贷款攻略.html">更多</a></div>
      <ul class="strategy_list">
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">购买二手房 你可能忽视了这些</a></li>
      <li><a href="贷款攻略2.html" target="_blank">5种贷款方式大汇总 谁是你心中的主角</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
    </ul>
    </div>         
    <div class="assistant ground">
    <div class="credit_title"> <span class="credit_title1 font_f">贷款助手</span></div>
    	<div class="assistant1">
        <div class="assistant1_1"><a href="score_choose.html" class="cal"></a></div>
        <div class="assistant1_2"><a href="score_choose.html">云信用评分器</a><br />测测你能贷多少</div>
      </div>
      
  </div>
  <div class="assistant ground">
    <div class="credit_title"> <span class="credit_title1 font_f">我要贷款</span></div>
    <table width="100%" border="1" class="Loansearch1 Loansquiz9">
    	<tr>
        <td width="31%" align="right" valign="middle">职业身份：</td>
        <td width="69%" align="left" valign="middle"><div id="tm2008style">
	<select name="language_tm20081" id="language_tm2008">
		<option value="企业主">企业主</option>
		<option value="个体户" >个体户</option>
		<option value="上班族" >上班族</option>
		<option value="无固定职业" >无固定职业</option>
	</select>
</div></td>
      </tr>
      <tr>
        <td width="31%" align="right" valign="middle">贷款用途：</td>
        <td width="69%" align="left" valign="middle"><div id="tm2008style">
	<select name="language_tm20082" id="language_tm2008">
		<option value="不限">不限</option>
		<option value="经营贷款" >经营贷款</option>
		<option value="消费贷款" >消费贷款</option>
		<option value="购车贷款" >购车贷款</option>
		<option value="购房贷款" >购房贷款</option>
	</select>
</div></td>
      </tr>
      <tr>
        <td align="right" valign="middle">贷款金额：</td>
         <td width="69%" align="left" valign="middle"><div id="tm2008style">
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
      </tr>
      <tr>
        <td align="right" valign="middle">贷款期限：</td>
         <td width="69%" align="left" valign="middle"><div id="tm2008style">
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
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td align="left" valign="middle"><a href="贷款搜索.html" target="_blank"><img src="images/img34.jpg" width="94" height="29" /></a></td>
      </tr>
    </table>
  </div>
            </div>
	<div class="applicationleft">
   	 	<div class="ask ground Loansquiz10 Loansquiz15 Loansquiz8">
    		<div class="Loansquiz13">
            	<h1>贷款</h1>
                <p><span>2013-12-25&nbsp;13:24</span>提问者:121212**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;问答来自:黑龙江&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标签:贷款&nbsp;贷款&nbsp;贷款</p>
           	</div>
            <p class="Loansquiz14">11日在大连举行的2013年夏季达沃斯论坛上，国务院总理李克强发表了《以改革创新驱动中国经济长期持续健康发展》的开幕致辞，透露出的政策信号引起了各界的高度关注11日在大连举行的2013年夏季达沃斯论坛上，国务院总理李克强发表了《以改革创新驱动中国经济长期持续健康发展》的开幕致辞，透露出的政策信号引起了各界的高度关注。</p>
 	 	</div>
        <div class="credit ground  applicationleft13">
  <div class="credit_title Fuzzysearch7"> 
    <div class="credit_title font_f Fuzzysearch2 applicationleft5 Loansquiz16"> <span>平台回答</span></div>
  </div>
  <p class="Loansquiz17">11日在大连举行的2013年夏季达沃斯论坛上，国务院总理李克强发表了《以改革创新驱动中国经济长期持续健康发展》的开幕致辞，透露出的政策信号引起了各界的高度关注11日在大连举行的2013年夏季达沃斯论坛上</p>
  <div class="Loansquiz18">9F云金融&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2010-12-12</div>
</div>
    </div>
</div>


<%@include file="../../inc/globalFooterMenu.jsp" %>
<%@include file="../../inc/globalFooter.jsp" %>
</body>
</html>
