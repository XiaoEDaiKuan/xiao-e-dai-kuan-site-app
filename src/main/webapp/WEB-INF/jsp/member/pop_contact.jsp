<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑联系信息</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>

<script type="text/javascript" src="Scripts/editMyinfo.js"></script>

</head>

<body style="background: #fff;">

	<c:if test= "${not empty editOK}">
		<div class="pop_tx" style="font-size:32px; text-align:center"><b>信息已编辑！</b></div>
	</c:if>
	
	<c:if test="${empty editOK}">
   
	<div class="pop_cancel">
		<form action="updateMyInfo" method="post"  id="cust_edit_form">
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
         <tr>
             <th width="50%"><span style="color:red;padding-left:8px">*</span>手机</th>
            <td width="50%">
                 <input name="mobileNO" type="text" value="" class="input" id="cust_edit_tel" />
                 <span id="cust_edit_tel_error" class="e9" style="display:none;"></span>     
            </td>
         </tr>

	    <tr>
          <th><span style="color:red;padding-right:8px">*</span>邮件</th>
          <td>
               <input name="email" type="text" value="" class="input" id="cust_edit_email" />
               <span id="cust_edit_email_error" class="e9" style="display:none;"></span>
          </td>
        </tr>
         <tr>
            <th>邮编：</th>
            <td><input name="postCode" type="text" value="" class="input" /></td>
         </tr>
         <tr>
          <th>住址：</th>
            <td><input name="address" type="text" value="" class="input" /></td>
         </tr>
	  </table>
	
			<div class="pop_cancel2">
				<input name="" type="button" value="" class="cancel_det"  id="cust_edit_submit" />
			</div>
		</form>
	</div>
   </c:if>
</body>
</html>
