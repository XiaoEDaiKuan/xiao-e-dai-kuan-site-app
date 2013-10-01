<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
			<jsp:param name="index" value="4" />
		</jsp:include>
  <div class="members_right ground">
    <div class="opinion"></div>
    <div class="edit">
    
      <div class="editd1"><font>身份信息</font><a href="#" id="pop_information">编辑</a></div>
      <div class="editd2">
        <p><font>姓名：</font><span>王先生</span></p>
        <p><font>身份证号：</font><span>150646890546083756</span></p>
      </div> 
       
      <div class="editd1"><font>联系方式</font><a href="#" id="pop_contact">编辑</a></div>
      <div class="editd2">
        <p><font>电话：</font><span>16980767915</span></p>
        <p><font>邮箱：</font><span>16897265@qq.com</span></p>
        <p><font>住址：</font><span>北京朝阳区麦子店街26号</span></p>
        <p><font>邮编：</font><span>100000</span></p>
      </div>

    </div>
       
  </div>
</div>

<!--===========页面内容部分 结束===========-->
<%@include file="../../inc/memberFooter.jsp"%>
</body>
</html>
	