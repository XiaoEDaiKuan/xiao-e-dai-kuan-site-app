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
                	<div class="Theloanright10">
                    	<div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=11"  target="_blank">申请汽车抵押贷款遇到的常见问题</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>汽车抵押贷款是短期周转资金的最佳选择，那么汽车抵押贷款对车辆有什么要求呢？如果借贷人无力偿还贷款该怎么办？车辆抵押后，借款人还能把车开走吗？汽车抵押贷款需要多长时间才能放贷？  </p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=12" target="_blank">抵押贷款怎么分类和估值</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>我们先说资产的分类。资产按照不同的价值存在形态可分为有形资产和无形资产两大类。有形资产中包括了真实资产和金融资产：真实资产可分为动产和不动产；金融资产可分为货币和有价证券。其中有价证券又可分为两种，一种是货币证券如支票、汇票等，另一种是资本证券如股票、债券、大额存单以及人寿保险单等。无形资产也可分为两种类型：一类是受有关法令、规章、契约或者资产性质所限制，仅有一定使用年限，如专利权、版权、专营权以及租赁权等；另一类具有无限的使用年限，如商标权、商号权以及商誉权等。</p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=13" target="_blank">房屋抵押贷款基础知识</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>经常听到别人说房屋抵押贷款的事情，今天就给大家分享这方面的经验，希望能帮到有这方面需求的朋友。个人房屋抵押贷款：指具有完全民事行为能力的自然人，以所购城镇住房、商铺、写字楼等房产作抵押而申请的经营或消费贷。   </p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=14" target="_blank">9F带您区别抵押贷款与按揭</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>《城市房地产管理法》和《担保法》所规定的抵押与香港的按揭有一定的区别，即这两个法律对抵押的界定都以不转移占有为条件。按揭就是按揭人(买方者)通过分期付款方式来取得所购商品房的所有权。它对买房者来说有两方面含义：一是抵押贷款</p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=15" target="_blank">银行抵押贷款分类知识</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>一、个人住房贷款:1、个人住房商业性贷款,个人住房商业性贷款，是银行信贷资金所发放的自营贷款，指具有完全民事行为能力的自然人，购买 本市城镇自住住房时，以其所购产权住房为抵押物，作为偿还贷款的保证而向银行申请的住房商业性贷款。2、个人住房公积金贷款,个人住房公积金贷款，是政策性的住房公积金所发放的委托贷款，指缴存住房公积金的职工，在本市城镇购买，建造、翻建、大修自住住房时，以其所拥有的产权住房为抵押物，作为偿还贷款的保证而向银行申请的住房公积金贷款。   </p>
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
