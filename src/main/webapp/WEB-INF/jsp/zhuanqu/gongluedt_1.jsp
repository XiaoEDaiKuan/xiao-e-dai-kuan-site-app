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
 document.getElementById('xinshou').className="curr";
 
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
                    	<h1>助学并不难贷</h1>
                        <h2>时间:2012-12-12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:金融原厂&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作者:叶文</h2>
                        <p>8月底9月初不到一周的时间内，来自全国政协及国务院政策研究室的两个高规格调研组频频造访鄂尔多斯，调研的主题无一例外地围绕鄂尔多斯当前的楼市困局展开。</p>
                        <p>8月底9月初不到一周的时间内，来自全国政协及国务院政策研究室的两个高规格调研组频频造访鄂尔多斯，调研的主题无一例外地围绕鄂尔多斯当前的楼市困局展开。</p>
                        <p>8月底9月初不到一周的时间内，来自全国政协及国务院政策研究室的两个高规格调研组频频造访鄂尔多斯，调研的主题无一例外地围绕鄂尔多斯当前的楼市困局展开。</p>
                        <p>8月底9月初不到一周的时间内，来自全国政协及国务院政策研究室的两个高规格调研组频频造访鄂尔多斯，调研的主题无一例外地围绕鄂尔多斯当前的楼市困局展开。</p>
                        <div>责任编辑:叶文<br /><a href="#">打印</a>&nbsp;|&nbsp;<a href="#">投稿</a></div>
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
