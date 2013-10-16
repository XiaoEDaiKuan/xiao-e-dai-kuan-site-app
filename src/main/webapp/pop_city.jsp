<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>请选择城市</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.pop_contact .pop_city a.C_${sessionScope.currentRegion.id}{
	color:#f68a55;
	font-weight:bold;
	border-bottom:solid #f68a55 1px;
}
</style>
</head>

<body style="background: #fff;">
	<div class="pop_contact">
		<div class="pop_city">
		<c:forEach var="alr" items="${applicationScope.allowLoanRegions}">
			<!--<a href="selectCity?setcity=${alr.id}" class="C_${alr.id}" target="_top">${alr.name}</a>-->
			<a href="#" onclick="top.location.href='selectCity?setcity=${alr.id}&from='+escape(top.location.href)" class="C_${alr.id}">${alr.name}</a>
		</c:forEach>
		</div>
		<div class="pop_city2">
			<b>温馨提示：</b>请选择您的真实所在地，否则金融机构不能受理您的贷款申请。
		</div>
	</div>
</body>
</html>
