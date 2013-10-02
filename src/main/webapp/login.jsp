<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户登录</title>
<%@include file="WEB-INF/inc/globalScript.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
	$("#pop_city").click(function(){
		tipsWindown("您可以选择以下地区：","iframe:iframe:pop_city.html","500","200","true","","false","text","");
	});
	$("#pop_question").click(function(){
		tipsWindown("我要提问：","iframe:iframe:pop_question.html","550","465","true","","false","text","");
	});
	
	});	
	
	setTimeout('_magicTimeout()',20*1000);
    function _magicTimeout(){
	   $('.time_box').hide();
    }	
</script>
</head>

<body>
<%@include file="WEB-INF/inc/globalHeader.jsp" %>

<!--===========页面内容部分 开始===========-->
<form action="login" method="post">
<div class="login">
  <div class="login1">
    <div class="login2">
      <div class="login2_1 font_f">玖富云金融平台</div>
      <div class="login2_2">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th>账&nbsp;&nbsp;&nbsp;号：</th>
            <td><input name="logonName" type="text" class="input" /><br/><br/>
            	<em style="color:#CCC">Email/手机/身份证/客户号</em>
            </td>
          </tr>
          <tr>
            <th>密&nbsp;&nbsp;&nbsp;码：</th>
            <td><input name="passwd" type="password" class="input" /></td>
          </tr>
          <tr>
            <th>验证码：</th>
            <td><input name="captcha" type="text" class="input code" />
            <img id="captchaimg" src="handleCaptcha" alt="captcha"  width="67" height="30" onclick="javascript:reloadCaptcha()" /></td>
          </tr>
        </table>
        
        <div class="login3"><input name="" type="submit" value="" /><a href="#">忘记密码？</a></div>
        <div class="login4">没有账号？立即<a href="registered.html">免费注册</a></div>
      </div>
      <div class="login5"></div>
    </div>
  </div>
</div>
</form>
<script type="text/javascript" language="JavaScript">
    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        var captchaURL = obj.src+"?nocache=" + Math.floor(Math.random()*100000000 + 100000000);  
        obj.src =captchaURL ;
        
    }  
  </script>
<!--===========页面内容部分 结束===========-->

<div class="footer2">
  <div class="footer2_2"><font>版权所有：北京玖富时代投资顾问有限公司 copyright 2012</font><br />
    公司总部地址：北京朝阳区麦子店街37号盛福大厦2580<br />
    传真：010-85276916&nbsp;&nbsp;&nbsp;&nbsp;邮编：100000</div>
</div>
</body>
</html>
    