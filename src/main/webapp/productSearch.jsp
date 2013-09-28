<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>无标题文档</title>
<%@include file="WEB-INF/inc/globalScript.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
        $("#pop_city").click(function(){
            tipsWindown("您可以选择以下地区：","iframe:iframe:pop_city.html","500","200","true","","false","text","");
        });
        $("#pop_question").click(function(){
            tipsWindown("我要提问：","iframe:iframe:pop_question.html","550","465","true","","false","text","");
        });
        
        setParams();
	});	
	
	setTimeout('_magicTimeout()',20*1000);
    function _magicTimeout(){
	   $('.time_box').hide();
    }	
    
    function setParams(){
        var zhiye = $.getUrlParam('zhiye');
        if(zhiye != null){
            $("#zhiye").val(zhiye);
        }
        var jine = $.getUrlParam('jine');
        if(jine != null){
            $("#jine").val(jine);
        }
        var yongtu = $.getUrlParam('yongtu');
        if(jine != null){
            $("#yongtu").val(yongtu);
        }
        var qixian = $.getUrlParam('qixian');
        if(qixian != null){
            $("#qixian").val(qixian);
        }
    }
    
    function getParmasUrl(){
        var url = "productSearch.jsp?";
        var zhiye = $("#zhiye").val();
        if(zhiye != null){
            url += "zhiye=" + zhiye + "&";
        }
        var jine = $("#jine").val();
        if(jine != null){
            url += "jine=" + jine + "&";
        }
        var yongtu = $("#yongtu").val();
        if(yongtu != null){
            url += "yongtu=" + yongtu + "&";
        }
        var qixian = $("#qixian").val();
        if(qixian != null){
            url += "qixian=" + qixian + "&";
        }
        return url;
    }
    
    function search(){
        window.location = getParmasUrl();
    }
</script>
</head>

<body>
<%@include file="WEB-INF/inc/globalHeader.jsp" %>

<div class="Fuzzysearch">
	<div class="top Fuzzysearch1">
    	<div class="main3 padding-bt ground Loansearch3">
  <div class="credit_title">
  	<div class="credit_title"> 
    <span class="credit_title1 font_f Fuzzysearch2">玖富专业贷款搜索平台</span>
    <p>不清楚自己贷款需求？<a href="模糊搜索.html" class="Loansearch">点击此处</a>进入产品匹配推荐</p>
  </div>    
  </div>
  <table width="100%" border="1" class="Loansearch1">
  <tr>
    <th width="18%" align="right" valign="middle">职业身份：</th>
          <td width="20%"><div id="tm2008style">
	<select name="zhiye" id="zhiye">
		<option value="1">企业主</option>
		<option value="2" >个体户</option>
		<option value="3" >上班族</option>
		<option value="4" >无固定职业</option>
	</select>
</div></td>
    <th width="12%" align="right" valign="middle">贷款金额：</th>
          <td width="20%"><div id="tm2008style">
	<select name="jine" id="jine">
		<option value="3" >3万元</option>
		<option value="5" >5万元</option>
		<option value="10" >10万元</option>
		<option value="20" >20万元</option>
		<option value="50" >50万元</option>
		<option value="100" >100万元</option>
		<option value="other" >其他</option>
	</select>
</div></td>
          <td width="30%" rowspan="2" align="left" valign="middle"><a href="#"><img onclick="search()" src="images/img10.jpg" width="94" height="29" /></a></td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <th width="18%" align="right" valign="middle">贷款用途：</th>
          <td width="20%"><div id="tm2008style">
	<select name="yongtu" id="yongtu">
		<option value="1">不限</option>
		<option value="2" >经营贷款</option>
		<option value="3" >消费贷款</option>
		<option value="4" >购车贷款</option>
		<option value="5" >购房贷款</option>
	</select>
</div></td>
    <th width="12%" align="right" valign="middle">贷款期限：</th>
          <td width="20%"><div id="tm2008style">
	<select name="qixian" id="qixian">
		<option value="3m">3个月</option>
		<option value="6m" >6个月</option>
		<option value="12m" selected="selected" >12个月</option>
		<option value="2y" >2年</option>
		<option value="3y" >3年</option>
		<option value="5y" >5年</option>
		<option value="10y" >10年</option>
	</select>
</div></td>
          <td width="16%">&nbsp;</td>
  </tr>
</table>
</div>
<div class="main3 ground  Fuzzysearch6 Loansearch2 Loansearch3">
  <div class="credit_title Fuzzysearch7 Loansearch2"> 
    <span class="credit_title1 Fuzzysearch8">为您找到<em>8</em>款贷款产品，请根据你的条件进行筛选</span>
  </div>
  <div class="Fuzzysearch3">
  	<div class="Fuzzysearch4 Loansearch4 ClearFix">
    	<a href="#">清空条件</a>
    	<h1>已选条件:</h1>
        <div class="Loansearch5">
        	<div class="Loansearch6"><a href="#"><img src="images/img11.jpg" onclick="remove(this)" width="23" height="22" /></a>信用情况:<span>无信用记录</span></div>
            <div class="Loansearch6"><a href="#"><img src="images/img11.jpg" onclick="remove(this)" width="23" height="22" /></a>信用情况:<span>无信用记录</span></div>
        </div>
     </div>
  	<div class="Fuzzysearch4 ClearFix"><h1>是否有房:</h1><p><a href="#">无房</a><a href="#">有房</a><a href="#">有房已抵押</a></p></div>
    <div class="Fuzzysearch4 ClearFix"><h1>是否有车:</h1><p><a href="#">无车</a><a href="#">有车</a><a href="#">有车已抵押</a></p></div>
    <div class="Fuzzysearch4 ClearFix"><h1>信用情况:</h1><p><a href="#">无信用记录</a><a href="#">信用记录良好</a><a href="#">有少数逾期</a><a href="#">长期多次逾期</a></p></div>
    </div>
  
  
