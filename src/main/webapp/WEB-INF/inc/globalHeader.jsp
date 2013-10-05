<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--================== 自动弹出框 城市切换 开始 ==================-->
<div id="brg"></div>
<div id="showdiv">
	<div id="close_bj">
		<span class="font_f">提示</span>
		<div id="close"></div>
	</div>
	<div id="testdiv">
		<div class="testdiv1">根据您的IP地址，您在杭州。</div>
		<div class="testdiv2">目前玖富云金融平台尚未在该地区开通线下贷款业务，金融机构无法接受您的贷款申请。您可以切换至以下地区浏览平台产品服务以及使用平台功能。</div>
		<div class="pop_contact">
			<div class="testdiv3">请选择以下地区</div>
			<div class="pop_city">
				<a href="#">北京</a><a href="#">上海</a><a href="#">常州</a><a href="#">佛山</a><a
					href="#">成都</a><a href="#">广州</a><a href="#">南宁</a><a href="#">宁波</a><a
					href="#">武汉</a><a href="#">青岛</a><a href="#">郑州</a><a href="#">重庆</a><a
					href="#">石家庄</a><a href="#">洪泽</a><a href="#">贵阳</a><a href="#">攀枝花</a><a
					href="#">江门</a><a href="#">南海</a>
			</div>
			<div class="pop_city2">
				<b>温馨提示：</b>请选择您的真实所在地，否则金融机构不能受理您的贷款申请。
			</div>
			<div class="pop_city3">
				<input name="" type="button" value="" class="pop_switch" />
			</div>
		</div>
	</div>
</div>
<!--================== 自动弹出框 城市切换 结束 ==================-->
<div class="top">
	<div class="logo">
		<a href="index.html"></a>
	</div>
	<div class="city font_f">
		<font>北京</font><a href="#" id="pop_city">[切换城市]</a>
	</div>
	<div class="top_right">
		<div class="top_right1"><%=request.getSession().getAttribute("custName") == null ? "":request.getSession().getAttribute("custName") + ", 欢迎您！<font>|</font>"%>
			<%if(request.getSession().getAttribute("custName") == null){ %><a
				href="reg">注册</a><font>|</font><a href="loginView">登录</a><font>|<%} %></font><a
				href="myDaikuan">我的会员中心</a><font>|</font><a>信贷经理登录</a><font>|</font>
				<a>信贷经理入驻</a>
		</div>

		<div class="underPmenu font_f" id="w_nav">
			<ul>
				<li <%if(request.getParameter("index") == null || request.getParameter("index").equals("1")){%>class="hover"<%}%>><a href="index.html">首页</a></li>
				<li <%if(request.getParameter("index") != null && request.getParameter("index").equals("2")){%>class="hover"<%}%>><a href="queryProduct" target="_blank">贷款搜索</a>
					<ul>
						<li class="subline"></li>
						<li><a href="queryProduct?loanUse=2" class="w_a1" target="_blank">消费贷款</a></li>
						<li><a href="queryProduct?loanUse=1" class="w_a1" target="_blank">经营贷款</a></li>
						<li><a href="queryProduct?loanUse=4" class="w_a1" target="_blank">购车贷款</a></li>
						<li><a href="queryProduct?loanUse=3" class="w_a1" target="_blank">购房贷款</a></li>
					</ul></li>
				<li  <%if(request.getParameter("index") != null && request.getParameter("index").equals("3")){%>class="hover"<%}%>><a href="scoreChoose" target="_blank">信用评分</a></li>
				<li  <%if(request.getParameter("index") != null && request.getParameter("index").equals("4")){%>class="hover"<%}%>><a target="_blank">金融团</a> <i></i></li>
				<li  <%if(request.getParameter("index") != null && request.getParameter("index").equals("5")){%>class="hover"<%}%>><a href="gonglue" target="_blank">贷款攻略</a></li>
				<li class="border-bt <%if(request.getParameter("index") != null && request.getParameter("index").equals("6")){%> hover<%}%>"><a href="ask" target="_blank">贷款问答</a></li>
			</ul>
		</div>
	</div>
</div>