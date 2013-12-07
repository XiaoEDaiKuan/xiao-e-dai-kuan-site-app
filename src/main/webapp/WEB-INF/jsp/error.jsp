<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>错误</title>
<%@include file="../inc/globalScript.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		setTimeout("history.back()", 5000);
	});	
</script>
</head>
<body>
<jsp:include page="../inc/globalHeader.jsp">
	<jsp:param name="index" value="1" />
</jsp:include>
<div class="main3 padding-bt ground mt20">
  <div class="error clear">
    <div class="error1"> <img src="images/404_1.jpg" width="283" height="131" />
      <input name="" type="button" value="" onclick="javascript:history.back()" />
      <p>5秒钟后将自动返回到上一个页面</p>
    </div>
    <div class="error2">${errorMessage}</div>
  </div>
  <div class="kong2"></div>
</div>
<div class="footer2">
  <div class="footer2_2">
		<font>版权所有：北京玖富时代投资顾问有限公司 copyright&copy;2012 京ICP备07003840</font><br />
		技术服务商：北京九富科技有限公司<br />
		公司总部地址：北京朝阳区麦子店街37号盛福大厦2580<br />
		传真：010-85276916&nbsp;&nbsp;&nbsp;&nbsp;邮编：100000</div>
</div>
</body>
</html>
