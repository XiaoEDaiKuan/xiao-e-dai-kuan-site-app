<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>
</head>

<body>
<div class="top">
  <div class="logo"><a href="index.html"></a></div>
  <div class="registered font_f">平台说明</div>
</div>
<div class="registered_title">
  <div class="registered_title1"></div>
</div>
<!--===========页面内容部分 开始===========-->
<div class="members clear">
  <div class="members_left font_f">
    <div class="members_left1">
      <h1>平台说明</h1>
    </div>
    <div class="members_left2">
      <ul>
        <li><a href="financial.jsp">什么是云金融</a></li>
        <li><a href="common_question.jsp">常见问题</a></li>
        <li><a href="terms.jsp">服务条款</a></li>
        <li><a href="private.jsp">隐私保护</a></li>
        <li><a href="fin_opinion.jsp" class="hover2">意见反馈</a></li>
      </ul>
    </div>
  </div>
  <div class="financial ground">
    <div class="opinion"></div>
    <div class="opinion1 clear">
      <div class="opinion1_1">
        <p>您的姓名<b>*</b></p>
        <input name="" type="text" class="input" />
      </div>
      <div class="opinion1_2">
        <p>您的邮箱<b>*</b></p>
        <input name="" type="text" class="input" />
      </div>
      <div class="opinion1_3">
        <p>您的联系电话</p>
        <input name="" type="text" class="input" />
      </div>
    </div>
    <div class="opinion2">
      <p>您的反馈意见<b>*</b></p>
      <textarea name="" cols="" rows="" class="input"></textarea>
    </div>
    <div class="opinion3">
      <div class="opinion3_1"><p>输入验证码<b>*</b></p>
      <img src="images/code3.jpg" width="115" height="35" /><a href="#">看不清换一张？</a></div>
      <div class="opinion3_2"><input name="" type="text" /></div>
    </div>
    <div class="opinion4"><input name="" type="button" value="" /></div>
  </div>
</div>

<!--===========页面内容部分 结束===========-->
<%@include file="WEB-INF/inc/memberFooter.jsp" %>
</body>
</html>
    