<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款产品</title>
<%@include file="../../inc/globalScript.jsp" %>
</head>

<body>
<div class="main3 ground"  style="background:#FFFFFF;border:solid #EFEFEF 1px">
<c:forEach var="pv" items="${pvs.items}">
  <div class="Loansearch11 ClearFix">
  	<div class="Loansearch19">
  	<c:choose>
  		<c:when test="${not empty pv.product.linkUrl}">
  			<a href="${pv.product.linkUrl}" target="_blank"><img src="images/img18.jpg" width="94" height="29" /></a>
  		</c:when>
  		<c:otherwise>
  			<a style="cursor: pointer; cursor:hand" onclick="javascript:top.document.location.href='viewProduct?productId='+${pv.product.id}" target="_top"><img src="images/img18.jpg" width="94" height="29" /></a>
  		</c:otherwise>
  	</c:choose>
  	</div>
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
    	<img src="images/products/40x40/${pv.product.icon}" width="40" height="40" />
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>${pv.product.desc}</p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>
			<c:if test="${empty pv.product.intrRate}">
				利率: 面议<br/>
				总利息: 面议<br/>
			</c:if>
			<c:if test="${not empty pv.product.intrRate}">
            	利率: <fmt:formatNumber type="percent" pattern="0.00%" value="${pv.product.intrRate}" /><br />
            	总利息: <fmt:formatNumber pattern="#,##0.00" value="${pv.interest}" /><span> 万元</span><br />
			</c:if>
            </p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>有<span>${pv.numOrders}</span>人申请<br />有<span>${pv.sucOrders}</span>人成功<br /></p>
        </div>
    </div>
  </div>
</c:forEach>
</div>
</body>
</html>
