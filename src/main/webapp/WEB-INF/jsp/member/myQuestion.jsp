<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员中心</title>
<%@include file="../../inc/globalScript.jsp"%>
<script type="text/javascript" src="Scripts/member.js"></script>
<script type="text/javascript" src="Scripts/zhankai.js"></script>
</head>

<body>
<%@include file="../../inc/memberHeader.jsp"%>
<!--===========页面内容部分 开始===========-->
<div class="members clear">
  <jsp:include page="../../inc/memberLeftMenu.jsp">
			<jsp:param name="index" value="5" />
		</jsp:include>
  <div class="members_right ground">
    <div class="opinion"></div>
    <div class="edit">
      <div id="nav">
        <div class="title" id="menu1" onclick="showmenu('1') "><a>信用卡未还清可以贷款么？【薪易贷】</a><span>已解决</span><font>2013-8-25</font></div>
        <div id="list1" class="content" style="display:none">
          <ul>
            <li><strong>问题：</strong>我信用卡负债10万，月收入是我公司转账打卡，流水约1万每月，信用卡有按期还，从无逾期，长沙的，平安申请被拒绝了，还有哪里可以做？大概3万~能批吗？</li>
            <li><strong>回答：</strong>从你提供的资料可以看出你是信用良好的客户,并且有一定的还款能力,您你只需准备好身份证\工作证明,工资流水就可以在我们网站进行申请。</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>

<!--===========页面内容部分 结束===========-->
<%@include file="../../inc/memberFooter.jsp"%>
</body>
</html>
	