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
            
                         <h1>良好的信用记录对您有利</h1>
                        <h2>时间:2013-10-10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
                        <p> 现实生活中，除了个人的信用行为外，有时候还会出现因为个人出借或者遗失身份证，造成个人身份被盗用，使自己的信用受到损害的情况。现在个人因为身份证遗失，被不法分子冒用，造成身份证的主人被公安机关网上通缉和关押的事时有发生。所以我们必须谨慎、妥善保管好个人有效身份证件，努力做到：妥善保管好各种有效身份证件（包括各种可以证明身份证的证件）及其复印件，不要轻易将这些身份证件借给他人。</p>
                        　　                                                   <p>  向他人提供身份证复印件时，最好在身份证件复印件有文字的地方标明用途，比如加上“本复印件仅为……用途，再复印无效”。不用的复印件，千万不可随意扔弃，应确认销毁。另外，应做到定期查询个人信用报告，关注自己的信用记录。一旦发现自己身份被盗用，立即向公安机关报案。</p>
                        <p>　只要保持良好的信用记录，在经济生活中就能为您带来许多优惠。</p>
                        <p>1.节省商业银行的审贷时间，个人能更快地获得贷款。</p>
　　                                                                          <p>2. 在贷款利率、期限、金额等方面也可能得到优惠，比如，可以享受商业银行的优惠利率贷款，贷款期限可能更长些、金额可能更大些。</p>
                        <p>3. 如果个人的信用状况非常好且其他条件也符合要求，商业银行甚至有可能给个人发放不需要抵押或担保的个人信用贷款。 如果信用卡出现逾期还款的坏账记录，还款后不要马上销户，避免信用记录中的逾期还款记录没有修复的机会，长久影响自己的信用状况。正确的做法是正常使用这张信用卡，用两年时间，修复好信用记录之后再进行销户处理。</p>
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
