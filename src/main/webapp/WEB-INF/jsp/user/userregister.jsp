<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户注册</title>
<%@include file="../../inc/globalScript.jsp" %>
<link href="css/login.css" type="text/css" rel="stylesheet" />
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
  <div class="registered_title3"> <font>欢迎注册玖富云金融平台</font> <span>已有账号，点此<a href="loginView">登录</a></span> </div>
</div>
<form  action="createUser"   autocomplete="off" id="login_form" >
<div class="registered_main">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
    <tr>
      <th width="12%"><span style="color:red;padding-right:8px">*</span>手机：</th>
      <td width="88%">
          <input name="mobileNO" type="text" value="" class="input" id="login_mobile_no" />  
          <span id="mobile_ok" class="tip_yes" style="display:none;"></span>
          <span id="mobile_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>姓名：</th>
      <td>
          <input name="custName" type="text" value="" class="input input1" id="login_custname" />
          <span id="custname_ok" class="tip_yes" style="display:none;"></span>
          <span id="custname_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>密码：</th>
      <td>
           <input name="logonPasswd" type="password" class="input" MaxLength="18" id="login_passwd" />
          <span id="passwd_ok" class="tip_yes" style="display:none;"></span>
          <span id="passwd_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>确认密码：</th>
      <td>
          <input name="logonPasswd2" type="password" class="input" MaxLength="18" id="login_passwd2"  />
          <span id="passwd_ok" class="tip_yes" style="display:none;"></span>
          <span id="passwd_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>证件类型：</th>
      <td><div id="tm2008style">
      	<select name="idType" id="idType">
			<option value="0">身份证</option>
		</select></div></td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>证件号码：</th>
      <td>
          <input name="idNO" type="text" value="" class="input" id="login_idno" />
          <span id="idno_ok" class="tip_yes" style="display:none;"></span>
          <span id="idno_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>电子邮件：</th>
      <td>
           <input name="email" type="text" value="" class="input" id="login_email" />
           <span id="email_ok" class="tip_yes" style="display:none;"></span>
           <span id="email_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th>邮编：</th>
      <td><input name="postCode" type="text" value="" class="input" id="login_postcode" /></td>
    </tr>
    <tr>
      <th>住址：</th>
      <td><input name="address" type="text" value="" class="input"  id="login_address" /></td>
    </tr>
    
    <tr>
    	<th><span style="color:red;padding-right:8px">*</span>验证码：</th>
       	<td>
       	      <input type="text" name="captcha"  class="input" style="width:90px" id="login_captcha"/>
       	      <img style="width:107px;height:28px" id="captchaimg" src="handleCaptcha" alt="captcha" onclick="javascript:reloadCaptcha()"/>
           <span id="captcha_ok" class="tip_yes" style="display:none;"></span>
           <span id="captcha_error" class="e9" style="display:none;"></span>
       </td>
	</tr> 
	
	<tr>
    	<th></th>
       	<td>
       	<div style="vertical-align: middle;">
       	<input type="checkbox" style="width:22px; height:22px;vertical-align: middle;" name="CheckboxGroup1" value="复选框" id="login_term" checked="checked" />
    	<font>我同意以下服务条款</font>           
    	<span id="term_error" class="e9" style="display:none;"></span>
    	</div><br />
  		
  		<div class="terms" style="display:block;">服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服服务条款服务条款服务条款服服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务条款服务</div>
       	</td>
	</tr> 
	<tr>
    	<th></th>
       	<td>
       	<input name="" type="submit" value="" class="reg_btn" style="width:100px;height:30px"  id="login_submit"   /></td>
	</tr>  
  </table>
</form>
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
