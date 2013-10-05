<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款攻略</title>
<%@include file="../../inc/globalScript.jsp" %>
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
<%@include file="../../inc/zhuanquMenu.jsp" %>
<div class="Fuzzysearch">
	<div class="top Fuzzysearch1">
    	<div class="application ClearFix">
        	<div class="applicationright">
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
        <td align="left" valign="middle"><a href="#"><img src="images/img34.jpg" width="94" height="29" /></a></td>
      </tr>
    </table>
  </div>
            </div>
        	<div class="applicationleft">
            	<div class="credit ground applicationleft13">
      <div class="credit_title"><span class="credit_title1 font_f Theloanright6">热点专题</span></div>
      <div class="Theloan">
      	<div class="Theloanleft Theloanright">
        	 <ul class="strategy_list Theloanright1">
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">购买二手房 你可能忽视了这些</a></li>
      <li><a href="贷款攻略2.html" target="_blank">5种贷款方式大汇总 谁是你心中的主角</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">购买二手房 你可能忽视了这些</a></li>
    </ul>
        </div>
      	<div class="Theloanleft">
        	<h1>个人信用没你想想中的简单</h1>
            <img src="images/img38.jpg" width="265" height="185" />
            <p>得不偿失？信用卡购车小心捆绑保车小心捆绑保险险...<a href="贷款攻略2.html" target="_blank">[更多]</a></p>
        </div>
      </div>
    </div>
    <div class="credit ground Loansquiz7 ">
        <div id="Tab2">
<div class="Menubox font_f">
<ul>
<li id="sun1" onclick="setTab('sun',1,2)"  class="hover">无抵押贷款</li>
<li id="sun2" onclick="setTab('sun',2,2)" >抵押贷款</li>
</ul>
</div>
<div class="Contentbox Theloanright5">
   <div id="con_sun_1" >
		<div class="Theloanright2"><a href="#">银行抵押贷款</a><span>|</span><a href="#">抵押贷款利率</a><span>|</span><a href="#">抵押贷款流程</a></div>
        <div class="Theloan">
      	<div class="Theloanleft Theloanright">
        	 <ul class="strategy_list Theloanright1">
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">购买二手房 你可能忽视了这些</a></li>
      <li><a href="贷款攻略2.html" target="_blank">5种贷款方式大汇总 谁是你心中的主角</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
    </ul>
        </div>
      	<div class="Theloanleft ClearFix">
        	<div>
            	<div class="Theloanright3"><h1>经济房抵押贷款</h1><p>得不偿失？信用卡购车小心捆绑保险得不偿失险...<a href="#">[详细]</a></p></div>
            	<img src="images/img39.jpg" width="90" height="64" />
            </div>
            <ul class="strategy_list Theloanright1 Theloanright4">
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">购买二手房 你可能忽视了这些</a></li>
      <li><a href="贷款攻略2.html" target="_blank">5种贷款方式大汇总 谁是你心中的主角</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
    </ul>
        </div>
      </div>
  </div>
<div id="con_sun_2" style="display:none">
	
</div>
</div>
</div>
    </div>
    <div class="credit ground Loansquiz7 ">
        <div id="Tab2">
<div class="Menubox font_f">
<ul>
<li id="two1" onclick="setTab('two',1,2)"  class="hover">消费类贷款</li>
<li id="two2" onclick="setTab('two',2,2)" >经营类贷款</li>
</ul>
</div>
<div class="Contentbox Theloanright5">
   <div id="con_two_1" >
		<div class="Theloanright2"><a href="#">银行抵押贷款</a><span>|</span><a href="#">抵押贷款利率</a><span>|</span><a href="#">抵押贷款流程</a></div>
        <div class="Theloan">
      	<div class="Theloanleft Theloanright">
        	 <ul class="strategy_list Theloanright1">
      <li><a href="#">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">购买二手房 你可能忽视了这些</a></li>
      <li><a href="贷款攻略2.html" target="_blank">5种贷款方式大汇总 谁是你心中的主角</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
    </ul>
        </div>
      	<div class="Theloanleft ClearFix">
        	<div>
            	<div class="Theloanright3"><h1>经济房抵押贷款</h1><p>得不偿失？信用卡购车小心捆绑保险得不偿失险...<a href="#">[详细]</a></p></div>
            	<img src="images/img39.jpg" width="90" height="64" />
            </div>
            <ul class="strategy_list Theloanright1 Theloanright4">
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">购买二手房 你可能忽视了这些</a></li>
      <li><a href="贷款攻略2.html" target="_blank">5种贷款方式大汇总 谁是你心中的主角</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
    </ul>
        </div>
      </div>
  </div>
<div id="con_two_2" style="display:none">
	
</div>
</div>
</div>
    </div>
    <div class="credit ground applicationleft13">
      <div class="credit_title"><a href="贷款攻略1.html">更多</a><span class="credit_title1 font_f">新手贷款攻略</span></div>
      <div class="Theloan">
      	<div class="Theloanleft Theloanright">
        	 <ul class="strategy_list Theloanright1">
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">购买二手房 你可能忽视了这些</a></li>
      <li><a href="贷款攻略2.html" target="_blank">5种贷款方式大汇总 谁是你心中的主角</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">购买二手房 你可能忽视了这些</a></li>
    </ul>
        </div>
      	<div class="Theloanleft">
        	<ul class="strategy_list Theloanright1">
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">购买二手房 你可能忽视了这些</a></li>
      <li><a href="贷款攻略2.html" target="_blank">5种贷款方式大汇总 谁是你心中的主角</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">得不偿失？信用卡购车小心捆绑保险</a></li>
      <li><a href="贷款攻略2.html" target="_blank">新版信用报告的不良记录是怎么算的？</a></li>
      <li><a href="贷款攻略2.html" target="_blank">看中介攻心术如何让你"非买不可"</a></li>
      <li><a href="贷款攻略2.html" target="_blank">购买二手房 你可能忽视了这些</a></li>
    </ul>
        </div>
      </div>
    </div>
    
            </div>
            
        </div>

    </div>
</div>

<%@include file="../../inc/globalFooterMenu.jsp" %>
<%@include file="../../inc/globalFooter.jsp" %>
</body>
</html>
