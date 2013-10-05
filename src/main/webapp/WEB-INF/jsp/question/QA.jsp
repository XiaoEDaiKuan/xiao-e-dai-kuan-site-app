<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款问答</title>
<%@include file="../../inc/globalScript.jsp"%>
<script type="text/javascript" src="Scripts/question.js"></script>
<script>
<!--
	/*第一种形式 第二种形式 更换显示样式*/
	function setTab(name, cursel, n) {
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById("con_" + name + "_" + i);
			menu.className = i == cursel ? "hover" : "";
			con.style.display = i == cursel ? "block" : "none";
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
			<div class="credit ground Loansquiz7 ">
				<div id="Tab2">
					<div class="Menubox font_f">
						<ul>
							<li id="two1" onclick="setTab('two',1,2)" class="hover">无抵押贷</li>
							<li id="two2" onclick="setTab('two',2,2)">抵押贷款</li>
						</ul>
					</div>
					<div class="Contentbox">
						<div id="con_two_1">
							<ul class="question_list Loansquiz5">
							<c:forEach var="k1" items="${nonMort.items}">
								<li><a href="viewAnswer?id=${k1.id}" target="_blank">${k1.detail}</a></li>
							</c:forEach>
							</ul>
							<!--<div class="Loansquiz6"><a href="#">更多抵押贷款问题>></a></div>-->
						</div>
						<div id="con_two_2" style="display: none">
							<ul class="question_list Loansquiz5">
							<c:forEach var="k2" items="${mortage.items}">
								<li><a href="viewAnswer?id=${k2.id}" target="_blank">${k2.detail}</a></li>
							</c:forEach>
							</ul>
							<!--<div class="Loansquiz6"><a href="贷款问答2.html" target="_blank">更多抵押贷款问题>></a></div>-->
						</div>
					</div>
				</div>
			</div>
			<div class="ask ground Loansquiz8">
				<div class="credit_title">
					<span class="credit_title1 font_f">大家都在问</span>
				</div>
				<ul class="question_list Loansquiz5">
			    <c:forEach var="hiQust" items="${hiQusts.items}">
			      <li><a href="viewAnswer?questId=${hiQust.id}" target="_blank">${hiQust.detail}</a></li>
			    </c:forEach>
				</ul>
				<!--<div class="Loansquiz6"><a href="#">更多问题>></a></div>-->
			</div>
		</div>
	</div>
	<%@include file="../../inc/globalFooterMenu.jsp"%>
	<%@include file="../../inc/globalFooter.jsp"%>
</body>
</html>
