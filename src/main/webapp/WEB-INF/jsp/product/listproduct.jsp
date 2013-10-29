<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款产品</title>
<%@include file="../../inc/globalScript.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
        $(".smallItem").on("onchange", function(){
        	search();
       	});
	});	
	
	setTimeout('_magicTimeout()',20*1000);
    function _magicTimeout(){
	   $('.time_box').hide();
    }	
    
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
        	$("<div class=\"Loansearch6\" data=\"estate\" value=\"" + estate + "\"><a><img src=\"images/img11.jpg\" onclick=\"removeSelected(this)\" width=\"23\" height=\"22\"/></a>" + $($("#estate p a")[estate]).attr("catalog") + ": <span>" + $($("#estate p a")[estate]).attr("vname") + "</span></div>").appendTo("#selectedString");
        }
        
        var vehicle = $.getUrlParam('vehicle');
        if(vehicle != null){
        	$("#vehicle").css("display","none");
        	$("<div class=\"Loansearch6\" data=\"vehicle\" value=\"" + vehicle + "\"><a><img src=\"images/img11.jpg\" onclick=\"removeSelected(this)\" width=\"23\" height=\"22\"/></a>" + $($("#vehicle p a")[vehicle]).attr("catalog") + ": <span>" + $($("#vehicle p a")[vehicle]).attr("vname") + "</span></div>").appendTo("#selectedString");
        }
        
        var credit = $.getUrlParam('credit');
        if(credit != null){
        	$("#credit").css("display","none");
        	$("<div class=\"Loansearch6\" data=\"credit\" value=\"" + credit + "\"><a><img src=\"images/img11.jpg\" onclick=\"removeSelected(this)\" width=\"23\" height=\"22\"/></a>" + $($("#credit p a")[credit]).attr("catalog") + ": <span>" + $($("#credit p a")[credit]).attr("vname") + "</span></div>").appendTo("#selectedString");
        }
        
        var orderRate = $.getUrlParam('orderRate');
        if(orderRate != null){
        	$($("#orderBy a")[0]).removeClass("insort");
        	$($("#orderBy a")[0]).addClass("noinsort");
        	$($("#orderBy a")[1]).removeClass("noinsort");
        	$($("#orderBy a")[1]).addClass("insort");
        	$($("#orderBy a")[1]).attr("value",orderRate);
        	if (orderRate == 1){
        		$($("#orderBy a")[1]).addClass("sortDown");
        	}
        }
        var orderMonthly = $.getUrlParam('orderMonthly');
		if(orderMonthly != null){
			$($("#orderBy a")[0]).removeClass("insort");
	    	$($("#orderBy a")[0]).addClass("noinsort");
	    	$($("#orderBy a")[2]).removeClass("noinsort");
        	$($("#orderBy a")[2]).addClass("insort");
        	$($("#orderBy a")[2]).attr("value",orderMonthly);
			if (orderMonthly == 1){
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
        var url = "queryProduct?";
        
        $(".formItem").each(function(){
        	var val = $(this).val();
        	if(val){
        		if($(this).attr("id") == "loanAmt"){
        			url += "loanAmt=" + ($("#select_info_loanAmt").val() + "").replace("万元","") + "&";
        		}else{
        			url += $(this).attr("id") + "=" + val + "&";
        		}
        	}
        });
        
        $("#selectedString div").each(function(){
        	var val = $(this).attr("value");
        	if (val) {
        		url += $(this).attr("data") + "=" + val + "&";
        	}
        });
        
        $(".insort").each(function(){
        	var val = $(this).attr("value");
        	if (val) {
        		url += $(this).attr("data") + "=" + val + "&";
        	}
        }); 

        $(".currentPager").each(function(){
        	var val = $(this).attr("value");
        	if (val) {
        		url += $(this).attr("data") + "=" + val + "&";
        	}
        }); 
        return url;
    }
    
    function search(){
        window.location = getParmasUrl();
    }
    var removeSelected = function(target){
    	var key = $(target).parent().parent().attr("data");
    	$("#" + key).css("display","inline-block");
    	$($(target).parent().parent()).remove();
    	search();
    }
    function clearAll(){
    	$("#selectedString").html("");
    	search();
    }
    function add(target, key, value){
    	$("#" + key).css("display","none");
    	$("<div class=\"Loansearch6\" data=\"" + key + "\" value=\"" + value + "\"><img src=\"images/img11.jpg\" onclick=\"removeSelected(this)\" width=\"23\" height=\"22\"/>" + $(target).attr("catalog") + ": <span>" + $(target).attr("vname") + "</span></div>").appendTo("#selectedString");
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
    function openNewWin(suffix) {
    	var url = document.location.href.replace('queryProduct','productView');
    	var endChar = url.substring(url.length-1);
    	if (endChar == '#') 
    		url = url.substring(0, url.length-1);
    	if (url.indexOf("?") > 0) 
    		url = url + (endChar == '&' ? '' : '&') + suffix;
    	else 
    		url = url + '?' + suffix;
    	window.open(url);
    }
</script>
</head>

<body>
<jsp:include page="../../inc/globalHeader.jsp">
	<jsp:param name="index" value="2" />
</jsp:include>

<div class="Fuzzysearch">
	<div class="top Fuzzysearch1">
    	<div class="main3 padding-bt ground Loansearch3">
  <div class="credit_title">
  	<div class="credit_title"> 
    <span class="credit_title1 font_f Fuzzysearch2">玖富专业贷款搜索平台</span>
    <p>不清楚自己贷款需求？<a href="matchProduct" class="Loansearch">点击此处</a>进入产品匹配推荐</p>
  </div>    
  </div>
  <table width="100%" border="1" class="Loansearch1">
  <tr>
    <th width="18%" align="right" valign="middle">职业身份：</th>
          <td width="20%"><div id="tm2008style">
	<select name="identity" id="identity" class="formItem" readonly="true">
		<option value="">不限职业</option>
		<option value="1">企业主</option>
		<option value="2" >个体户</option>
		<option value="3" >上班族</option>
	</select>
</div></td>
    <th width="12%" align="right" valign="middle">贷款金额：</th>
          <td width="20%"><div id="tm2008style2">
	<select name="loanAmt" id="loanAmt" class="formItem">
		<option value="">请选择</option>
		<option value="3" >3</option>
		<option value="5" >5</option>
		<option value="10" >10</option>
		<option value="20" >20</option>
		<option value="50" >50</option>
		<option value="100" >100</option>
		<option value="" >其他</option>
	</select>
</div></td>
          <td width="30%" rowspan="2" align="left" valign="middle"><a href="#"><img onclick="search()" src="images/img10.jpg" width="94" height="29" /></a></td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <th width="18%" align="right" valign="middle">贷款用途：</th>
          <td width="20%"><div id="tm2008style">
	<select name="loanUse" id="loanUse" class="formItem" readonly="true">
		<option value="">请选择</option>
		<option value="0">不限</option>
		<option value="1" >经营贷款</option>
		<option value="2" >消费贷款</option>
		<option value="3" >购车贷款</option>
		<option value="4" >购房贷款</option>
	</select>
</div></td>
    <th width="12%" align="right" valign="middle">贷款期限：</th>
          <td width="20%"><div id="tm2008style">
	<select name="loanIssue" id="loanIssue" class="formItem" readonly="true">
		<option value="">请选择</option>
		<option value="3">3个月</option>
		<option value="6">6个月</option>
		<option value="12">12个月</option>
		<option value="24">2年</option>
		<option value="36">3年</option>
		<option value="60">5年</option>
		<option value="120">10年</option>
	</select>
</div></td>
          <td width="16%">&nbsp;</td>
  </tr>
</table>
</div>
<div class="main3 ground  Fuzzysearch6 Loansearch2 Loansearch3">
  <div class="credit_title Fuzzysearch7 Loansearch2"> 
    <span class="credit_title1 Fuzzysearch8">为您找到<em>${pvs.totalRecords}</em>款贷款产品，请根据你的条件进行筛选</span>
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
     <a class="Loansearch8 Loansearch9" onclick="addOrder(this)" data="orderRate" value="0">总利息</a>
     <a class="Loansearch8 Loansearch9 Loansearch10" onclick="addOrder(this)" data="orderMonthly" value="0">月供</a></div>
     <div class="Loansearch21">
     	<div id="uboxstyle">
	<select name="issueType" id="issueType" class="formItem smallItem">
		<option value="">不限机构类型</option>
		<option value="0">银行</option>
		<option value="1">9F小微金融直通车</option>
		<option value="2">其他</option>
	</select>
    </div>
    <div id="uboxstyle">
	<select name="guarantyType" id="guarantyType" class="formItem smallItem">
		<option value="">不限抵押类型</option>
		<option value="3">房屋抵押</option>
		<option value="2">车辆抵押</option>
		<option value="5">其他抵押</option>
		<option value="0">不需要抵押</option>
	</select>
    </div>
    <div id="uboxstyle">
	<select name="repayType" id="repayType" class="formItem smallItem">
		<option value="">不限还款方式</option>
		<!--
		<option value="0">分期还款</option>
		<option value="1">到期还款</option>
		<option value="2">随借随还</option>
		-->
	</select>
    </div>
     </div>
  </div>
  
  <c:forEach var="pv" items="${pvs.items}">
  <div class="Loansearch11 ClearFix">
  	<div class="Loansearch19"><a style="cursor: pointer; cursor:hand" onclick="javascript:openNewWin('productId=${pv.product.id}')"><img src="images/img18.jpg" width="94" height="29" /></a></div>
  	<div class="Loansearch12">
    	<div class="Loansearch13">
        	<h1>${pv.product.issueOrgan} - ${pv.product.name}</h1>
            <p>
            	<span class="Loansearch14">
            	<fmt:bundle basename="dict/dict-mapping" prefix="PRD_GRNT_TYPE.">
            		<fmt:message key="${pv.product.guarantyType}" />
				</fmt:bundle>
            	</span><br />
            	<span class="Loansearch14 Loansearch15">
            	<fmt:bundle basename="dict/dict-mapping" prefix="PRD_IDENTITY.">
	            	<c:set var="hasIden" value="0" />
	            	<c:forTokens var="iden" items="${pv.attach.identity}" delims="|">
	            		<c:if test="${not empty iden}">
	            			<c:if test="${hasIden == '1'}">,</c:if>
	            			<fmt:message key="${iden}" />
	            			<c:set var="hasIden" value="1" />
	            		</c:if>
	            	</c:forTokens>
				</fmt:bundle>
            	</span><br />
            	<span class="Loansearch14 Loansearch16">${pv.product.paidDays}天放款</span>
            </p>
        </div>
    	<img src="images/organ/${pv.product.icon}" width="42" height="42" />
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>${pv.product.desc}</p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>
            	利率: <fmt:formatNumber type="percent" pattern="0.00%" value="${pv.product.intrRate}" /><br />
            	总利息: <fmt:formatNumber pattern="#,##0.00" value="${pv.interest}" /><span> 万元</span><br />
            </p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p><br />有<span>${pv.numOrders}</span>人申请<br /></p>
        </div>
    </div>
  </div>
  </c:forEach>
  
  <div class="me_next">
  <c:forEach var="i" begin="1" end="${pvs.totalPages}" step="1">
	<a onclick="pager(this)" data="pageIndex" value="${i}" <c:if test="${i == pvs.pageIndex}">class="currentPager"</c:if>><em>${i}</em></a>
  </c:forEach>
  <span>共<font>${pvs.totalRecords}</font>个结果</span></div>
  </div>
<div class="main3 ground  Fuzzysearch6">
  <div class="credit_title"> 
    <span class="credit_title1 font_f">热门贷款推荐</span>
  </div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		<c:forEach var="hrp" items="${hotRcdProds}">
		<tr>
			<td width="8%"><img src="images/organ/${hrp.icon}" width="40" height="21" /></td>
			<td width="20%">${hrp.name}</td>
			<td width="65%">${hrp.desc}</td>
			<td width="7%"><a href="viewProduct?productId=${hrp.id}" target="_blank">查看</a></td>
		</tr>
		</c:forEach>
	</table>
</div>
    </div>
</div>

<%@include file="../../inc/globalFooterMenu.jsp" %>
<%@include file="../../inc/globalFooter.jsp" %>
<script type="text/javascript">
	setParams();
</script>
</body>
</html>
