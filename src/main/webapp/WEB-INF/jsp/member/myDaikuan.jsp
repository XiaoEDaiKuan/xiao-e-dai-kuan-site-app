<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员中心</title>
<%@include file="../../inc/globalScript.jsp"%>
<script type="text/javascript" src="Scripts/member.js"></script>
</head>

<body>
	<%@include file="../../inc/memberHeader.jsp"%>
	<!--===========页面内容部分 开始===========-->
	<div class="members clear">
		<jsp:include page="../../inc/memberLeftMenu.jsp">
			<jsp:param name="index" value="1" />
		</jsp:include>
		<div class="members_right ground">
			<div class="members_right2">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>订单号</th>
						<th>产品</th>
						<th>金额</th>
						<th>时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
			  <c:forEach var="order" items="${orderPage.items}">
				
					<tr>
						<td>${order.id}</td>
						<td>${order.product.name}</td>
						<td>${order.applyAmt}元</td>
						<td><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${order.status}</td>
						<td><a href="#" data="${order.id}" class="pop_Cancel_order">取消订单</a></td>
					</tr>
			   </c:forEach>
			   
				</table>
				
				
				<div class="me_next padd">
				
				  <c:forEach var="i" begin="1" end="${orderPage.totalPages}" step="1">
                    	<a  href="myDaikuan?pageIndex=${i}" <c:if test="${i == orderPage.pageIndex}">class="currentPager"</c:if> ><em>${i}</em></a>
                   </c:forEach>
				</div>
			</div>

		</div>
	</div>

	<!--===========页面内容部分 结束===========-->
	<%@include file="../../inc/memberFooter.jsp"%>
</body>
</html>
