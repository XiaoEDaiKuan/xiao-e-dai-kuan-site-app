<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>首页</title>
<%@include file="../inc/globalScript.jsp" %>
</head>
<body>
<jsp:include page="../inc/globalHeader.jsp">
	<jsp:param name="index" value="1" />
</jsp:include>
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
	<select name="identity" id="identity" class="proSearch" readonly="true">
		<option value="">不限职业</option>
		<option value="1">企业主</option>
		<option value="2" >个体户</option>
		<option value="3" >上班族</option>
	</select>
</div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th>贷款用途：</th>
          <td><div id="tm2008style">
	<select name="loanUse" id="loanUse" class="proSearch"  readonly="true">
		<option value="">请选择</option>
		<option value="0">不限</option>
		<option value="1" >经营贷款</option>
		<option value="2" >消费贷款</option>
		<option value="3" >购车贷款</option>
		<option value="4" >购房贷款</option>
	</select>
</div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th>贷款金额：</th>
          <td><div id="tm2008style2">
	<select name="loanAmt" id="loanAmt" class="proSearch">
		<option value="3" >3</option>
		<option value="5" >5</option>
		<option value="10" >10</option>
		<option value="20" >20</option>
		<option value="50" >50</option>
		<option value="100" >100</option>
		<option value="" >其他</option>
	</select>
</div></td>
          <td>不足1万可用小数表示</td>
        </tr>
        <tr>
          <th>贷款期限：</th>
          <td><div id="tm2008style">
	<select name="loanIssue" id="loanIssue" class="proSearch"  readonly="true">
		<option value="3">3个月</option>
		<option value="6" >6个月</option>
		<option value="12">12个月</option>
		<option value="24" >2年</option>
		<option value="36" >3年</option>
		<option value="60" >5年</option>
		<option value="120" >10年</option>
	</select>
</div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input name="" type="button" value="" class="btn1" onclick="searchProduct()" /></td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </div>
  </div>
</div>
<div class="main1">
  <ul>
    <li class="short"><a href="quickloan" target="_blank"><b>快速贷款专区</b><br />
      资金要得急 还款期限短</a></li>
    <li class="high"><a href="incramt" target="_blank"><b>提高额度专区</b><br />
      分级评分 逐级增加额度</a></li>
    <li class="pos"><a href="posloan" target="_blank"><b>POS贷款专区</b><br />
      POS流水评估 简便贷款</a></li>
    <li class="loan"><a><b>提现卡专区</b><br />
      即将上线 尽请期待</a></li>
  </ul>
</div>
<div class="main2">
  <div class="main2_left">
    <div class="credit ground">
      <div class="credit_title"> <span class="credit_title1 font_f">热门信用贷款</span> <span class="credit_title2">无需抵押 担保</span> <a target="_blank" href="queryProduct">更多信用贷款</a> </div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		<c:forEach var="hcrProd" items="${hcrProds.items}">
		<tr>
          <td width="11%"><img src="images/organ/${hcrProd.icon}" width="40" height="21" /></td>
          <td width="18%">${hcrProd.name}</td>
          <td width="61%">${hcrProd.desc}</td>
          <td width="10%"><a href="viewProduct?productId=${hcrProd.id}" target="_blank">查看</a></td>
        </tr>
		</c:forEach>
      </table>
    </div>
    <div class="credit ground">
      <div class="credit_title"> <span class="credit_title1 font_f">热门特色贷款</span></div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		<c:forEach var="hchProd" items="${hchProds.items}">
		<tr>
          <td width="11%"><img src="images/organ/${hchProd.icon}" width="40" height="21" /></td>
          <td width="18%">${hchProd.name}</td>
          <td width="61%">${hchProd.desc}</td>
          <td width="10%"><a href="viewProduct?productId=${hchProd.id}" target="_blank">查看</a></td>
        </tr>
		</c:forEach>
      </table>
    </div>
  </div>
  <div class="main2_right">
    <div class="ad1"><a href="productView?&productId=7" target="_blank"></a></div>
    <div class="sina">
      <div class="sina_border">
      <div class="sina1"><a href="http://e.weibo.com/jiufutougu?ref=http%3A%2F%2Fwww.9fgroup.com%2F" target="_blank" class="sina2"></a><p>平台微博加关注</p></div>
      <div class="sina1"><a href="#" class="weixin"></a><p>平台微信二维码</p></div> 
      </div>   
    </div>
    <%@include file="../inc/daikuanTools.jsp"%>
    <%@include file="../inc/scrollTools.jsp"%>
  </div>
</div>
<div class="main3 padding-bt ground">
  <div class="credit_title"> 
    <span class="credit_title1 font_f">云金融平台</span>
    <p>9大总行 10多家区域银行 17处小微金融服务中心 覆盖28区的云金融网络</p>
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
<div class="main4">
  <div class="ask ground">
    <div class="credit_title"> <span class="credit_title1 font_f">大家都在问</span> <!--<a target="_blank" href="ask">更多问题</a>-->
    <input name="" type="button" value="我要提问" id="pop_question" /> </div>
    <ul class="homequestion_list">
    <c:forEach var="hiQust" items="${hiQusts.items}">
      <!--li><a href="viewAnswer?id=${hiQust.id}" target="_blank"></a></li-->
      <li><div onclick="showQuestion('Q_${hiQust.id}')" style="cursor: pointer;display: block;color:#727171">${hiQust.detail} 
      	<span style="float:right"><fmt:formatDate value="${hiQust.askTime}" pattern="yyyy-MM-dd" /></span></div></li>
    		<li id="Q_${hiQust.id}" style="display:none;background-color:#f2f7fd">
    		<c:forEach var="a" items="${hiQust.answers}" varStatus="ast">
				<c:if test="${ast.index == 0}"><a href="viewAnswer?id=${hiQust.id}" style="display:block;background-color:#f2f7fd" target="_blank" >答: ${a.answerContent}</a></c:if>&nbsp;
			</c:forEach>
			</li>
    </c:forEach>
    </ul>
    <div style="clear:both"></div>
  </div>
  <div class="strategy ground">
  <%@include file="../inc/gonglueList.jsp"%>
  </div> 
</div>
<%@include file="../inc/globalFooterMenu.jsp" %>
<%@include file="../inc/globalFooter.jsp" %>
</body>
</html>
