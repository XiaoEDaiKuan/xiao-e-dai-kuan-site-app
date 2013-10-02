<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
				<td><input name="" type="text" class="input code" /> <img
					src="images/code2.jpg" width="57" height="30" /></td>
			</tr>
		</table>
		<div class="login3">
			<input type="submit" value="登录" /><a href="forgetPassowrd.jsp">忘记密码？</a>
		</div>
		<div class="login4">
			没有账号？立即<a href="reg">免费注册</a>
		</div>
	</form>
</body>
</html>