<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
</head>

<body style="background:#fff;">
<div class="pop_contact">
  <div class="loan_no"> 
    <b>抱歉，该产品【${prdname}】无法满足您的贷款需求，</b>
    <b>${response}</b>
    <p>建议您搜索其他可以满足您需求的贷款产品，或进行专业评估我们会问您推荐最适合的产品</p>
  </div>
  <div class="loan_no2">
    <input name="" type="button" value="" class="loan_other" onclick="top.location.href='queryProduct'" />
  </div>
</div>
</body>
</html>
    