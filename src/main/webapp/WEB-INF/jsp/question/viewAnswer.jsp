<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款问答</title>
<%@include file="../../inc/globalScript.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
	$("#pop_city").click(function(){
		tipsWindown("您可以选择以下地区：","iframe:iframe:pop_city.html","500","200","true","","false","text","");
	});
	$("#pop_question").click(function(){
		tipsWindown("我要提问：","iframe:iframe:pop_question.html","550","465","true","","false","text","");
	});
	
	});	
	
	setTimeout('_magicTimeout()',20*1000);
    function _magicTimeout(){
	   $('.time_box').hide();
    }	
</script>
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
			<%@include file="../../inc/gonglueList.jsp"%>
			<!-- 贷款助手 -->
			<%@include file="../../inc/daikuanTools.jsp"%>
			<!-- 我要贷款查询 -->
			<%@include file="../../inc/daikuanQuickSearch.jsp"%>
		</div>
		<div class="applicationleft">
			<div class="ask ground Loansquiz10 Loansquiz15 Loansquiz8">
				<div class="Loansquiz13">
					<h1>贷款</h1>
					<p>
						<span>2013-12-25&nbsp;13:24</span>提问者:121212**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;问答来自:黑龙江&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标签:贷款&nbsp;贷款&nbsp;贷款
					</p>
				</div>
				<p class="Loansquiz14">11日在大连举行的2013年夏季达沃斯论坛上，国务院总理李克强发表了《以改革创新驱动中国经济长期持续健康发展》的开幕致辞，透露出的政策信号引起了各界的高度关注11日在大连举行的2013年夏季达沃斯论坛上，国务院总理李克强发表了《以改革创新驱动中国经济长期持续健康发展》的开幕致辞，透露出的政策信号引起了各界的高度关注。</p>
			</div>
			<div class="credit ground  applicationleft13">
				<div class="credit_title Fuzzysearch7">
					<div
						class="credit_title font_f Fuzzysearch2 applicationleft5 Loansquiz16">
						<span>平台回答</span>
					</div>
				</div>
				<p class="Loansquiz17">11日在大连举行的2013年夏季达沃斯论坛上，国务院总理李克强发表了《以改革创新驱动中国经济长期持续健康发展》的开幕致辞，透露出的政策信号引起了各界的高度关注11日在大连举行的2013年夏季达沃斯论坛上</p>
				<div class="Loansquiz18">9F云金融&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2010-12-12</div>
			</div>
		</div>
	</div>


	<%@include file="../../inc/globalFooterMenu.jsp"%>
	<%@include file="../../inc/globalFooter.jsp"%>
</body>
</html>
