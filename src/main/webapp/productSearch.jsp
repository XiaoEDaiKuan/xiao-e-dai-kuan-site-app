<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>贷款产品</title>
<%@include file="WEB-INF/inc/globalScript.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
        $(".smallItem").on("onchange", function(){
        	search();
       	});
	});	
    
    function setParams(){
        $(".formItem").each(function(){
        	var _id = $(this).attr("id");
        	if($.getUrlParam(_id) != null){
        		$(this).val($.getUrlParam(_id));
        	}
        });
        
        ////////////////////////////
        
        var estate = $.getUrlParam('estate');
        if(estate != null){
        	$("#estate").css("display","none");
        	$("<div class=\"Loansearch6\" data=\"estate\" value=\"" + estate + "\"><a><img src=\"images/img11.jpg\" onclick=\"remove(this)\" width=\"23\" height=\"22\"/></a>" + $($("#estate p a")[estate]).attr("catalog") + ": <span>" + $($("#estate p a")[estate]).attr("vname") + "</span></div>").appendTo("#selectedString");
        }
        
        var vehicle = $.getUrlParam('vehicle');
        if(vehicle != null){
        	$("#vehicle").css("display","none");
        	$("<div class=\"Loansearch6\" data=\"vehicle\" value=\"" + vehicle + "\"><a><img src=\"images/img11.jpg\" onclick=\"remove(this)\" width=\"23\" height=\"22\"/></a>" + $($("#vehicle p a")[vehicle]).attr("catalog") + ": <span>" + $($("#vehicle p a")[vehicle]).attr("vname") + "</span></div>").appendTo("#selectedString");
        }
        
        var credit = $.getUrlParam('credit');
        if(credit != null){
        	$("#credit").css("display","none");
        	$("<div class=\"Loansearch6\" data=\"credit\" value=\"" + credit + "\"><a><img src=\"images/img11.jpg\" onclick=\"remove(this)\" width=\"23\" height=\"22\"/></a>" + $($("#credit p a")[credit]).attr("catalog") + ": <span>" + $($("#credit p a")[credit]).attr("vname") + "</span></div>").appendTo("#selectedString");
        }
        
        var orderLx = $.getUrlParam('orderLx');
        if(orderLx != null){
        	$($("#orderBy a")[0]).removeClass("insort");
        	$($("#orderBy a")[0]).addClass("noinsort");
        	$($("#orderBy a")[1]).removeClass("noinsort");
        	$($("#orderBy a")[1]).addClass("insort");
        	$($("#orderBy a")[1]).attr("value",orderLx);
        	if (orderLx == 1){
        		$($("#orderBy a")[1]).addClass("sortDown");
        	}
        }
        var orderYg = $.getUrlParam('orderYg');
		if(orderYg != null){
			$($("#orderBy a")[0]).removeClass("insort");
	    	$($("#orderBy a")[0]).addClass("noinsort");
	    	$($("#orderBy a")[2]).removeClass("noinsort");
        	$($("#orderBy a")[2]).addClass("insort");
        	$($("#orderBy a")[2]).attr("value",orderYg);
			if (orderYg == 1){
				$($("#orderBy a")[2]).addClass("sortDown");
        	}
        }
		
		var pageIndex = $.getUrlParam('pageIndex');
		if(pageIndex != null){
			pageIndex = parseInt(pageIndex) - 1;
			$(".me_next a").removeClass("currentPager");
	    	$($(".me_next a")[pageIndex]).addClass("currentPager");
		}
    }
    
    function getParmasUrl(){
        var url = "productSearch.jsp?";
        
        $(".formItem").each(function(){
        	var val = $(this).val();
        	if(val != null){
        		url += $(this).attr("id") + "=" + val + "&";
        	}
        });
        
        $("#selectedString div").each(function(){
        	url += $(this).attr("data") + "=" + $(this).attr("value") + "&";
        });
        
        $(".insort").each(function(){
        	url += $(this).attr("data") + "=" + $(this).attr("value") + "&";
        }); 

        $(".currentPager").each(function(){
        	url += $(this).attr("data") + "=" + $(this).attr("value") + "&";
        }); 
        return url;
    }
    
    function search(){
        window.location = getParmasUrl();
    }
    function remove(target){
    	var key = $(target).parent().parent().attr("data");
    	$("#" + key).css("display","inline-block");
    	$(target).parent().parent().remove();
    	search();
    }
    function clearAll(){
    	$("#selectedString").html("");
    	search();
    }
    function add(target, key, value){
    	$("#" + key).css("display","none");
    	$("<div class=\"Loansearch6\" data=\"" + key + "\" value=\"" + value + "\"><a><img src=\"images/img11.jpg\" onclick=\"remove(this)\" width=\"23\" height=\"22\"/></a>" + $(target).attr("catalog") + ": <span>" + $(target).attr("vname") + "</span></div>").appendTo("#selectedString");
    	search();
    }
    
    function removeOrder(){
    	$("#orderBy a").removeClass("noinsort");
    	$("#orderBy a").removeClass("insort");
    	search();
    }
    function addOrder(target){
    	$($("#orderBy a")[0]).removeClass("insort");
    	$($("#orderBy a")[0]).addClass("noinsort");
    	$(target).toggleClass("sortDown");
    	$(target).removeClass("noinsort");
    	$(target).addClass("insort");
    	if ($(target).hasClass("sortDown")){
    		$(target).attr("value","1");
    	}else{
    		$(target).attr("value","0");
    	}
    	search();
    }
    function pager(target){
    	$(".me_next a").removeClass("currentPager");
    	$(target).addClass("currentPager");
    	search();
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
    <p>不清楚自己贷款需求？<a href="mohuSearch.jsp" class="Loansearch">点击此处</a>进入产品匹配推荐</p>
  </div>    
  </div>
  <table width="100%" border="1" class="Loansearch1">
  <tr>
    <th width="18%" align="right" valign="middle">职业身份：</th>
          <td width="20%"><div id="tm2008style">
	<select name="zhiye" id="zhiye" class="formItem">
		<option value="1">企业主</option>
		<option value="2" >个体户</option>
		<option value="3" >上班族</option>
		<option value="4" >无固定职业</option>
	</select>
</div></td>
    <th width="12%" align="right" valign="middle">贷款金额：</th>
          <td width="20%"><div id="tm2008style">
	<select name="jine" id="jine" class="formItem">
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
	<select name="yongtu" id="yongtu" class="formItem">
		<option value="1">不限</option>
		<option value="2" >经营贷款</option>
		<option value="3" >消费贷款</option>
		<option value="4" >购车贷款</option>
		<option value="5" >购房贷款</option>
	</select>
</div></td>
    <th width="12%" align="right" valign="middle">贷款期限：</th>
          <td width="20%"><div id="tm2008style">
	<select name="qixian" id="qixian" class="formItem">
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
    	<a onclick="clearAll()" style="cursor: pointer;cursor: hand">清空条件</a>
    	<h1>已选条件:</h1>
        <div class="Loansearch5" id="selectedString">
        	
        </div>
     </div>
  	<div class="Fuzzysearch4 ClearFix" id="estate"><h1>是否有房:</h1><p>
  	<a onclick="add(this,'estate',0)" catalog="是否有房" vname="无房">无房</a>
  	<a onclick="add(this,'estate',1)" catalog="是否有房" vname="有房">有房</a>
  	<a onclick="add(this,'estate',2)" catalog="是否有房" vname="有房已抵押">有房已抵押</a></p></div>
    <div class="Fuzzysearch4 ClearFix" id="vehicle"><h1>是否有车:</h1><p>
    <a onclick="add(this,'vehicle',0)" catalog="是否有车" vname="无车">无车</a>
    <a onclick="add(this,'vehicle',1)" catalog="是否有车" vname="有车">有车</a>
    <a onclick="add(this,'vehicle',2)" catalog="是否有车" vname="有车已抵押">有车已抵押</a></p></div>
    <div class="Fuzzysearch4 ClearFix" id="credit"><h1>信用情况:</h1><p>
    <a onclick="add(this,'credit',0)" catalog="信用情况" vname="无信用记录">无信用记录</a>
    <a onclick="add(this,'credit',1)" catalog="信用情况" vname="信用记录良好">信用记录良好</a>
    <a onclick="add(this,'credit',2)" catalog="信用情况" vname="有少数逾期">有少数逾期</a>
    <a onclick="add(this,'credit',3)" catalog="信用情况" vname="长期多次逾期">长期多次逾期</a></p></div>
    </div>
  
  
</div>
<div class="main3 ground">
  <div class="credit_title Fuzzysearch7"> 
     <div class="Loansearch7 ClearFix" id="orderBy"><a class="Loansearch8" onclick="removeOrder()">默认排序</a>
     <a class="Loansearch8 Loansearch9" onclick="addOrder(this)" data="orderLx" value="0">总利息</a>
     <a class="Loansearch8 Loansearch9 Loansearch10" onclick="addOrder(this)" data="orderYg" value="0">月供</a></div>
     <div class="Loansearch21">
     	<div id="uboxstyle">
	<select name="language1" id="language1" class="formItem smallItem">
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
	<select name="language2" id="language2" class="formItem smallItem">
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
	<select name="language3" id="language3" class="formItem smallItem">
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
  <div class="me_next">
  <a onclick="pager(this)" data="pageIndex" value="1" class="currentPager"><em>1</em></a>
  <a onclick="pager(this)" data="pageIndex" value="2"><em>2</em></a>
  <a onclick="pager(this)" data="pageIndex" value="3"><em>3</em></a>
  <span>共<font>66</font>个结果</span></div>
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
<script type="text/javascript">
	setParams();
</script>
</body>
</html>
