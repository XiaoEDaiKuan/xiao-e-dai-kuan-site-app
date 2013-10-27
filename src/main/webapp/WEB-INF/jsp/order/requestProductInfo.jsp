<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贷款申请</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>

<script type="text/javascript" src="Scripts/order.js"></script>


</head>

<body style="background:#fff;">
<div class="pop_contact">
  <div class="loan">
  <form action="requestProductCheck" method="post"  id="loan_form">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th width="27%">贷款用途：</th>
        <td width="73%">
          <select name="loanUse" class="input">
			<option value="0" selected="selected">不限</option>
			<option value="1" >经营贷款</option>
			<option value="2" >消费贷款</option>
			<option value="4" >购车贷款</option>
			<option value="3" >购房贷款</option>
          </select></td>
      </tr>
      <tr>
        <th>贷款金额：</th>
        <td><input name="loanAmt" type="text" class="input" id="loan_amt" />万元 <span id="loan_amt_error" class="e9" style="display:none;"></span></td>
      </tr>
      <tr>
        <th>贷款期限：</th>
        <td><input name="loanIssue" type="text" class="input" id="loan_issue" />个月<span id="loan_issue_error" class="e9" style="display:none;"></span></td>
      </tr>
    </table>
    <div class="loan2">
      <input name="productId" type="hidden" value="${productId}" />
      <input type="button" value="" class="loan_next"  id="loan_submit_button"/>
    </div>
    </form>
  </div>
</div>
</body>
</html>
