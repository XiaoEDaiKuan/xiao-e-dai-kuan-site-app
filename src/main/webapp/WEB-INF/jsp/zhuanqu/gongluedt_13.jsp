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
            
                         <h1>房屋抵押贷款基础知识</h1>
                        <h2>时间:2013-10-8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
　<p>经常听到别人说房屋抵押贷款的事情，今天就给大家分享这方面的经验，希望能帮到有这方面需求的朋友。</p>
　　<p>个人房屋抵押贷款：指具有完全民事行为能力的自然人，以所购城镇住房、商铺、写字楼等房产作抵押而申请的经营或消费贷。</p>
　　<p>基本条件：</p>
　　<p>1.年龄必须是在18-60岁之间，具有完全民事行为能力、身体健康、信用良好的中国公民;</p>
　　<p>2.在中国境内具有有效身份证件,且有固定详细的家庭住址和联系电话;</p>
　　<p>基本流程：</p>
　　<p>1.准备贷款资料：夫妻双方身份证，户口本，结婚证（未婚借款人须提供未婚证明），房产证，土地证，收入证明，水、电或煤气费单，贷款用途证明等相关材料；</p>
　　<p>2.房产评估机构评估房产价值；</p>
　　<p>3.带上材料，到公司签订借款合同；</p>
　　<p>4.到房地产管理局办理抵押登记手续；</p>
　　<p>5.公司拿到他项权证，发放贷款。</p>
　　<p>需要注意的是，抵押房屋具有合法有效的《房屋所有权证》或《国有土地使用证》，且产权为个人私有，若为共有产权，须经共有人书面同意；抵押房屋须质量良好、合法使用，按时缴纳水、电、暖、煤气等费用</p>
   
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
