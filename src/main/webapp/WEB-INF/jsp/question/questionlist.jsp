<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>问答列表</title>
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
			<div class="ask ground Loansquiz10">
				<c:forEach var="q" items="${questions.items}">
				<div class="Loansquiz11">
					<h1>
						<a href="viewAnswer?id=${q.id}" target="_blank">${q.subject}</a>
					</h1>
					<p>问: ${q.detail}</p>
					<p>答: 
					<c:forEach var="a" items="${q.answers}" varStatus="ast">
						<c:if test="${ast.index == 0}">${a.answerContent}</c:if>
					</c:forEach>		
  					</p>
					<div>
						${q.askTime} <em>来自${q.region.name}的问题</em>
					</div>
				</div>
				</c:forEach>
				<div class="me_next">
				<c:forEach var="i" begin="1" end="${questions.totalPages}" step="1">
					<a href="questionSearch?pageIndex=${i}&title=${qv.title}" <c:if test="${i == questions.pageIndex}">class="currentPager"</c:if>><em>${i}</em></a>
				</c:forEach>
					<span>共<font>${questions.totalRecords}</font>个结果</span>
				</div>
			</div>
		</div>
	</div>
	</div>


	<%@include file="../../inc/globalFooterMenu.jsp"%>
	<%@include file="../../inc/globalFooter.jsp"%>
</body>
</html>
