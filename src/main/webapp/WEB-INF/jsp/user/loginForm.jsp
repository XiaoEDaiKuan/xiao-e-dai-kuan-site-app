<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<%@include file="../../inc/globalScript.jsp" %>
<style type="text/css">
 table tr th{font-size:14px}
  table tr{margin-bottom:6px}
</style>
</head>
<body style="padding:20px">
	<form action="loginFormAction" method="post" id="login_form_2">
		<table width="100%" border="0" cellspacing="4" cellpadding="3">
			<tr>
				<th>账&nbsp;&nbsp;&nbsp;号：</th>
				<td><input name="logonName" id="logonName" type="text" style="height:28px;width:150px;margin-bottom:8px"
					class="input" />
					<c:if test="${response=='fail'}">
                       <span id="logonName_error" class="e9" style="display:inline-block;">账号或密码错误</span>
                  </c:if>
					</td>
			</tr>
			<tr>
				<th>密&nbsp;&nbsp;&nbsp;码：</th>
				<td><input name="passwd" id="passwd" type="password"
					class="input"  style="height:28px;width:150px;margin-bottom:8px"/></td>
			</tr>
			<tr>
				<th>验证码：</th>
				<td><input name="captcha" type="text" class="input code"  style="height:28px;width:108px;margin-bottom:0px;vertical-align: middle; " id="login_form_captcha" />
				<img id="captchaimg" src="handleCaptcha" alt="captcha"  class="input code" style="margin:0px;width:90px;height:28px;vertical-align: middle;" onclick="reloadCaptcha()" />
				  <span id="login_form_captcha_ok" class="tip_yes" style="display:none;"></span>
                  <span id="login_form_captcha_error" class="e9" style="display:none;"></span>
				
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
				<div class="login3" style="padding:0px;margin:0px;margin-top:15px">
					<input type="button" value="" id="login_form_submit" /><a href="forgetPasswd" target="_top">忘记密码？</a>
				</div>
				</td>
			</tr>
		</table>
		<div class="login4">没有账号？立即<a href="reg" target="_top">免费注册</a></div>
	</form>
<script type="text/javascript" language="JavaScript">
    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        obj.src = "handleCaptcha?time=" + (new Date()).getTime();
    }  
</script>

</body>
</html>