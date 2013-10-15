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
            
                         <h1>9F带您区别抵押贷款与按揭</h1>
                        <h2>时间:2013-9-30&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
   <p>《城市房地产管理法》和《担保法》所规定的抵押与香港的按揭有一定的区别，即这两个法律对抵押的界定都以不转移占有为条件。</p>
   <p>按揭就是按揭人(买方者)通过分期付款方式来取得所购商品房的所有权。它对买房者来说有两方面含义：一是抵押贷款</p>
<p><p>房款可以在规定的期限内分期付;二是在分期付款阶段，房子的所有权被“按”着，要等到全部付清才能“揭”(取)到手。另外，按揭售楼涉及到三方债务关系——即按揭人(买房者)、发展商(卖房者)、按揭权人(一般为有关银行)三者关系。它的程序是，由按揭人(买房者)先与发展商签定买房合同，并预付部分购房款;然后由按揭人(买房者)凭该合同与按揭权人(银行)签订按揭合同，由银行向发展商付清余下的购房款，而买房者定期向按揭银行付款，直到按规定付清“按揭款”，按揭过程即告结束。</p>
<p>抵押贷款是买房者(抵押人)向银行(抵押权人)借钱的方式。即买房者用所购房产作为抵押物，与银行签订抵押合同，以不转移所有权方式作为按期向银行归还贷款的保证。此项贷款须付利息，买房者(抵押人)按合同约定向银行还清本息后，便可收回抵押品——“房屋所有权证”与“土地使用证”。这就是说，买房者在还清贷款之前，事实上并不真正拥有所购房屋的所有权。若违约不按期归还贷款，银行可以依法作出处理。</p>
<p>按揭是国际上种通行的房产销售方式，它与抵押贷款虽然性质不同，但在“按住房屋所有权”来保证债务(分期付款和按期还款)履行这点上殊途同归，完全一致。</p>
<p>房屋抵押贷款与房屋按揭贷款的区别</p>
<p>1、成本不同：主要是利率方面对于按揭贷款，就是商业贷款，又叫个人住房贷款。抵押贷款指借款者以一定的抵押品作为物品保证向银行取得的贷款。利率都是执行人民银行规定的基准利率，以前做买房按揭贷款利率还有折扣，由于当今政策紧，额度少，利率不降反升利率上浮。但是按揭的上浮低于抵押的上浮。</p>
<p>2、法律关系的主体不同：抵押关系中，若债务人即抵押人，则只有两个法律关系主体即抵押权人和抵押人。而按揭关系中，最少应有三个法律关系主体，即按揭人（银行）、按揭人（买方）、第三人（原房屋所有人）。</p>
<p>3、先期条件不同：借款人要向银行申请房屋抵押贷款，是以一定的抵押品作为物品保证向银行取得的贷款，抵押贷款用途可用以购房、也可以用作其他用途。而按揭贷款是购房者以所购住房做抵押并由其所购买住房的房地产企业提供阶段性担保的个人住房贷款业务却只能用以购房。</p>
   
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
