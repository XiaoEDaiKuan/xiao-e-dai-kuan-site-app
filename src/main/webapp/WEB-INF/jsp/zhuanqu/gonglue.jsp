<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款攻略</title>
<%@include file="../../inc/globalScript.jsp" %>
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
<jsp:include page="../../inc/globalHeader.jsp">
	<jsp:param name="index" value="5" />
</jsp:include>
<%@include file="../../inc/zhuanquMenu.jsp" %>
<div class="Fuzzysearch">
	<div class="top Fuzzysearch1">
    	<div class="application ClearFix">
        	<div class="applicationright">
               <!-- 贷款助手 -->
			<%@include file="../../inc/daikuanTools.jsp"%>
			<!-- 我要贷款查询 -->
			<%@include file="../../inc/daikuanQuickSearch.jsp"%>
    </div>
        	<div class="applicationleft">
            	<div class="credit ground applicationleft13">
      <div class="credit_title"><span class="credit_title1 font_f Theloanright6">热点专题</span></div>
      <div class="Theloan">
      	<div class="Theloanleft Theloanright">
        	 <ul class="strategy_list Theloanright1">
      <li><a href="gonglueDT?gonglueID=1" target="_blank">个人贷款知识普及</a></li>
      <li><a href="gonglueDT?gonglueID=6" target="_blank">申请个人小额无抵押贷款的一般流程</a></li>
      <li><a href="gonglueDT?gonglueID=8" target="_blank">无抵押贷款介绍</a></li>
      <li><a href="gonglueDT?gonglueID=11" target="_blank">申请汽车抵押贷款遇到的常见问题</a></li>
      <li><a href="gonglueDT?gonglueID=16" target="_blank">经营贷款定义以及如何申请</a></li>
      <li><a href="gonglueDT?gonglueID=19" target="_blank">经营性物业抵押贷款的特点和优势</a></li>
      <li><a href="gonglueDT?gonglueID=21" target="_blank">消费贷款注意事项</a></li>
      <li><a href="gonglueDT?gonglueID=25" target="_blank">消费贷款动态</a></li>
    </ul>
        </div>
      	<div class="Theloanleft">
        	<h1>9F带您区别抵押贷款与按揭</h1>
            <img src="images/img38.jpg" width="265" height="185" />
            <p>什么是抵押贷款？什么是按揭贷款？...<a href="gonglueDT?gonglueID=14" target="_blank">[更多]</a></p>
        </div>
      </div>
    </div>
    <div class="credit ground Loansquiz7 ">
        <div id="Tab2">
<div class="Menubox font_f">
<ul>
<li id="sun1" onclick="setTab('sun',1,2)"  class="hover">抵押贷款</li>
<li id="sun2" onclick="setTab('sun',2,2)" >无抵押贷款</li>
</ul>
</div>
<div class="Contentbox Theloanright5">
   <div id="con_sun_1" >
		<div class="Theloanright2"><a href="gonglueDT?gonglueID=15">银行抵押贷款分类知识</a><span>|</span><a href="gonglueDT?gonglueID=12">抵押贷款怎么分类和估值</a><span>|</span><a href="gonglueDT?gonglueID=11">申请汽车抵押贷款遇到的常见问题</a></div>
        <div class="Theloan">
      	<div class="Theloanleft Theloanright">
        	 <ul class="strategy_list Theloanright1">
               <li><a href="gonglueDT?gonglueID=11"  target="_blank">申请汽车抵押贷款遇到的常见问题</a></li>
               <li><a href="gonglueDT?gonglueID=12" target="_blank">抵押贷款怎么分类和估值</a></li>
               <li><a href="gonglueDT?gonglueID=13" target="_blank">房屋抵押贷款基础知识</a></li>
            </ul>
        </div>
      	<div class="Theloanleft ClearFix">
        	<div>
            	<div class="Theloanright3"><h1>银行抵押贷款分类知识</h1><p>银行抵押贷款有哪些种类?<a href="gonglueDT?gonglueID=15" target="_blank">[详细]</a></p></div>
            	<img src="images/img38.jpg" width="90" height="64" />
            </div>
            <ul class="strategy_list Theloanright1 Theloanright4">
                <li><a href="gonglueDT?gonglueID=14" target="_blank">9F带您区别抵押贷款与按揭</a></li>
            </ul>
        </div>
      </div>
  </div>
<div id="con_sun_2" style="display:none">

		<div class="Theloanright2"><a href="gonglueDT?gonglueID=6" name="" target="_blank">申请个人小额无抵押贷款的一般流程</a><span>|</span><a href="gonglueDT?gonglueID=7" target="_blank">申请个人无抵押贷款的条件及注意事项</a><span>|</span><a href="gonglueDT?gonglueID=8" target="_blank">无抵押贷款介绍</a></div>
        <div class="Theloan">
      	<div class="Theloanleft Theloanright">
        	 <ul class="strategy_list Theloanright1">
               <li><a href="gonglueDT?gonglueID=9" target="_blank">无抵押贷款需备手续</a></li>
               <li><a href="gonglueDT?gonglueID=6" name="" target="_blank">申请个人小额无抵押贷款的一般流程</a></li>
                <li><a href="gonglueDT?gonglueID=6" name="" target="_blank">申请个人小额无抵押贷款的一般流程</a><li>
            </ul>
        </div>
      	<div class="Theloanleft ClearFix">
        	<div>
            	<div class="Theloanright3"><h1>贷款渠道介绍</h1><p>贷款渠道有哪些?<a href="gonglueDT?gonglueID=10" target="_blank">【详细】</a></p></div>
            	<img src="images/img38.jpg" width="90" height="64" />
            </div>
            <ul class="strategy_list Theloanright1 Theloanright4">
                <li><a href="gonglueDT?gonglueID=14" target="_blank">9F带您区别抵押贷款与按揭</a></li>
                <li><a href="gonglueDT?gonglueID=8" target="_blank">无抵押贷款介绍</a></li>
            </ul>
        </div>
      </div>

