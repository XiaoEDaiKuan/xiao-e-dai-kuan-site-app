<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款攻略</title>
<%@include file="../../inc/globalScript.jsp" %>
</head>

<body>
<jsp:include page="../../inc/globalHeader.jsp">
	<jsp:param name="index" value="5" />
</jsp:include>
<%@include file="../../inc/zhuanquMenu.jsp" %>

<script type="text/javascript" language="JavaScript">
 document.getElementById('xiaofei').className="curr";
 
</script>

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
            <div class="ask ground Loansquiz10">
                	<div class="Theloanright9">
            
                         <h1>消费贷款基本介绍</h1>
                        <h2>时间:2013-10-13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
<p>1.定义</p>
<p>消费贷款也叫消费者贷款，主要指的是用于留学贷款、房屋装修、购买耐用品乃至买车等方面的个人贷款，从种类上看，消费贷款包括住宅抵押贷款、非住房贷款和信用卡贷款。具有消费用途广泛、贷款额度较高、贷款期限较长等特点。</p>
<p>2.特点</p>
<p>具有消费用途广泛、贷款额度较高、贷款期限较长等特点。高风险、高收益、周期性（长期性）、利率不敏感性。</p>
<p>3.种类</p>
<p>居民住宅抵押贷款</p>
<p>非住宅贷款：主要包括汽车贷款、耐用消费品贷款、教育贷款和旅游贷款。</p>
<p>信用卡贷款</p>
   
                    <div>
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
