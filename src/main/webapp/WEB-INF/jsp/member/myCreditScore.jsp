<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
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
			<jsp:param name="index" value="3" />
		</jsp:include>
		<div class="members_right ground">
			<div class="members_right2">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>序号</th>
						<th>信用评分结果</th>
						<th>信用评分类型</th>
						<th>时间</th>
						<th>操作</th>
					</tr>

			  <c:forEach var="credit" items="${creditPage.items}" >
					<tr>
						<td>${credit.id}</td>
						<td>
						    <fmt:formatNumber value="${credit.creditMin/10000}" pattern="#,#00.0#"/>
						     -
						    <fmt:formatNumber value="${credit.creditMax/10000}" pattern="#,#00.0#"/>
						          万元
						</td>
						<td>
						<fmt:bundle basename="dict/dict-mapping" prefix="CREDIT_TYPE.">
							<fmt:message key="${credit.creditType}" />
				        </fmt:bundle>
						</td>
						<td><fmt:formatDate value="${credit.calTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><a href="#" data="${credit.id}" class="pop_del">删除记录</a>
						    <a href="score_choose.html" target="_blank">再测一次</a>
						</td>
					</tr>
               </c:forEach>

				</table>
				<div class="me_next padd">
				   <c:forEach var="i" begin="1" end="${creditPage.totalPages}" step="1">
                    	<a  href="myCreditScore?pageIndex=${i}" <c:if test="${i == creditPage.pageIndex}">class="currentPager"</c:if> ><em>${i}</em></a>
                   </c:forEach>
				</div>
			</div>

		</div>
	</div>

	<!--===========页面内容部分 结束===========-->
	<%@include file="../../inc/memberFooter.jsp"%>
</body>
</html>
