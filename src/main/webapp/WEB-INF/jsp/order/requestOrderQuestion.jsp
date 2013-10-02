<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
</head>

<body style="background:#fff;">
<div class="pop_contact">
<div class="loan">
  <form action="inputOrderInfoForm" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th width="27%">职业身份：</th>
        <td width="59%">
          <select name="identity" class="input">
			<option value="0" selected="selected">无固定职业</option>
			<option value="1" >企业主</option>
			<option value="2" >个体户</option>
			<option value="3" >上班族</option>
          </select></td>
        <td width="14%"></td>
      </tr>
      <tr>
        <th>房产类型：</th>
        <td>
          <select name="estate" class="input">
			<option value="0" selected="selected">无房</option>
			<option value="1" >有房</option>
			<option value="2" >有房已抵押</option>
          </select></td>
        <td></td>
      </tr>
      <tr>
        <th>是否有车辆：</th>
        <td>
          <select name="vehicle" class="input">
			<option value="0" selected="selected">无车</option>
			<option value="1" >有车</option>
			<option value="2" >有车已抵押</option>
          </select></td>
        <td></td>
      </tr>
      <tr>
        <th>两年内信用情况：</th>
        <td>
          <select name="credit" class="input">
			<option value="0" selected="selected">无信用记录</option>
			<option value="1" >信用记录良好</option>
			<option value="2" >有少数逾期</option>
			<option value="3" >长期多次逾期</option>
          </select></td>
        <td></td>
      </tr>
    </table>
    <div class="loan2">
      <input name="productId" type="hidden" value="${pq.productId}" />
      <input name="loanUse" type="hidden" value="${pq.loanUse}" />
      <input name="loanAmt" type="hidden" value="${pq.loanAmt}" />
      <input name="loanIssue" type="hidden" value="${pq.loanIssue}" />
      <input type="submit" value="" class="loan_next"/>
    </div>
    </form>
  </div>
</div>
</body>
</html>
    