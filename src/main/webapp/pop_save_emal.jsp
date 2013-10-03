<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发送</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
</head>

<body style="background:#fff;">
<div class="pop_contact">
  <div class="pop_email">
    <div class="pop_email1">请留下邮箱，我们会把该产品的介绍和申请条件发给您。</div>
    <div class="pop_email2"><span>邮箱地址：</span>
    <form action="saveToEmail" method="post">
    <input name="email" type="text" class="input email" />
    <input name="" type="submit" value="" class="pop_send"/>
    </form>
    </div>
  </div>
</div>
</body>
</html>
	