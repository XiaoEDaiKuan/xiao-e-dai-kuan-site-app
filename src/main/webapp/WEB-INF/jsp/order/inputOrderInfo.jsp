<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <div class="loan_yes"><font>第三步：云信用评分</font><br /><b>您符合该产品的基本要求，</b><br />我们建议您进行信用评分测试，通过全面，权威，科学的评分测试，测测您能贷多少？</div>
  <div class="loan_no2">
    <input name="" type="button" value="" class="loan_imme"  onClick="top.location.href='scoreChoose'" />
    <input name="" type="button" value="" class="loan_skip"  onClick="location.href='inputNameTel?productId=${pq.productId}&loanAmt=${pq.loanAmt}'"/>
  </div>
</div>
</body>
</html>