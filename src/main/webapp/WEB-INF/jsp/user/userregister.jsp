<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
</head>
<body>
<form action="/createUser.do" method="post">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
    <tr>
      <th width="8%">手机：</th>
      <td width="92%"><input name="mobileNO" type="text" value="13917367496" class="input" /></td>
    </tr>
    <tr>
      <th>姓名：</th>
      <td><input name="custName" type="text" value="liuhg1" class=" input input1" /></td>
    </tr>
    <tr>
      <th>密码：</th>
      <td><input name="logonPasswd" type="password" class="input" /></td>
    </tr>
    <tr>
      <th>确认密码：</th>
      <td><input name="" type="password" class="input" /></td>
    </tr>
    <tr>
      <th>证件类型</th>
      <td><input name="idType" type="text" value="0" class="input" /></td>
    </tr>
    <tr>
      <th>证件号码</th>
      <td><input name="idNO" type="text" value="210726197110301713" class="input" /></td>
    </tr>
    <tr>
      <th>电子邮件</th>
      <td><input name="email" type="text" value="a@a1.com" class="input" /></td>
    </tr>
    <tr>
      <th>邮编</th>
      <td><input name="postCode" type="text" value="210000" class="input" /></td>
    </tr>
    <tr>
      <th>住址</th>
      <td><input name="address" type="text" value="address1" class="input" /></td>
    </tr>
    
  </table>

<input type="submit">
</form>
</body>
</html>