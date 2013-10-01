<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款问答</title>
<%@include file="../../inc/globalScript.jsp"%>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#pop_city").click(
						function() {
							tipsWindown("您可以选择以下地区：",
									"iframe:iframe:pop_city.html", "500",
									"200", "true", "", "false", "text", "");
						});
				$("#pop_question").click(
						function() {
							tipsWindown("我要提问：",
									"iframe:iframe:pop_question.html", "550",
									"465", "true", "", "false", "text", "");
						});

			});

	setTimeout('_magicTimeout()', 20 * 1000);
	function _magicTimeout() {
		$('.time_box').hide();
	}
</script>
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
	<%@include file="../../inc/globalHeader.jsp"%>
	<%@include file="../../inc/questionSearchForm.jsp"%>
	<div class="top Fuzzysearch1 Loansquiz1">
		<div class="applicationright">
			<!-- 贷款攻略 -->
			<%@include file="../../inc/gonglueList.jsp"%>
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
								<li><a href="viewAnswer?id=100" target="_blank">这个问答可以点击查看</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
							</ul>
							<!--<div class="Loansquiz6"><a href="#">更多抵押贷款问题>></a></div>-->
						</div>
						<div id="con_two_2" style="display: none">
							<ul class="question_list Loansquiz5">
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇51111111个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
								<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
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
					<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇51111111个回答</a></li>
					<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
					<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
					<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
					<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
					<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
					<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
					<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
					<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
					<li><a href="贷款问答2.html" target="_blank">我有逾期贷哇5个回答</a></li>
				</ul>
				<!--<div class="Loansquiz6"><a href="#">更多问题>></a></div>-->
			</div>
		</div>
	</div>
	<%@include file="../../inc/globalFooterMenu.jsp"%>
	<%@include file="../../inc/globalFooter.jsp"%>
</body>
</html>
