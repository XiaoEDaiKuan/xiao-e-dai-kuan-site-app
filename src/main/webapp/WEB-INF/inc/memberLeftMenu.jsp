<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="members_left font_f">
	<div class="members_left1">
		<h1>会员中心</h1>
	</div>
	<div class="members_left2">
		<ul>
			<li><a href="myDaikuan"<%if(request.getParameter("index").equals("1")){%>class="hover2"<%}%>>我的贷款</a></li>
			<li><a href="myMessage"<%if(request.getParameter("index").equals("2")){%>class="hover2"<%}%>>我的消息</a></li>
			<li><a href="myCreditScore"<%if(request.getParameter("index").equals("3")){%>class="hover2"<%}%>>我的信用评分</a></li>
			<li><a href="editMyInfo"<%if(request.getParameter("index").equals("4")){%>class="hover2"<%}%>>编辑资料</a></li>
			<li><a href="myQuestion"<%if(request.getParameter("index").equals("5")){%>class="hover2"<%}%>>我的提问</a></li>
			<li><a href="changePassword"<%if(request.getParameter("index").equals("6")){%>class="hover2"<%}%>>修改密码</a></li>
		</ul>
	</div>
</div>