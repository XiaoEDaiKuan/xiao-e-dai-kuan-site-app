<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员中心</title>
<%@include file="../../inc/globalScript.jsp"%>
<script type="text/javascript" src="Scripts/member.js"></script>
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
    <form action="modifyPasswd" method="post">
    <c:if test= "${not empty success}">
    	<div class="pop_tx" style="font-size:32px; text-align:center"><b>密码修改成功！</b></div>
    </c:if>
    <c:if test="${empty success}">
    
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th width="18%">输入当前密码：</th>
          <td width="47%"><input name="originalPassword" type="password" class="input" /></td>
        </tr>
        <tr>
          <th>输入新密码：</th>
          <td><input name="newPassword" type="password" class="input" /></td>
        </tr>
        <tr>
          <th>确认新密码：</th>
          <td><input name="newPasswordRep" type="password" class="input" /></td>
        </tr>
        <tr>
          <th></th>
          <td colspan="2" height="70"><input name="" type="submit" value="" class="p_save" /></td>
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
	