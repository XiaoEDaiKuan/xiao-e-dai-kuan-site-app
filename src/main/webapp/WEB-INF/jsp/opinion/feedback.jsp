<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>意见反馈</title>

<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />
<link href="css/feedback.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>
<script type="text/javascript" src="Scripts/opinion.js"></script>
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
        <li><a href="#">常见问题</a></li>
        <li><a href="#">服务条款</a></li>
        <li><a href="#">隐私保护</a></li>
        <li><a href="feedback" class="hover2">意见反馈</a></li>
      </ul>
    </div>
  </div>
  <c:if test="${response eq 'success'}">
    <div class="financial ground">
        <div class="response_txt"><p>提交成功，请耐心等待平台的回复。</p></div>
    </div>                          
  </c:if>
  
  <c:if test="${response ne 'success'}">
  <form action="addopinion" id="opinion_form"  method="post">
  <div class="financial ground">
    <div class="opinion"></div>
    <div class="opinion1 clear">
      <div class="opinion1_1">
        <p>您的姓名<b>*</b></p>
        <input name="name" type="text" class="input" id="opinion_name" />
      <span id="opinion_name_error" class="e9" style="display:none;"></span>
      </div>
       
      
      <div class="opinion1_2">
        <p>您的邮箱<b>*</b></p>
        <input name="email" type="text" class="input" id="opinion_email" />
        <span id="opinion_email_error" class="e9" style="display:none;"></span>
      </div>
      <div class="opinion1_3">
        <p>您的联系电话</p>
        <input name="telephone" type="text" class="input" />
      </div>
    </div>
    <div class="opinion2">
      <p>您的反馈意见<b>*</b></p>
      <textarea name="content" cols="" rows="" class="input" id="opinion_content" ></textarea>
      <span id="opinion_content_error" class="e9" style="display:none;"></span>
    </div>
    <div class="opinion3">
      <div class="opinion3_1"><p>输入验证码<b>*</b></p>
      <img id="captchaimg" src="handleCaptcha"  width="115" height="35" /><a href="javascript:reloadCaptcha();" /">看不清换一张？</a></div>
      <div class="opinion3_2">
               <input name="captcha" type="text" id="opinion_captcha" />				  
               <span id="opinion_captcha_error" class="e9" style="display:none;"></span>
      </div>
    </div>
    <div class="opinion4"><input type="button" value="" id="opinion_submit" /></div>
  </div>
  </form>
  </c:if>
</div>

<!--===========页面内容部分 结束===========-->
<div class="footer2">
  <div class="footer2_2"><font>版权所有：北京玖富时代投资顾问有限公司 copyright 2012</font><br />
    公司总部地址：北京朝阳区麦子店街37号盛福大厦2580<br />
    传真：010-85276916&nbsp;&nbsp;&nbsp;&nbsp;邮编：100000</div>
</div>
<script type="text/javascript" language="JavaScript">
    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        obj.src = "handleCaptcha?time=" + (new Date()).getTime();
    } 
    
</script>

</body>
</html>
    