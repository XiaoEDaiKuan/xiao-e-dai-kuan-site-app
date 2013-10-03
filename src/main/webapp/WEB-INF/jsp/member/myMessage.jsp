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
			<jsp:param name="index" value="2" />
		</jsp:include>
		<div class="members_right ground">
			<div class="opinion"></div>

			<!--<div class="me_next"><a href="#"><em>1</em></a><a href="#"><em>2</em></a><a href="#"><em>3</em></a><a href="#"><em>下一页</em></a><span>共<font>66</font>个结果</span></div>-->

			<div class="message">
				<div class="message1">
					未读 <b>${unreadCnt}</b> 封，已读 <b>${readCnt}</b> 封，共 <b>${messageCnt}</b> 封
				</div>
				
				
				<div class="message2">
					<span> <input name="" type="checkbox" value="" />
					</span><span></span><font>收件人</font>
					<p>主题</p>
					<a>时间↓</a>
				</div>
				
				<!-- 第一条 -->
			  <c:forEach var="message" items="${messagePage.items}" varStatus="vst">

				<div class="mes_tit" id="n_menu${vst.index+1}">
					<span> <input name="" type="checkbox" value="" />
					</span><span  onclick="n_showmenu('${vst.index+1}') "><img src="images/message2.jpg" width="14" height="11" /></span><font  onclick="n_showmenu('${vst.index+1}') ">${message.toPerson}</font>
					<p onclick="n_showmenu('${vst.index+1}') ">${message.subject}</p>
					<a><fmt:formatDate value="${message.sendTime}" pattern="yyyy-MM-dd HH:mm:ss"/></a>
			 	</div>
				 <div id="n_list${vst.index+1}" class="n_content" style="display: none">
					${message.toPerson}先生:<br /> ${message.content}
				 </div>
			  </c:forEach>	
			
			</div>
			
			<div class="message3 clear">
				<div class="message3_2">
					<input name="" type="checkbox" value="" /> <font>全选</font> <input
						name="" type="button" value="删除" class="n_btn5" /> <input name=""
						type="button" value="标记为已读" class="n_btn6" />
				</div>
				<div class="message3_1" style="height:60px">
                 
                 <div class="me_next padd">
				   <c:forEach var="i" begin="1" end="${messagePage.totalPages}" step="1">
                    	<a  href="myMessage?pageIndex=${i}" <c:if test="${i == messagePage.pageIndex}">class="currentPager"</c:if> ><em>${i}</em></a>
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
