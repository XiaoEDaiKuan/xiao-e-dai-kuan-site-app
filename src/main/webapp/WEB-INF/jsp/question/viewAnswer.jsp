<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款问答</title>
<%@include file="../../inc/globalScript.jsp"%>
<script type="text/javascript" src="Scripts/question.js"></script>
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
	<jsp:include page="../../inc/globalHeader.jsp">
		<jsp:param name="index" value="6" />
	</jsp:include>

	<%@include file="../../inc/questionSearchForm.jsp"%>
	<div class="top Fuzzysearch1 Loansquiz1">
		<div class="applicationright">
			<!-- 贷款攻略 -->
			<div class="strategy ground Loansquiz8">
			<%@include file="../../inc/gonglueList.jsp"%>
			</div>
			<!-- 贷款助手 -->
			<%@include file="../../inc/daikuanTools.jsp"%>
			<!-- 我要贷款查询 -->
			<%@include file="../../inc/daikuanQuickSearch.jsp"%>
		</div>
		<div class="applicationleft">
			<div class="ask ground Loansquiz10 Loansquiz15 Loansquiz8">
				<div class="Loansquiz13">
					<h1>${question.subject}</h1>
					<p>
						<span>${question.askTime}</span>提问者:${question.askedBy}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;问答来自:${question.region.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标签:${question.tag}
					</p>
				</div>
				<p class="Loansquiz14">${question.detail}</p>
			</div>
			<div class="credit ground  applicationleft13">
				<div class="credit_title Fuzzysearch7">
					<div
						class="credit_title font_f Fuzzysearch2 applicationleft5 Loansquiz16">
						<span>平台回答</span>
					</div>
				</div>
				<c:forEach var="ans" items="${question.answers}">
				<p class="Loansquiz17">${ans.answerContent}</p>
				<div class="Loansquiz18">${ans.answerBy}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ans.answerTime}</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<%@include file="../../inc/globalFooterMenu.jsp"%>
	<%@include file="../../inc/globalFooter.jsp"%>
</body>
</html>
