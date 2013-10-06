<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="members_left font_f">
	<div class="members_left1">
		<h1>会员中心</h1>
	</div>
	<div class="members_left2">
		<ul>
			<li><a href="myDaikuan" <c:if test="${param.index eq '1'}">class="hover2"</c:if>>我的贷款</a></li>
			<li><a href="myMessage" <c:if test="${param.index eq '2'}">class="hover2"</c:if>>我的消息</a></li>
			<li><a href="myCreditScore" <c:if test="${param.index eq '3'}">class="hover2"</c:if>>我的信用评分</a></li>
			<li><a href="editMyInfo" <c:if test="${param.index eq '4'}">class="hover2"</c:if>>编辑资料</a></li>
			<li><a href="myQuestion" <c:if test="${param.index eq '5'}">class="hover2"</c:if>>我的提问</a></li>
			<li><a href="changePassword" <c:if test="${param.index eq '6'}">class="hover2"</c:if>>修改密码</a></li>
		</ul>
	</div>
</div>