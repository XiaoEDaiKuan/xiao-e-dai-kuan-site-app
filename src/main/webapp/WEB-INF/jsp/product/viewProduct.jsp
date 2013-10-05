<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款申请</title>
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

<script type="text/javascript">
	$(document).ready(function() {
		<%if(request.getSession().getAttribute("custName") == null){%>
		$("#pop_login").click(function(){
			tipsWindown("您当前尚未登录，若想要申请贷款，请先登录。","iframe:iframe:loginForm","450","320","true","","false","text","");
		});
		<%}else{%>
		$("#pop_login").click(function(){
			tipsWindown("请填写贷款信息","iframe:iframe:requestProductInfo?productId=${prod.product.id}","450","215","true","","false","text","");
		});
		<%}%>
	});	
</script>

</head>

<body>

<jsp:include page="../../inc/globalHeader.jsp">
	<jsp:param name="index" value="2" />
</jsp:include>

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
      <div class="credit_title"> <span class="credit_title1 font_f">${prod.product.issueOrgan} - ${prod.product.name}</span></div>
      <div class="applicationleft1 ClearFix">
      	<ul class="applicationleft4">
      		<li>贷款金额 
      		<span>
      		<fmt:formatNumber pattern="#0.#" value="${prod.minLoanAmt div 10000}"/> - 
      		<fmt:formatNumber pattern="#0.#" value="${prod.maxLoanAmt div 10000}"/>
      		</span>万元</li>
            <li>期限 <span>${prod.minLoanIssue} - ${prod.maxLoanIssue}</span> 月</li>
            <li>利率说明: 月利率 <span><fmt:formatNumber type="percent" pattern="0.00%" value="${prod.product.intrRate}" /></span></li>
            <li>提前还款说明</li>
        </ul>
      	<div class="applicationleft2"><img src="images/img19.jpg" width="110" height="67" /></div>
        <div class="Loansearch13 applicationleft3">
            <p>
            <span class="Loansearch14">
           	<fmt:bundle basename="dict/dict-mapping" prefix="PRD_GRNT_TYPE.">
           		<fmt:message key="${prod.product.guarantyType}" />
			</fmt:bundle>
			</span><br />
            <span class="Loansearch14 Loansearch15">
            <fmt:bundle basename="dict/dict-mapping" prefix="PRD_IDENTITY.">
	            	<c:set var="hasIden" value="0" />
	            	<c:forTokens var="iden" items="${prod.identity}" delims="|">
	            		<c:if test="${not empty iden}">
	            			<c:if test="${hasIden == '1'}">,</c:if>
	            			<fmt:message key="${iden}" />
	            			<c:set var="hasIden" value="1" />
	            		</c:if>
	            	</c:forTokens>
				</fmt:bundle>
            </span><br />
            <span class="Loansearch14 Loansearch16">${prod.product.paidDays}天放款</span>
            </p>
            <a href="#"><img src="images/img21.jpg" width="94" height="29" id="pop_login" /></a>
        </div>
      </div>
    </div>
    <div class="credit ground  applicationleft13">
  <div class="credit_title Fuzzysearch7"> 
    <div class="credit_title font_f Fuzzysearch2 applicationleft5"> <span>贷款须知</span><a href="#" data="${prod.product.id}"  id="pop_save">保存此内容到我的邮箱</a> </div>
  </div>
  <div class="applicationleft6">
  	<div class="applicationleft7">
    	<h1>申请条件</h1>
        <p>${prod.product.appReq}</p>
    </div>
    <div class="applicationleft7">
    	<h1>所需材料</h1>
        <p>${prod.product.appMaterial}</p>
    </div>
    <div class="applicationleft7">
    	<h1>利率说明</h1>
        <p>${prod.product.intrDesc}</p>
    </div>
    <div class="applicationleft7 applicationleft8">
    	<h1>常见问题</h1>
    	<c:forEach var="q" items="${questions}">
        <div class="applicationleft9">
        	<div class="applicationleft10"><span>${q.askTime}</span><p>问题: ${q.detail}</p></div>
        	<c:forEach var="a" items="${q.answers}">
            <div class="applicationleft10 applicationleft11">
            	<span><fmt:formatDate value="${a.answerTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
            	<p>回答: ${a.answerContent}</p>
            </div>
        	</c:forEach>
        </div>
    	</c:forEach>
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
  <%@include file="../../inc/productInRow.jsp" %>
</div>
    </div>
</div>

<%@include file="../../inc/globalFooterMenu.jsp" %>
<%@include file="../../inc/globalFooter.jsp" %>
</body>
</html>
 