</div>
<div class="main3 ground">
  <div class="credit_title Fuzzysearch7"> 
     <div class="Loansearch7 ClearFix"><a href="#" class="Loansearch8">默认排序</a><a href="#" class="Loansearch8 Loansearch9">总利息</a><a href="#"  class="Loansearch8 Loansearch9 Loansearch10">月供</a></div>
     <div class="Loansearch21">
     	<div id="uboxstyle">
	<select name="language1" id="language">
		<option value="English"  selected="selected">English</option>
		<option value="简体中文" >简体中文</option>
		<option value="日本語" >日本語</option>
		<option value="Deutsch" >Deutsch</option>
		<option value="Espa?ol" >Espa?ol</option>
		<option value="Fran?ais" >Fran?ais</option>
		<option value="Italiano" >Italiano</option>
		<option value="Polski" >Polski</option>
		<option value="Português" >Português</option>
		<option value="Svenska" >Svenska</option>
		<option value="Türk?e" >Türk?e</option>
		<option value="Руccкий" >Руccкий</option>
	</select>
    </div>
    <div id="uboxstyle">
	<select name="language2" id="language">
		<option value="English"  selected="selected">English</option>
		<option value="简体中文" >简体中文</option>
		<option value="日本語" >日本語</option>
		<option value="Deutsch" >Deutsch</option>
		<option value="Espa?ol" >Espa?ol</option>
		<option value="Fran?ais" >Fran?ais</option>
		<option value="Italiano" >Italiano</option>
		<option value="Polski" >Polski</option>
		<option value="Português" >Português</option>
		<option value="Svenska" >Svenska</option>
		<option value="Türk?e" >Türk?e</option>
		<option value="Руccкий" >Руccкий</option>
	</select>
    </div>
    <div id="uboxstyle">
	<select name="language3" id="language">
		<option value="English"  selected="selected">English</option>
		<option value="简体中文" >简体中文</option>
		<option value="日本語" >日本語</option>
		<option value="Deutsch" >Deutsch</option>
		<option value="Espa?ol" >Espa?ol</option>
		<option value="Fran?ais" >Fran?ais</option>
		<option value="Italiano" >Italiano</option>
		<option value="Polski" >Polski</option>
		<option value="Português" >Português</option>
		<option value="Svenska" >Svenska</option>
		<option value="Türk?e" >Türk?e</option>
		<option value="Руccкий" >Руccкий</option>
	</select>
    </div>
     </div>
  </div>
  <div class="Loansearch11 ClearFix">
  	<div class="Loansearch19"><a href="产品申请.html" target="_blank"><img src="images/img18.jpg" width="94" height="29" /></a></div>
  	<div class="Loansearch12">
    	<div class="Loansearch13">
        	<h1>华夏银行</h1>
            <p><span class="Loansearch14">无需抵押</span><br /><span class="Loansearch14 Loansearch15">上班族可申请</span><br /><span class="Loansearch14 Loansearch16">5天放款</span></p>
        </div>
    	<img src="images/img13.jpg" width="42" height="42" />
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>打卡工资大于4000<br />有职业身份要求<br />对工作年限有要求</p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>利率<br />总利息<span>0.90万元</span><br /></p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p><br />有<span>205</span>人申请<br /></p>
        </div>
    </div>
  </div>
  <div class="Loansearch11 Loansearch20 ClearFix">
  	<div class="Loansearch19"><a href="产品申请.html" target="_blank"><img src="images/img18.jpg" width="94" height="29" /></a></div>
  	<div class="Loansearch12">
    	<div class="Loansearch13">
        	<h1>华夏银行</h1>
            <p><span class="Loansearch14">无需抵押</span><br /><span class="Loansearch14 Loansearch15">上班族可申请</span><br /><span class="Loansearch14 Loansearch16">5天放款</span></p>
        </div>
    	<img src="images/img13.jpg" width="42" height="42" />
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>打卡工资大于4000<br />有职业身份要求<br />对工作年限有要求</p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>利率<br />总利息<span>0.90万元</span><br /></p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p><br />有<span>205</span>人申请<br /></p>
        </div>
    </div>
  </div>
  <div class="Loansearch11 ClearFix">
  	<div class="Loansearch19"><a href="产品申请.html" target="_blank"><img src="images/img18.jpg" width="94" height="29" /></a></div>
  	<div class="Loansearch12">
    	<div class="Loansearch13">
        	<h1>华夏银行</h1>
            <p><span class="Loansearch14">无需抵押</span><br /><span class="Loansearch14 Loansearch15">上班族可申请</span><br /><span class="Loansearch14 Loansearch16">5天放款</span></p>
        </div>
    	<img src="images/img13.jpg" width="42" height="42" />
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>打卡工资大于4000<br />有职业身份要求<br />对工作年限有要求</p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>利率<br />总利息<span>0.90万元</span><br /></p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p><br />有<span>205</span>人申请<br /></p>
        </div>
    </div>
  </div>
  <div class="me_next"><a href="#"><em>1</em></a><a href="#"><em>2</em></a><a href="#"><em>3</em></a><a href="#"><em>下一页</em></a><span>共<font>66</font>个结果</span></div>
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
          <td width="7%"><a href="产品申请.html" target="_blank">查看</a></td>
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
</div>

<%@include file="WEB-INF/inc/globalFooterMenu.jsp" %>
<%@include file="WEB-INF/inc/globalFooter.jsp" %>
</body>
</html>
