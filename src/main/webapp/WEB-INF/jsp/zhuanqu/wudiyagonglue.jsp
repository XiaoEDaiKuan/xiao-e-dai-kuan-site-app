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
 document.getElementById('wudiya').className="curr";
 
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
                	<div class="Theloanright10">
                    	<div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=6" name="" target="_blank">申请个人小额无抵押贷款的一般流程</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>个人小额无抵押贷款是指针对个人或家庭为核心的无抵押无担保的贷款，其主要的服务对象为广大工薪阶层、工商个体户、小作坊、小业主。贷款的金额一般为20万元以下，1000元以上。
                            </p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=7" target="_blank">申请个人无抵押贷款的条件及注意事项</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>个人无抵押贷款是由各大银行或者其他合法金融机构推出的以个人和家庭为核心的经营类贷款，其服务对象主要为广大工商个体户、小作坊、小业主等，一般贷款额度在一千元到三十万之间。其特点就在于无需提供抵押品或第三方担保，仅凭借个人信用即可申请贷款，但贷款额度会受到申请方的经济效益、经营管理水平和发展前景等因素的影响。面对银行繁琐的贷款流程，加之市场上的贷款公司比较多，如何选择正规的贷款公司就成为了许多借款人的首要解决问题，宜人贷是国内比较知名的做小额贷款的平台，为有资金需求的借款人搭建了一个轻松、便捷、安全、透明的网络互动平台。</p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=8" target="_blank">无抵押贷款介绍</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>无抵押贷款是不以具体某项资产作为担保的借款负债形式，即不用借款人或第三方依法提供担保而发放的贷款。无抵押贷款又称无担保贷款，或者是信用贷款。不需要任何抵 押物，只需身份证明，收入证明，住址证明等材料（具体证明材料要看是什么银行）向银行申请的贷款，银行根据的是个人的信用情况来发放贷款，利率一般稍高于有抵押贷款，客户可根据个人的具体情况来选择贷款年限，然后跟银行签订合同。</p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=9" target="_blank">无抵押贷款需备手续</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>贷款需备手续第一步:无抵押小额贷款，需要我们具有中国国籍（不含香港、澳门、台湾三地的居民）；同时你要满25-55周岁这个区间范围；现居住的住址要满6个月，在当地工作必须满半年；同时最最重要的是信用卡还款记录良好，且当前没有逾期。如果你是上班族，那么在现工作的单位要满6个月。</p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=10" target="_blank">贷款渠道介绍</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>随着时代的发展和金融市场的繁荣，很多非银行渠道也开展了无抵押贷款业务，其中民间借贷占据了很大比例。在民间借贷市场中，小额贷款公司及P2P网络借贷平台占据了无抵押贷款的大部分份额，而P2P网络借贷更是成为了当前无抵押贷款的最新、最热门渠道，自2009年P2P在国内兴起以来，P2P开始逐步被广大群众熟悉及认可。
                            </p>
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
