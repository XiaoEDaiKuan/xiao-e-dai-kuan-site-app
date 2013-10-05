<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我要提问</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
</head>

<body style="background: #fff;">
	<form action="postQuestionFormSave" method="post">
		<div class="pop_contact">
			<div class="pop_question">
				<div class="pop_question1">
					<span>简单描述您的问题</span> <font>您还可以输入<em>50</em>个字
					</font>
				</div>
				<div class="pop_question4">
					<input name="subject" type="text" class="n_srk2 pop_question2" />
				</div>
				<div class="pop_question3">
					问题详细描述（选填）：<font>问题描述的越详细，得到的解答也越精准</font>
				</div>
				<div class="pop_question4">
					<textarea name="detail" cols="" rows="" class="n_srk2 pop_question5"></textarea>
				</div>
				<div class="pop_question6">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="pop_table3">
						<tr>
							<td colspan="3"><span>建议您留下联系方式用于接收问题答复：</span></td>
						</tr>
						<tr>
							<th width="17%">常用邮箱：</th>
							<td width="47%"><input name="email" type="text" class="input" /></td>
							<td width="36%">&nbsp;</td>
						</tr>
						<tr>
							<th>手机号码：</th>
							<td><input name="telephone" type="text" class="input" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>验证码：</th>
							<td><input name="" type="text" class="input pop_question7" />
								<img style="width:110px;height:28px" id="captchaimg" src="handleCaptcha" alt="captcha" onclick="javascript:reloadCaptcha()"/></td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="pop_contact1">
				<input type="submit" value="" class="pop_submit" />
			</div>
		</div>
	</form>
	<script type="text/javascript" language="JavaScript">
    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        obj.src = "handleCaptcha?time=" + (new Date()).getTime();
    }  
  </script>
</body>
</html>
