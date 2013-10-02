<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>问答列表</title>
<%@include file="../../inc/globalScript.jsp"%>
<script type="text/javascript" src="Scripts/question.js"></script>
<script>
<!--
/*第一种形式 第二种形式 更换显示样式*/
function setTab(name,cursel,n){
for(i=1;i<=n;i++){
var menu=document.getElementById(name+i);
var con=document.getElementById("con_"+name+"_"+i);
menu.className=i==cursel?"hover":"";
con.style.display=i==cursel?"block":"none";
}
}
//-->
</script>
</head>

<body>
	<%@include file="../../inc/globalHeader.jsp"%>

	<%@include file="../../inc/questionSearchForm.jsp"%>
	<div class="top Fuzzysearch1 Loansquiz1">
		<div class="applicationright">
			<!-- 贷款攻略 -->
			<div class="strategy ground Loansquiz8">
			<%@include file="../../inc/gonglueList.jsp"%>
			</div>
			<!-- 贷款助手 -->
			<%@include file="../../inc/daikuanTools.jsp"%>
			<!-- 我要贷款查询 -->
			<%@include file="../../inc/daikuanQuickSearch.jsp"%>
		</div>
		<div class="applicationleft">
			<div class="ask ground Loansquiz10">



				<c:forEach var="question" items="${questions}">
					<p>${question.id}- ${question.subject}-
						${question.askTime}-${question.status}</p>
				</c:forEach>



				<div class="Loansquiz11">
					<h1>
						<a href="贷款问答2.html" target="_blank">能<span>贷款</span>吗?
						</a>
					</h1>
					<p>问:啊就是浪费；就；阿斯科利的酒饭两开叫阿桑兰多夫金水淀粉</p>
					<p>答:啊就是浪费；就；阿斯科利的酒饭两开叫阿桑兰多夫金水淀粉</p>
					<div>
						2012-12-12<em>来自黑龙江的问题</em>
					</div>
				</div>
				<div class="Loansquiz11">
					<h1>
						<a href="贷款问答2.html" target="_blank">能<span>贷款</span>吗?
						</a>
					</h1>
					<p>问:啊就是浪费；就；阿斯科利的酒饭两开叫阿桑兰多夫金水淀粉</p>
					<p>答:啊就是浪费；就；阿斯科利的酒饭两开叫阿桑兰多夫金水淀粉</p>
					<div>
						2012-12-12<em>来自黑龙江的问题</em>
					</div>
				</div>
				<div class="Loansquiz11">
					<h1>
						<a href="贷款问答2.html" target="_blank">能<span>贷款</span>吗?
						</a>
					</h1>
					<p>问:啊就是浪费；就；阿斯科利的酒饭两开叫阿桑兰多夫金水淀粉</p>
					<p>答:啊就是浪费；就；阿斯科利的酒饭两开叫阿桑兰多夫金水淀粉</p>
					<div>
						2012-12-12<em>来自黑龙江的问题</em>
					</div>
				</div>
				<div class="Loansquiz11">
					<h1>
						<a href="贷款问答2.html" target="_blank">能<span>贷款</span>吗?
						</a>
					</h1>
					<p>问:啊就是浪费；就；阿斯科利的酒饭两开叫阿桑兰多夫金水淀粉</p>
					<p>答:啊就是浪费；就；阿斯科利的酒饭两开叫阿桑兰多夫金水淀粉</p>
					<div>
						2012-12-12<em>来自黑龙江的问题</em>
					</div>
				</div>
				<div class="Loansquiz11">
					<h1>
						<a href="贷款问答2.html" target="_blank">能<span>贷款</span>吗?
						</a>
					</h1>
					<p>问:啊就是浪费；就；阿斯科利的酒饭两开叫阿桑兰斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫多夫金水淀粉</p>
					<p>答:啊就是浪费；就；阿斯科利的酒饭两开叫阿斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫斯科利的酒饭两开叫阿桑兰多夫桑兰多夫金水淀粉</p>
					<div>
						2012-12-12<em>来自黑龙江的问题</em>
					</div>
				</div>
				<div class="Loansquiz11">
					<h1>
						能<span>贷款</span>吗?
					</h1>
					<p>问:啊就是浪费；就；阿斯科利的酒饭两开叫阿桑兰多夫金水淀粉</p>
					<p>答:啊就是浪费；就；阿斯科利的酒饭两开叫阿桑兰多夫金水淀粉</p>
					<div>
						2012-12-12<em>来自黑龙江的问题</em>
					</div>
				</div>
				<div class="me_next">
					<a href="#"><em>1</em></a><a href="#"><em>2</em></a><a href="#"><em>3</em></a><a
						href="#"><em>下一页</em></a><span>共<font>66</font>个结果
					</span>
				</div>
			</div>
		</div>
	</div>
	</div>


	<%@include file="../../inc/globalFooterMenu.jsp"%>
	<%@include file="../../inc/globalFooter.jsp"%>
</body>
</html>
