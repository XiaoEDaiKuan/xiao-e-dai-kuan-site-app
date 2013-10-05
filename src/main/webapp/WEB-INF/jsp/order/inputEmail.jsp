<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>输入邮箱 </title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
</head>

<body style="background: #fff;">

	<c:if test= "${not empty emailOK}">
		<div class="pop_tx" style="font-size:32px; text-align:center"><b>产品信息已发送！</b></div>
	</c:if>
	
	<c:if test="${empty emailOK}">
   
	<div class="pop_cancel">
		<form action="orderEmail" method="post">
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
         <tr>
             <th width="50%"><span style="color:red;padding-left:8px">*</span>邮箱</th>
            <td width="50%"><input name="mobileNO" type="text" value="" class="input" /></td>
         </tr>
	  </table>
	
			<div class="pop_cancel2">
				<input name="" type="submit" value="" class="cancel_det"  />
			</div>
		</form>
	</div>
   </c:if>
</body>
</html>
