<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
<link href="css/order.css" type="text/css" rel="stylesheet" />

</head>

<body style="background:#fff;">
<div class="pop_contact">
<div class="loan">
  <form action="inputOrderInfoForm" method="post">

   <div class="request-order-title clearfix">
		 <span>第一步: 请回答云金融问题</span>
	</div>
   <ul class="questions_list clearfix" id="apply_condition_questions">
		<li class="item clearfix">
		<div class="label question" >您的职业身份：</div>
		   <div class="options question_values">
                 <label for="identity_0" hideFoucs=true><input name="identity"  id="identity_0" value="0" type="radio"/><span>无固定职业</span></label>
                 <label for="identity_1" hideFoucs=true><input name="identity"  id="identity_1" value="1" type="radio"/><span>企业主</span></label>
				 <label for="identity_2" hideFoucs=true><input name="identity"  id="identity_2" value="2" type="radio"/><span>个体户</span></label>
				 <label for="identity_3" hideFoucs=true><input name="identity"  id="identity_3" value="3" type="radio"/><span>上班族</span></label>
							
        	</div>
	    </li>
	    
		<li class="item clearfix">
		<div class="label question " >您的房产情况：</div>
		<div class="options question_values">
              <label for="estate_0" hideFoucs=true><input name="estate"  id="estate_0" value="0" type="radio"/><span>无房</span></label>
							<label for="estate_1" hideFoucs=true><input name="estate"  id="estate_1" value="1" type="radio"/><span>有房</span></label>
							<label for="estate_2" hideFoucs=true><input name="estate"  id="estate_2" value="2" type="radio"/><span>有房，但已抵押</span></label>
 		</div>
	  </li>
		<li class="item clearfix">
		<div class="label question ">您的车辆情况：</div>
		<div class="options question_values">
              <label for="vehicle_0" hideFoucs=true><input name="vehicle" id="vehicle_0" value="0" type="radio"/><span>无车</span></label>
							<label for="vehicle_1" hideFoucs=true><input name="vehicle" id="vehicle_1" value="1" type="radio"/><span>有车</span></label>
							<label for="vehicle_2" hideFoucs=true><input name="vehicle" id="vehicle_2" value="2" type="radio"/><span>有车，但已抵押</span></label>
 		</div>
	  </li>

		<li class="item clearfix">
		<div class="label question " ra-data-qa="user_loan_experience">您两年内信用情况:</div>
		<div class="options question_values">
     					<label for="credit_0" hideFoucs=true><input name="credit"  id="credit_0" value="0" type="radio"/><span>无信用记录</span></label>
							<label for="credit_1" hideFoucs=true><input name="credit"  id="credit_1" value="1" type="radio"/><span>信用记录良好</span></label>
							<label for="credit_2" hideFoucs=true><input name="credit"  id="credit_2" value="2" type="radio"/><span>有少数逾期</span></label>
							<label for="credit_3" hideFoucs=true><input name="credit"  id="credit_3" value="3" type="radio"/><span>长期多次逾期</span></label>
	           
	
		</div>
	</li>
	</ul>


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
    