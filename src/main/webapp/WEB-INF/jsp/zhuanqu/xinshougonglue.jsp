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
                	<div class="Theloanright10">
                    	<div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=1" name="" target="_blank">个人贷款知识普及</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>9F带大家来普及一下个人贷款的基础知识。
                                                                                                          一、个人贷款的种类： 个人贷款按照产品用途分类，包括个人住房贷款、个人消费贷款、个人经营类贷款等；按照担保方式分类，包括个人信用贷款、个人质押贷款、个人抵押贷款、个人保证贷款等。
                            </p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=2" target="_blank">良好的信用记录对您有利</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>现实生活中，除了个人的信用行为外，有时候还会出现因为个人出借或者遗失身份证，造成个人身份被盗用，使自己的信用受到损害的情况。现在个人因为身份证遗失，被不法分子冒用，造成身份证的主人被公安机关网上通缉和关押的事时有发生。所以我们必须谨慎、妥善保管好个人有效身份证件，努力做到：妥善保管好各种有效身份证件（包括各种可以证明身份证的证件）及其复印件，不要轻易将这些身份证件借给他人。</p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=3" target="_blank">如何在征信系统中查询个人信用记录</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>信用记录在我们生活中占据的地位越来越重，如果您拥有良好的信用记录，就相当于拥有了一件“信誉抵押品”，不管是您向银行申请贷款还是申办信用卡，都能受到银行的信任。当然如果您的信用有“污点”，那么银行在审批贷款、信用卡时会慎重考虑是否接受您的申请；如果您的不良记录太多，银行就有可能拒绝您的申请。所以，即使我们不贷款不办信用卡，也最好经常查询自己的信用记录，那么如何查询自己的信用报告呢？</p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=4" target="_blank">如何对抵押贷款做选择</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>办理抵押消费业务逐渐成为一些消费者的必然选择，链家地产副总裁林倩提醒消费者，除选择普通的抵押消费贷款外，根据个人具体情况，可选择不同特殊类型的贷款产品。</p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=5" target="_blank">抵押物价值以及存管问题</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>9F带着大家一起来了解抵押贷款的额度以及抵押物存管问题。1.限额问题，抵押贷款限额是指贷款的最高额度，它是依据抵押物的估价值与抵押率测算出来的。2.贷款限额计算，其公式为；贷款限额=抵押物的估计值×抵押率，借款人的贷款金额须在测算的贷款限额之内，否则会形成超值贷款，给贷款归还带来隐蔽风险。因此，抵押贷款金额的多少取决于抵押物价值的多少和抵押率的高低。</p>
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
