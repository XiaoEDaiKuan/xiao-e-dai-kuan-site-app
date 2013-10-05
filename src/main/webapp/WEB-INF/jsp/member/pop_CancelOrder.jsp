<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
</head>

<body style="background: #fff;">

	<c:if test= "${not empty deleteOK}">
		<div class="pop_tx" style="font-size:32px; text-align:center"><b>订单已取消！</b></div>
	</c:if>
	
	<c:if test="${empty deleteOK}">
   
	<div class="pop_cancel">
		<!-- 取消前确认界面 -->
		<div class="pop_cancel1 font_f">您确定要取消该订单吗？</div>
		<form action="pop_CancelOrderOK" method="post">
			<input value="${orderid}" type="hidden" />
			<div class="pop_cancel2">
				<input name="" type="submit" value="" class="cancel_det" onclick="tipsWindown.close" />
			</div>
		</form>
		<!-- 
		取消后界面
		<div class="pop_cancel1 font_f">您的订单已经成功取消？</div>
		 -->
	</div>
   </c:if>
</body>
</html>
