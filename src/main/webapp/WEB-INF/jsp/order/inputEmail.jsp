<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>输入邮箱 </title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>

<script type="text/javascript" src="Scripts/product_email.js"></script>

</head>

<body style="background: #fff;">

	<c:if test= "${not empty emailOK}">
		<div class="pop_tx" style="font-size:32px; text-align:center"><b>产品信息已发送！</b></div>
	</c:if>
	
	<c:if test="${empty emailOK}">
	<form action="orderEmail?productId=${productId}" method="post"  id="product_email_form" >
	<div class="pop_contact">
	  <div class="pop_email">
	    <div class="pop_email1">请留下邮箱，我们会把该产品的介绍和申请条件发给您。</div>
	    <div class="pop_email2"><span>邮箱地址：</span>
     	     <input name="email" type="text" class="input email" id="product_email" />
	         <input name="" type="button" value="" class="pop_send"  id="product_email_submit" />
	         <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <span id="product_email_error" class="e9" style="display:none;"></span>
	    </div>

   	  </div>
	</div>
	</form>
   </c:if>
</body>
</html>
