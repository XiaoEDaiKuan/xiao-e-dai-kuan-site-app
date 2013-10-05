<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	

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

	  <c:forEach var="question" items="${questionPage.items}" varStatus="vst">

        <div class="title" id="menu1" onclick="showmenu('${vst.index+1}') "><a>${question.subject}【${question.product.name}】</a>
        <span>
        	<fmt:bundle basename="dict/dict-mapping" prefix="QUESTION_STATUS.">
			<fmt:message key="${question.status}" />
			</fmt:bundle>
        </span>
        <font><fmt:formatDate value="${question.askTime}" pattern="yyyy-MM-dd HH:mm:ss"/></font></div>
        <div id="list${vst.index+1}" class="content" style="display:none">
          <ul>
            <li><strong>问题：</strong>${question.detail}</li>
            <li><strong>回答：</strong>${question.answers[0].answerContent}</li>
          </ul>
        </div>
      </c:forEach>
                       <div class="me_next padd">
				   <c:forEach var="i" begin="1" end="${questionPage.totalPages}" step="1">
                    	<a  href="myQuestion?pageIndex=${i}" <c:if test="${i == questionPage.pageIndex}">class="currentPager"</c:if> ><em>${i}</em></a>
                   </c:forEach>
                  </div>
      
      </div>
    </div>
  </div>
</div>

<!--===========页面内容部分 结束===========-->
<%@include file="../../inc/memberFooter.jsp"%>
</body>
</html>
	