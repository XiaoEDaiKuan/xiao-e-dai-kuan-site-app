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
                	<div class="Theloanright9">
            
                         <h1>无抵押贷款需备手续</h1>
                        <h2>时间:2013-10-10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
<p>贷款需备手续第一步</p>
<p>无抵押小额贷款，需要我们具有中国国籍（不含香港、澳门、台湾三地的居民）；</p>
<p>同时你要满25-55周岁这个区间范围；</p>
<p>现居住的住址要满6个月，在当地工作必须满半年；</p>
<p>同时最最重要的是信用卡还款记录良好，且当前没有逾期。如果你是上班族，那么在现工作的单位要满6个月。</p>
<p>贷款需备手续第二步</p>
<p>首先，申请者在网上填写自己的联系方式，并以邮件或者是传真的形式将相关材料发送到新一贷贷款；</p>
<p>其次，相关银行在收到申请者的资料后会有专门的客服同申请者进行联系；最后申请者上门提交相关材料，银行进行审批，通过审批后银行放款。</p>
<p>只要你的材料齐备，最快1天可以到账。</p>
<p>银行无抵押贷款申请流程</p>
<p>（1）提供个人身份信息，包括身份证，居住证，户口本，结婚证等信息；（2）提供稳定的住址，房屋租赁合同，水电缴纳单，物业管理等相关资料；</p>
<p>（3）提供稳定的收入来源，银行流水单，劳动合同等。</p>

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