</div>
</div>
</div>
    </div>



 <div class="credit ground Loansquiz7 ">
        <div id="Tab2">
<div class="Menubox font_f">
<ul>
<li id="two1" onclick="setTab('two',1,2)"  class="hover">消费类贷款</li>
<li id="two2" onclick="setTab('two',2,2)" >经营类贷款</li>
</ul>
</div>
<div class="Contentbox Theloanright5">
   <div id="con_two_1" >
		<div class="Theloanright2"><a href="gonglueDT?gonglueID=22" target="_blank">消费贷款最新情况</a><span>|</span><a href="gonglueDT?gonglueID=23" target="_blank">消费贷款申请过程</a><span>|</span><a href="gonglueDT?gonglueID=25" target="_blank">消费贷款动态</a></div>
        <div class="Theloan">
      	<div class="Theloanleft Theloanright">
        	 <ul class="strategy_list Theloanright1">
      
      <li><a href="gonglueDT?gonglueID=22" target="_blank">消费贷款最新情况</a></li>
      <li><a href="gonglueDT?gonglueID=23" target="_blank">消费贷款申请过程</a></a></li>
    </ul>
        </div>
      	<div class="Theloanleft ClearFix">
        	<div>
            	<div class="Theloanright3"><h1>消费贷款注意事项</h1><p>消费贷款有哪些注意事项?...<a href="gonglueDT?gonglueID=21" name="" target="_blank">【详细】</a></p></div>
            	<img src="images/img39.jpg" width="90" height="64" />
            </div>
            <ul class="strategy_list Theloanright1 Theloanright4">
      <li><a href="gonglueDT?gonglueID=24" target="_blank">消费贷款基本介绍</a></li>
      <li><a href="gonglueDT?gonglueID=25" target="_blank">消费贷款动态</a></li>
    </ul>
        </div>
      </div>
  </div>
<div id="con_two_2" style="display:none">
		<div class="Theloanright2"><a href="gonglueDT?gonglueID=16" name="" target="_blank">经营贷款定义以及如何申请</a><span>|</span><a href="gonglueDT?gonglueID=17" target="_blank">经营贷款申请流程以及资料</a><span>|</span><a href="gonglueDT?gonglueID=18" target="_blank">经营性物业抵押贷款的风险</a></div>
        <div class="Theloan">
      	<div class="Theloanleft Theloanright">
        	 <ul class="strategy_list Theloanright1">
      
      <li><a href="gonglueDT?gonglueID=19" target="_blank">经营性物业抵押贷款的特点和优势</a></li>
      <li><a href="gonglueDT?gonglueID=20" target="_blank">个人经营性贷款“解渴”小企业</a></li>
    </ul>
        </div>
      	<div class="Theloanleft ClearFix">
        	<div>
            	<div class="Theloanright3"><h1>经营贷款申请流程</h1><p>经营贷款如何申请?...<a href="gonglueDT?gonglueID=17" target="_blank">【详细】</a></p></div>
            	<img src="images/img39.jpg" width="90" height="64" />
            </div>
            <ul class="strategy_list Theloanright1 Theloanright4">
      <li><a href="gonglueDT?gonglueID=16" name="" target="_blank">经营贷款定义以及如何申请</a></li>
      <li><a href="gonglueDT?gonglueID=17" target="_blank">经营贷款申请流程以及资料</a></li>
    </ul>
        </div>
      </div>
	
</div>
</div>
</div>
    </div>
    <div class="credit ground applicationleft13">
      <div class="credit_title"><span class="credit_title1 font_f">新手贷款攻略</span></div>
      <div class="Theloan">
      	<div class="Theloanleft Theloanright">
        	 <ul class="strategy_list Theloanright1">
   	 <li><a href="gonglueDT?gonglueID=1" name="" target="_blank">个人贷款知识普及</a></li>
     <li><a href="gonglueDT?gonglueID=2" target="_blank">良好的信用记录对您有利</a></li>
     <li><a href="gonglueDT?gonglueID=3" target="_blank">如何在征信系统中查询个人信用记录</a><li>

    </ul>
        </div>
      	<div class="Theloanleft">
        	<ul class="strategy_list Theloanright1">
      <li><a href="gonglueDT?gonglueID=4" target="_blank">如何对抵押贷款做选择</a></li>
      <li><a href="gonglueDT?gonglueID=5" target="_blank">抵押物价值以及存管问题</a></li>
    </ul>
        </div>
      </div>
    </div>
    
            </div>
            
        </div>

    </div>
</div>

<%@include file="../../inc/globalFooterMenu.jsp" %>
<%@include file="../../inc/globalFooter.jsp" %>
</body>
</html>
