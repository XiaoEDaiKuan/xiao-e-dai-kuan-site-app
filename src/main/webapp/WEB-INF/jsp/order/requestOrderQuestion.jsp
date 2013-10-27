<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
<link href="css/order.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />
</head>

<body style="background:#fff;">
<div class="pop_contact">
<div class="loan">
	<form action="inputOrderInfoForm" method="post">

	<div class="request-order-title clearfix">
		<span>第一步: 请回答云金融问题</span>
	</div>
	
	<ul class="questions_list clearfix" id="apply_condition_questions">
	<c:forEach var="req" items="${reqInfo}">
		<li class="item clearfix">
			<div class="label question">${req.question}：</div>
			<c:choose>
				<c:when test="${empty req.ansOptions}">
					<input name="${req.formName}" type="text" class="input" />
				</c:when>
				<c:otherwise>
					<div class="options">
					<fmt:bundle basename="dict/dict-mapping" prefix="${req.formName}.">
		            	<c:forTokens var="opt" varStatus="vst" items="${req.ansOptions}" delims="|">
		            		<c:if test="${not empty opt}">
		            			
		            			<label for="${req.formName}_${vst.index}"><span><input name="${req.formName}" id="${req.formName}_${vst.index}" value="${opt}" type="radio" /><fmt:message key="${opt}" /></span></label>
		            		</c:if>
		            	</c:forTokens>
					</fmt:bundle>
					</div>
				</c:otherwise>
			</c:choose>
		</li>
	</c:forEach>
	</ul>

	<div class="loan2">
		<input name="productId" type="hidden" value="${pq.productId}" />
		<input name="loanUse" type="hidden" value="${pq.loanUse}" />
		<input name="loanAmt" type="hidden" value="${pq.loanAmt}" />
		<input name="loanIssue" type="hidden" value="${pq.loanIssue}" />
		<input type="submit" value="" class="loan_next"/>
	</div>
	</form>
</div>
</div>
</body>
</html>
    