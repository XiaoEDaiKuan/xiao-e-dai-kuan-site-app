<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我要提问</title>

<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>
<script type="text/javascript" src="Scripts/question_post.js"></script>

</head>

<body style="background: #fff;">
	<c:if test= "${not empty saveOK}">
		<div class="pop_tx" style="font-size:32px; text-align:center"><b>您的问题提交成功！</b></div>
	</c:if>
	<c:if test="${empty saveOK}">
	<form action="postQuestionFormSave" method="post" id="question_form" >
		<div class="pop_contact">
			<div class="pop_question">
				<div class="pop_question1">
					问题标签：
					<select name="tag" class="formItem">
						<option value="">不限</option>
						<option value="1">抵押贷款</option>
						<option value="0">无抵押贷款</option>
					</select>
				</div>
				<div class="pop_question1">
					简单描述您的问题： <font>您还可以输入<em>50</em>个字</font>
				</div>
				<div class="pop_question4">
					<input name="subject" type="text" class="n_srk2 pop_question2" />
				</div>
				<div class="pop_question1">
					问题详细描述（选填）：<font>问题描述的越详细，得到的解答也越精准</font>
				</div>
				<div class="pop_question4">
					<textarea name="detail" cols="" rows="" class="n_srk2 pop_question5"></textarea>
				</div>
				
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pop_table3">
						<tr>
							<td colspan="3"><span>建议您留下联系方式用于接收问题答复：</span></td>
						</tr>
						<tr>
							<th width="30%">常用邮箱：<font color="red">*</font></th>
							<td width="70%"><input name="email" type="text" class="input" id="question_email" />
							        <span id="question_email_error" class="e9" style="display:none;"></span>
							</td>
						</tr>
						<tr>
							<th width="30%">手机号码：</th>
							<td width="70%"><input name="telephone" type="text" class="input" /></td>
						</tr>
						<tr>
							<th width="30%">验证码：</th>
							<td width="70%"><input name="captcha" type="text" class="input pop_question7" id="question_captcha"  /></td>
					    </tr>
					    <tr>
					        <td width="30%">&nbsp;</td>
							<td width="70%">
							    <img  id="captchaimg" src="handleCaptcha" alt="captcha" onclick="javascript:reloadCaptcha()"/>
							    <span id="question_captcha_error" class="e9" style="display:none;"></span>
							
							</td>
						</tr>
					</table>
				
			</div>
			<div class="pop_question1">
				注册9F并登录后，您可以在会员中心看到自己的贷款问答。
			</div>
			<div class="pop_question1">
				<a href="loginView" target="_top">立即登录</a> <a href="reg" target="_top">立即注册</a>
			</div>
			<div class="pop_contact1">
				<input type="button" value="" class="pop_submit" id="question_submit" />
			</div>
		</div>
	</form>
	
	<script type="text/javascript" language="JavaScript">
    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        obj.src = "handleCaptcha?time=" + (new Date()).getTime();
    }  

  </script></c:if>
</body>
</html>
