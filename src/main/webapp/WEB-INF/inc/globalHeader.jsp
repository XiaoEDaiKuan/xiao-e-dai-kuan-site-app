<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--================== 自动弹出框 城市切换 开始 ==================-->
<div id="brg"></div>
<div id="showdiv">
	<div id="close_bj">
		<span class="font_f">提示</span>
		<div id="close"></div>
	</div>
	<div id="testdiv">
		<div class="testdiv1">根据您的IP地址，您在${sessionScope.currentRegion.name}。</div>
		<div class="testdiv2">目前玖富云金融平台尚未在该地区开通线下贷款业务，金融机构无法接受您的贷款申请。您可以切换至以下地区浏览平台产品服务以及使用平台功能。</div>
		<div class="pop_contact">
			<div class="testdiv3">请选择以下地区</div>
			<div class="pop_city">
			<c:forEach var="alr" items="${applicationScope.allowLoanRegions}">
				<!--<a href="selectCity?setcity=${alr.id}" class="C_${alr.id}">${alr.name}</a>-->
				<a href="#" onclick="location.href='selectCity?setcity=${alr.id}&from='+escape(location.href)" class="C_${alr.id}">${alr.name}</a>
			</c:forEach>
			</div>
			<div class="pop_city2">
				<b>温馨提示：</b>请选择您的真实所在地，否则金融机构不能受理您的贷款申请。
			</div>
		</div>
	</div>
</div>
<!--================== 自动弹出框 城市切换 结束 ==================-->
<div class="top">
	<div class="logo">
		<a href="index.html"></a>
	</div>
	<div class="city font_f">
		<font>${sessionScope.currentRegion.name}</font><a href="#" id="pop_city">[切换城市]</a>
	</div>
	<div class="top_right">
		<div class="top_right1">
			<c:if test="${not empty sessionScope.custName}">${sessionScope.custName}, 欢迎您！<font>|</font> <a href="logOut">退出</a> <font>|</font></c:if>
			<c:if test="${empty sessionScope.custName}">
				<a href="reg">注册</a><font>|</font><a href="loginView">登录</a><font>|</font>
			</c:if>
			<a href="myDaikuan">会员中心</a><font>|</font>
			<a>信贷经理登录</a><font>|</font>
			<a>信贷经理入驻</a>
		</div>

		<div class="underPmenu font_f" id="w_nav">
			<ul>
				<li <c:if test="${param.index eq '1'}">class="hover"</c:if>><a href="index.html">首页</a></li>
				<li <c:if test="${param.index eq '2'}">class="hover"</c:if>><a href="queryProduct" target="_blank">贷款池</a>
					<ul>
						<li class="subline"></li>
						<li><a href="queryProduct?loanUse=2" class="w_a1" target="_blank">消费贷款</a></li>
						<li><a href="queryProduct?loanUse=1" class="w_a1" target="_blank">经营贷款</a></li>
						<li><a href="queryProduct?loanUse=4" class="w_a1" target="_blank">购车贷款</a></li>
						<li><a href="queryProduct?loanUse=3" class="w_a1" target="_blank">购房贷款</a></li>
					</ul>
				</li>
				<li <c:if test="${param.index eq '3'}">class="hover"</c:if>><a href="scoreChoose" target="_blank">信用评分</a></li>
				<li <c:if test="${param.index eq '4'}">class="hover"</c:if>><a href="http://tuan.9fbank.com/front/common/index" target="_blank">金融团</a> <i></i></li>
				<li <c:if test="${param.index eq '5'}">class="hover"</c:if>><a href="gonglue" target="_blank">贷款攻略</a></li>
				<li <c:if test="${param.index eq '6'}">class="hover"</c:if>><a href="ask" target="_blank">贷款百科</a></li>
			</ul>
		</div>
	</div>
</div>