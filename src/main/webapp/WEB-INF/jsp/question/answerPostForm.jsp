<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我要回答</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
</head>

<body style="border:none;padding:0px">
<form action="postQuestionAnswerSave" method="post">
		<div class="pop_contact">
			<div class="pop_question" style="width:680px">
				<div class="pop_question1">
					<span>简单描述您的回答</span> <font>您还可以输入<em>50</em>个字
					</font>
				</div>
				<div class="pop_question4">
					<input name="subject" type="text" style="width:600px" class="n_srk2 pop_question2" />
					<input name="questionId" id="questionId" type="hidden" value="${question.id}"></input>
				</div>
				<div class="pop_question3">
					回答详细描述（选填）：<font>回答描述的越详细，得到的满意度也越高</font>
				</div>
				<div class="pop_question4">
					<textarea name="detail" cols="" rows="" style="width:600px" class="n_srk2 pop_question5"></textarea>
				</div>
			</div>
			<div class="pop_contact1">
				<input type="submit" value="" class="pop_submit" />
			</div>
		</div>
	</form>
</body>
</html>