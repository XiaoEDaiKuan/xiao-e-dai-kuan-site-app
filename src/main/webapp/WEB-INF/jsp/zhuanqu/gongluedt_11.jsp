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
 document.getElementById('diya').className="curr";
 
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
            
                         <h1>申请汽车抵押贷款遇到的常见问题</h1>
                        <h2>时间:2013-10-10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
   <p>汽车抵押贷款是短期周转资金的最佳选择，那么汽车抵押贷款对车辆有什么要求呢？如果借贷人无力偿还贷款该怎么办？车辆抵押后，借款人还能把车开走吗？汽车抵押贷款需要多长时间才能放贷？</p> 
   <p>第一，汽车抵押贷款是没有金额限制的，无论是三四万的汽车，还是价值上百万的都可以进行汽车抵押贷款，但是可贷到的金额要根据车辆情况，等评估后得出。</p>
　　<p>第二，借款人和出资人在办理机动车抵押贷款时，要去车管部门办理车辆的抵押手续，其中一项是在机动车登记证书上加署出资人的姓名，这就保护了双方的权益，使得这辆车不能随便买卖。据了解，在办理完手续后，出资人、借款人还要分别与中介机构签订委托买卖合同书。合同规定若借款人无力偿还，中介机构可将车辆卖出，所得金额偿还出资人。</p>
　　<p>第三，现在有些贷款公司办理汽车抵押贷款，是不需要把车抵押在贷款人手中的，车依然可以使用。</p>
　　<p>第四，汽车抵押贷款一般一天就可以放贷了，速度非常快，是解决短期资金短缺的最好选择。</p>
   <p>第五，汽车抵押借款服务中，借款人最关心的除利率外，最在意的当属放款的时间以及审批的金额。大部分借款人的借款需求属于短期急需资金，对此行业领军平台宜车贷为需求用户做到当天放款服务，同时借款金额可高达车辆评估价的90%，高效率放款及高放款金额赢得了借款人的一致好评。</p>

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
