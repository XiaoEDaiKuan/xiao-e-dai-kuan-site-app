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
		<%@include file="../../inc/memberLeftMenu.jsp"%>
		<div class="members_right ground">
			<div class="opinion"></div>

			<!--<div class="me_next"><a href="#"><em>1</em></a><a href="#"><em>2</em></a><a href="#"><em>3</em></a><a href="#"><em>下一页</em></a><span>共<font>66</font>个结果</span></div>-->

			<div class="message">
				<div class="message1">
					未读 <b>0</b> 封，已读 <b>2</b> 封，共 <b>3</b> 封
				</div>
				
				
				<div class="message2">
					<span> <input name="" type="checkbox" value="" />
					</span><span></span><font>收件人</font>
					<p>主题</p>
					<a>时间↓</a>
				</div>
				
				<!-- 第一条 -->
				<div class="mes_tit" id="n_menu1">
					<span> <input name="" type="checkbox" value="" />
					</span><span  onclick="n_showmenu('1') "><img src="images/message2.jpg" width="14" height="11" /></span><font  onclick="n_showmenu('1') ">安心</font>
					<p onclick="n_showmenu('1') ">安心贷的最新活动</p>
					<a>2013-9-12</a>
				</div>
				<div id="n_list1" class="n_content" style="display: none">
					李先生:<br /> 从无逾期，长沙的，平安申请被拒绝了，还有哪里可以做？大概3万~能批吗？
				</div>
				
				<!-- 第二条 -->
				<div class="mes_tit" id="n_menu2">
					<span> <input name="" type="checkbox" value="" />
					</span><span  onclick="n_showmenu('2') "><img src="images/message3.jpg" width="14" height="12" /></span><font  onclick="n_showmenu('2') ">安心</font>
					<p onclick="n_showmenu('2') ">安心贷的最新活动</p>
					<a>2013-9-12</a>
				</div>
				<div id="n_list2" class="n_content" style="display: none">
					李先生:<br /> 从无逾期，长沙的，平安申请被拒绝了，还有哪里可以做？大概3万~能批吗？
				</div>

			</div>
			<div class="message3 clear">
				<div class="message3_2">
					<input name="" type="checkbox" value="" /> <font>全选</font> <input
						name="" type="button" value="删除" class="n_btn5" /> <input name=""
						type="button" value="标记为已读" class="n_btn6" />
				</div>
				<div class="message3_1" style="height:60px">
					<div class="me_next" style="height:30px">
						<a href="#"><em>第一页</em></a><a href="#"><em>上一页</em></a><a
							href="#"><em>1</em></a><a href="#"><em>下一页</em></a><a href="#"><em>末尾页</em></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--===========页面内容部分 结束===========-->
	<%@include file="../../inc/memberFooter.jsp"%>
</body>
</html>
