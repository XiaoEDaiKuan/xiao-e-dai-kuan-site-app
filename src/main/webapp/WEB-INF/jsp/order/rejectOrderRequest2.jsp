<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息录入</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
</head>

<body style="background:#fff;">
<div class="pop_contact">
  <div class="loan_question">
    <p>第二步：查看结果</p>
    <div class="pop_tx">您暂不满足这个贷款的申请条件，原因：${errorMsg}</b></div>
  </div>
  <div class="loan_no2">
    <input type="button" class="loan_other" onclick="top.location.href='queryProduct'" />
  </div>
</div>
</body>
</html>
 