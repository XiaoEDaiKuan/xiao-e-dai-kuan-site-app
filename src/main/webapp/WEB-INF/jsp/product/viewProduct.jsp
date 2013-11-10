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
		<c:if test="${empty sessionScope.custName}">
		$("#pop_login").click(function(){
			tipsWindown("请填写贷款信息（如未登录，请先登录）","iframe:iframe:loginForm?productId=${prod.product.id}","450","300","true","","false","text","");
		});
		</c:if>
		<c:if test="${not empty sessionScope.custName}">
		$("#pop_login").click(function(){
			tipsWindown("请填写贷款信息","iframe:iframe:requestProductInfo?productId=${prod.product.id}","450","300","true","","false","text","");
		});
		</c:if>
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
               <!-- 贷款助手 -->
			<%@include file="../../inc/daikuanTools.jsp"%>
    		<div class="strategy ground">
			<%@include file="../../inc/gonglueList.jsp"%>
			</div>
            </div>
        	<div class="applicationleft">
            	<div class="credit ground Loansearch3 clear">
      <div class="credit_title"> <span class="credit_title1 font_f">${prod.product.issueOrgan} - ${prod.product.name}</span></div>
      <div class="applicationleft1 ClearFix">
      	<ul class="applicationleft4">
      		<li>贷款金额 
      		<span>
      		<c:choose>
      			<c:when test="${prod.minLoanAmt eq prod.maxLoanAmt}">
      				<fmt:formatNumber pattern="#0.#" value="${prod.minLoanAmt div 10000}"/>
      			</c:when>
      			<c:otherwise>
		      		<fmt:formatNumber pattern="#0.#" value="${prod.minLoanAmt div 10000}"/> - 
		      		<fmt:formatNumber pattern="#0.#" value="${prod.maxLoanAmt div 10000}"/>
      			</c:otherwise>
      		</c:choose>
      		</span>万元</li>
      		
            <li>期限 
            <span>
      		<c:choose>
      			<c:when test="${prod.minLoanIssue eq prod.maxLoanIssue}">
      				${prod.minLoanIssue}
      			</c:when>
      			<c:otherwise>
            		${prod.minLoanIssue} - ${prod.maxLoanIssue}
      			</c:otherwise>
      		</c:choose>
            </span>个月</li>

            <li>利率说明: 月利率<span>
            <c:choose>
	            <c:when test="${empty prod.product.intrRate}"></c:when>
	            <c:otherwise><fmt:formatNumber type="percent" pattern="0.00%" value="${prod.product.intrRate}" /></c:otherwise>
            </c:choose>
            </span></li>
            <li>提前还款说明</li>
        </ul>
      	<div class="applicationleft2"><img src="images/products/110x65/${prod.product.icon}" width="110" height="65" /></div>
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
		<ul class="homequestion_list">
		<c:forEach var="q" items="${questions.items}">
		<li>
			<div onclick="showQuestion('Q_${q.id}')" style="cursor: pointer;display: block;color:#727171">${q.detail} 
				<span style="float:right"><fmt:formatDate value="${q.askTime}" pattern="yyyy-MM-dd" /></span>
			</div>
		</li>
		<li id="Q_${q.id}" style="display:none;background-color:#f2f7fd">
			<c:forEach var="a" items="${q.answers}" varStatus="ast">
				<c:if test="${ast.index == 0}">&nbsp;<a href="viewAnswer?id=${q.id}" style="display:block;background-color:#f2f7fd" target="_blank" >答: ${a.answerContent}</a></c:if>
			</c:forEach>
		</li>
	    </c:forEach>
    	</ul>
    	
	    <div>
        <div class="applicationleft12" style="float:left">
        	<a href="#" id="pop_question"><img src="images/img25.jpg" width="94" height="29" /></a>
        </div>
		<div class="me_next">
		<c:forEach var="i" begin="1" end="${questions.totalPages}" step="1">
			<a href="?pageIndex=${i}&productId=${prod.product.id}" <c:if test="${i == questions.pageIndex}">class="currentPager"</c:if>><em>${i}</em></a>
		</c:forEach>
		</div>
        </div>
    </div>
  </div>
</div>
            </div>
            
        </div>
<div class="main3 ground  Fuzzysearch6">
	<div class="credit_title"> 
		<span class="credit_title1 font_f">热门贷款推荐</span>
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		<c:forEach var="hrp" items="${hotRcdProds}">
		<tr>
			<td width="8%"><img src="images/products/40x20/${hrp.icon}" width="40" height="20" /></td>
			<td width="20%">${hrp.name}</td>
			<td width="65%">${hrp.desc}</td>
			<td width="7%"><a href="?productId=${hrp.id}" target="_blank">查看</a></td>
		</tr>
		</c:forEach>
	</table>
</div>
    </div>
</div>

<%@include file="../../inc/globalFooterMenu.jsp" %>
<%@include file="../../inc/globalFooter.jsp" %>
</body>
</html>
 
