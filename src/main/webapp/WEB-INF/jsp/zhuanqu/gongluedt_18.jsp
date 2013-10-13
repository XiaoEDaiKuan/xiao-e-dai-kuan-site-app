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
 document.getElementById('jingying').className="curr";
 
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
            
                         <h1>经营性物业抵押贷款的风险</h1>
                        <h2>时间:2013-10-10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
   <p>经营性物业贷款需要把握以下3大风险。</p>
<p>一是把握市场风险。经营性物业抵押贷款期限较长，贷款期内不确定和不可预见因素较多，经济发展周期和房地产市场周期变动、借款人高估抵押物价值或将市场租售情况不理想的项目抵押给银行，都可能导致抵押不足，项目出租率和租金水平降低，从而影响贷款安全。因此要真实客观地评估抵押物市场价值，严格贷款用途，杜绝借款人降低注册资本、抽减股本、不当分配利润等降低所有者权益的行为。[1]</p>
<p>二是把握客户和项目风险。贷款对象须是信用等级和开发资质较高，财务状况良好，商业地产开发业绩优良或物业经营管理经验丰富，招商引资能力和市场培育、运作能力较强的优质客户。经营性物业原则上是位于城市中央商务区和中心商业区等城市中心繁华地段，并投入运营一段时间，出租率较高，经营状况良好的低风险项目。</p>
<p>三是把握利率风险。关注通货膨胀率和市场利率的变化，对经营性物业抵押贷款的实际利息收入的影响。四是把握贷后管理风险。经营行要及时掌握项目租售情况，准确估算项目经营性现金流量，认真做好项目资金监管，制定科学合理的还款计划，确保按期偿还贷款本息，有效控制和化解贷款风险。</p>
   
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
