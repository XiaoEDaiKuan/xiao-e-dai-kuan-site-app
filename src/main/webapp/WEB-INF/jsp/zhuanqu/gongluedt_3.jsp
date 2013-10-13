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
            
                         <h1>如何在征信系统中查询个人信用记录</h1>
                        <h2>时间:2013-10-10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
                        <p>信用记录在我们生活中占据的地位越来越重，如果您拥有良好的信用记录，就相当于拥有了一件“信誉抵押品”，不管是您向银行申请贷款还是申办信用卡，都能受到银行的信任。当然如果您的信用有“污点”，那么银行在审批贷款、信用卡时会慎重考虑是否接受您的申请；如果您的不良记录太多，银行就有可能拒绝您的申请。所以，即使我们不贷款不办信用卡，也最好经常查询自己的信用记录，那么如何查询自己的信用报告呢？</p>
                                                                                 　<p>1.带好个人的身份证等身份证明原件（最好复印件也准备好，当场弄要收费1元）。 查询当地人民银行的地址。并在大厅里填写好《个人信用报告查询申请表》(可先行填写，但需本人当场签名)，取个号等待查询。</p>
                        <p>2.报告一般当场等半个小时左右就可以领取。（还需要支付一定的费用） 《个人信用报告》一般是个人自己留存的。</p>
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
