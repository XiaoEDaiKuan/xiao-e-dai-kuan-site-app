<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>信用计算器</title>
<%@include file="../../inc/globalScript.jsp" %>
</head>

<body>
<%@include file="../../inc/scoreHeader.jsp" %>

<!--===========页面内容部分 开始===========-->
<div class="score"></div>
<div class="score1 font_f clear"><b>9F云信用评分器</b></div>
<div class="score2 ground clear">
  <div class="choose1 font_f">
    <div class="choose1_1"></div>
    <p>工薪阶层</p>
    <span><a href="scorePerson">进入&gt;&gt;</a></span>
  </div>
  <div class="choose1 font_f">
    <div class="choose1_2"></div>
    <p>私营企业主或个体工商户</p>
    <span><a href="scoreCompany">进入&gt;&gt;</a></span>
  </div>
</div>
<div class="choose2 font_f">
我们建议您注册为平台会员。登录后，您的测试结果会保留在您的会员中心，以便您定期查看监测。<br />
<a href="reg">立刻注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已有账号，
<a href="loginView">点此登录</a></div>
<div class="kong2"></div>

<!--===========页面内容部分 结束===========-->
<%@include file="../../inc/memberFooter.jsp" %>
</body>
</html>
