<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<tr>
						<td>01</td>
						<td>8-10万</td>
						<td>工薪阶层</td>
						<td>2013-09-12</td>
						<td><a href="#" id="pop_del">删除记录</a><a
							href="score_choose.html" target="_blank">再测一次</a></td>
					</tr>
				</table>
				<div class="me_next padd">
					<a href="#"><em>上一页</em></a><a href="#"><em>1</em></a><a href="#"><em>2</em></a><a
						href="#"><em>3</em></a><a href="#"><em>下一页</em></a>
				</div>
			</div>

		</div>
	</div>

	<!--===========页面内容部分 结束===========-->
	<%@include file="../../inc/memberFooter.jsp"%>
</body>
</html>
