<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员中心</title>
<%@include file="../../inc/globalScript.jsp"%>
<script type="text/javascript" src="Scripts/member.js"></script>
</head>

<body>
<%@include file="../../inc/memberHeader.jsp"%>
<!--===========页面内容部分 开始===========-->
<div class="members clear">
  <jsp:include page="../../inc/memberLeftMenu.jsp">
			<jsp:param name="index" value="4" />
		</jsp:include>
  <div class="members_right ground">
    <div class="opinion"></div>
    <div class="edit">
    
      <div class="editd1"><font>身份信息</font><a href="#" id="pop_information">编辑</a></div>
      <div class="editd2">
        <p><font>姓名：</font><span>${cust.custName}</span></p>
        <p><font>身份证号：</font><span>${cust.idNO}</span></p>
      </div> 
       
      <div class="editd1"><font>联系方式</font><a href="#" id="pop_contact">编辑</a></div>
      <div class="editd2">
        <p><font>电话：</font><span>${cust.mobileNO}</span></p>
        <p><font>邮箱：</font><span>${cust.email}</span></p>
        <p><font>住址：</font><span>${cust.address}</span></p>
        <p><font>邮编：</font><span>${cust.postCode}</span></p>
      </div>

    </div>
       
  </div>
</div>

<!--===========页面内容部分 结束===========-->
<%@include file="../../inc/memberFooter.jsp"%>
</body>
</html>
	