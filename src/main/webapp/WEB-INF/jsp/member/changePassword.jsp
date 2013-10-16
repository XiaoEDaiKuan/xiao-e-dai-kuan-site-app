<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员中心</title>

<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>

<script type="text/javascript" src="Scripts/modify_passwd.js"></script>


</head>

<body>
<%@include file="../../inc/memberHeader.jsp"%>
<!--===========页面内容部分 开始===========-->
<div class="members clear">
  <jsp:include page="../../inc/memberLeftMenu.jsp">
			<jsp:param name="index" value="6" />
		</jsp:include>
  <div class="members_right ground">
    <div class="opinion"></div>
    <div class="password">
    <form action="modifyPasswd" method="post"  id="modify_passwd_form">
    <c:if test= "${not empty success}">
    	<div class="pop_tx" style="font-size:32px; text-align:center"><b>密码修改成功！</b></div>
    </c:if>
    <c:if test="${empty success}">
    
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th width="18%">输入当前密码：</th>
          <td width="47%">
                <input name="originalPassword" type="password" class="input"  id="modify_passwd_cur" />
                <span id="modify_passwd_cur_error" class="e9" style="display:none;"></span>     
          </td>
        </tr>
        <tr>
          <th>输入新密码：</th>
          <td>
               <input name="newPassword" type="password" class="input" id="modify_passwd_new_one" />
               <span id="modify_passwd_new_one_error" class="e9" style="display:none;"></span>    
           </td>
        </tr>
        <tr>
          <th>确认新密码：</th>
          <td>
                <input name="newPasswordRep" type="password" class="input"  id="modify_passwd_new_two" />
                <span id="modify_passwd_new_two_error" class="e9" style="display:none;"></span>
          </td>
        </tr>
        <tr>
          <th></th>
          <td colspan="2" height="70"><input name="" type="button" value="" class="p_save"  id="modify_passwd_submit" /></td>
        </tr>
      </table>
      </c:if>
      </form>
    </div>
  </div>
</div>

<!--===========页面内容部分 结束===========-->
<%@include file="../../inc/memberFooter.jsp"%>
</body>
</html>
	