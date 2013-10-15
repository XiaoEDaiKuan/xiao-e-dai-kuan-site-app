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
            
                         <h1>消费贷款动态</h1>
                        <h2>时间:2013-10-12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
<p>银行回应</p>
<p>农业银行、工商银行、中信银行、天津农商行在本市的首套房贷眼下仍然延续基准利率7.05%基础上再八五折的标准。而招商银行、建设银行的首套房贷则是基准利率的九折。</p>
<p>在北京多家银行调查发现，原来众多银行上浮个人消费贷款利率并非新闻――早已上浮了1至2年了，而且上浮比例落差很大，也有个别银行比如天津银行仍然维持基准利率按兵未动。至于首套房贷，目前各行在本市最高的首套房商贷利率也不过是与房贷基准利率持平，即7.05%，远未到网上一些人所惊呼的上浮至基准利率的1.05-1.10倍，不过近半月来的确有银行房贷利率较前阶段小有上浮。</p>
<p>农业银行宾水西道支行的一位客户经理：众多银行关于个人消费类贷款利率上浮绝非刚刚发生的事儿，“至少有1年到2年时间了，只是不知道为什么这会儿一下子成了新闻。”各行上浮的比例不一样，农业银行大概在基准利率的基础上上浮了15%-20%，但近半年来，农行已经基本不做这方面的业务了，尽管个人消费类贷款这一品种还存在于该行目录之中。</p>
<p>招商银行园区支行个人信贷部也证实了农行的说法。一份招商银行针对个人消费类贷款的表格，其中1年期贷款利率在7.8%-8.4%之间，也就是说，在央行1年期贷款基准利率6%的基础上上浮了30%-40%。她强调，招行一直都是采用这个标准。</p>
<p>此外，工商银行、中信银行在本市所作的个人消费类贷款的利率一直在基准利率基础上再上浮20%左右，建设银行针对房屋装修、留学类的贷款利率则在基准利率的基础上上浮10%。天津银行的客服人员确定该行的个人消费类贷款利率从开始一直保持为基准利率没动，是各银行中比较低的。</p>

   
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
