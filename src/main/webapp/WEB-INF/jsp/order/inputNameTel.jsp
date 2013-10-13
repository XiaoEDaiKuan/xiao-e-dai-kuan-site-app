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
  <div class="loan_yes"><font>第三步：填写个人信息</font><br />
  
  <form method="post"  action="saveOrderInfo">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
      <tr>
             <th width="35%">您的称呼：</th>
             <td width="66%"><input type="text" value="" name="custName" class="input" /></td>
      </tr>
      
      <tr>
             <th width="35%">手机号码：</th>
             <td width="65%"><input type="text" value="" name="mobile" class="input" /></td>
      </tr>
    </table>   
    <input type="hidden" name="productId" value="${pq.productId}" />
    <input type="hidden" name="loanAmt" value="${pq.loanAmt}" />
    <div class="loan_no2">
       <input type="submit" value="" class="loan_next" />
      </div>
    </form>

</div>
  
</div>
</body>
</html>