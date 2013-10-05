<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户登录</title>
<%@include file="../../inc/globalScript.jsp" %>

</head>

<body>
	<jsp:include page="../../inc/globalHeader.jsp">
		<jsp:param name="index" value="1" />
	</jsp:include>

<!--===========页面内容部分 开始===========-->
<div class="login">
  <div class="login1">
    <div class="login2">
      <div class="login2_1 font_f">玖富云金融平台</div>
      <div class="login2_2">
      <form action="login" method="post">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th>账&nbsp;&nbsp;&nbsp;号：</th>
            <td><input name="logonName" id="logonName" type="text" class="input" /><br/><br/>
            	<em style="color:#CCC">Email/手机/身份证/客户号</em>
            </td>
          </tr>
          <tr>
            <th>密&nbsp;&nbsp;&nbsp;码：</th>
            <td><input name="passwd" id="passwd" type="password" class="input" /></td>
          </tr>
          <tr>
            <th>验证码：</th>
            <td><input name="captcha" type="text" class="input code" /></td>
          </tr>
          <tr>
            <th>&nbsp;</th>
            <td><img id="captchaimg" src="handleCaptcha" alt="captcha"  class="input code" style="margin:0px;width:112px;height:32px" onclick="reloadCaptcha()" /></td>
          </tr>

        </table>
        <div class="login3"><input name="" type="submit" value="" /><a href="forgetPassword.jsp">忘记密码？</a></div>
        <div class="login4">没有账号？立即<a href="reg">免费注册</a></div>
        </form>
      </div>
      <div class="login5"></div>
    </div>
  </div>
</div>

<!--===========页面内容部分 结束===========-->
<%@include file="../../inc/memberFooter.jsp" %>

<script type="text/javascript" language="JavaScript">
    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        obj.src = "handleCaptcha?time=" + (new Date()).getTime();
    }  
</script>
</body>
</html>
    