<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<%@include file="../../inc/globalScript.jsp" %>

</head>
<body>
<div class="login2_2">
	<form action="loginFormAction" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>账&nbsp;&nbsp;&nbsp;号：</th>
				<td><input name="logonName" id="logonName" type="text"
					class="input" /><br />
				<br /> <em style="color: #CCC">Email/手机/身份证/客户号</em></td>
			</tr>
			<tr>
				<th>密&nbsp;&nbsp;&nbsp;码：</th>
				<td><input name="passwd" id="passwd" type="password"
					class="input" /></td>
			</tr>
			<tr>
				<th>验证码：</th>
				<td><input name="captcha" type="text" class="input code" /></td>
			</tr>
			<tr>
				<th>图形：</th>
				<td><img id="captchaimg" src="handleCaptcha" alt="captcha"  class="input code" style="margin:0px;width:112px;height:32px" onclick="reloadCaptcha()" /></td>
			</tr>
			
		</table>
		<div class="login3">
			<input type="submit" value="登录" />
		</div>
	</form>
</div>
<script type="text/javascript" language="JavaScript">
    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        obj.src = "handleCaptcha?time=" + (new Date()).getTime();
    }  
</script>

</body>
</html>