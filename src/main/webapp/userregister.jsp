<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户注册</title>
<%@include file="WEB-INF/inc/globalScript.jsp" %>
</head>

<body>
<div class="top">
  <div class="logo"><a href="/"></a></div>
  <div class="registered font_f">会员注册</div>
</div>
<div class="registered_title">
  <div class="registered_title1"></div>
</div>
<div class="registered_title2">
  <div class="registered_title3"> <font>欢迎注册玖富云金融平台</font> <span>已有账号，点此<a href="login.html">登录</a></span> </div>
</div>
<form action="createUser" method="post">
<div class="registered_main">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
    <tr>
      <th width="8%">手机：</th>
      <td width="92%"><input name="mobileNO" type="text" value="" class="input" /></td>
    </tr>
    <tr>
      <th>姓名：</th>
      <td><input name="custName" type="text" value="" class=" input input1" /></td>
    </tr>
    <tr>
      <th>密码：</th>
      <td><input name="logonPasswd" type="password" class="input" /></td>
    </tr>
    <tr>
      <th>确认密码：</th>
      <td><input name="" type="password" class="input" /></td>
    </tr>
    <tr>
      <th>证件类型：</th>
      <td><div id="tm2008style">
      	<select name="idType" id="idType">
			<option value="0">身份证</option>
		</select></div></td>
    </tr>
    <tr>
      <th>证件号码：</th>
      <td><input name="idNO" type="text" value="" class="input" /></td>
    </tr>
    <tr>
      <th>电子邮件：</th>
      <td><input name="email" type="text" value="" class="input" /></td>
    </tr>
    <tr>
      <th>邮编：</th>
      <td><input name="postCode" type="text" value="" class="input" /></td>
    </tr>
    <tr>
      <th>住址：</th>
      <td><input name="address" type="text" value="" class="input" /></td>
    </tr>
    
    <tr>
    	<th>验证码：</th>
       	<td><input type="text" name="captcha" id="cf" class="input" style="width:90px"/>
       	<img id="captchaimg" src="handleCaptcha" alt="captcha" onclick="javascript:reloadCaptcha()"/>
       </td>
	</tr>     
  </table>

  <div class="terms_title">
    <input type="checkbox" name="CheckboxGroup1" value="复选框" />
    <font>我同意以下服务条款</font></div>
  <div class="terms">服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服服务条款服务条款服务条款服服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务</div>
</div>
<div class="btn2">
  <input name="" type="submit" value="" class="reg_btn" />
</div>
</form>

<%@include file="WEB-INF/inc/memberFooter.jsp" %>

<script type="text/javascript" language="JavaScript">
    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        var captchaURL = obj.src+"?nocache=" + Math.floor(Math.random()*100000000 + 100000000);  
        obj.src =captchaURL ;
        
    }  
  </script>

</body>
</html>
