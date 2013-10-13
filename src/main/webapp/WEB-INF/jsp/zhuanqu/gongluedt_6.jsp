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
            
                         <h1>申请个人小额无抵押贷款的一般流程</h1>
                        <h2>时间:2013-10-10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
   <p>个人小额无抵押贷款是指针对个人或家庭为核心的无抵押无担保的贷款，其主要的服务对象为广大工薪阶层、工商个体户、小作坊、小业主。贷款的金额一般为20万元以下，1000元以上。</p>
   <p>个人小额无抵押贷款的申请条件：</p>
　　<p>一是中国大陆居民；</p>
　　<p>二是有稳定的住址和工作或经营地点；</p>
　　<p>三是有稳定的收入来源；</p>
　　<p>四是无不良信用记录，贷款用途不能作为炒股，赌博等行为。</p>
　　<p>个人小额无抵押贷款的申请材料：</p>
　　<p>提供个人身份证明，可以是身份证，居住证，户口本，结婚证等信息；</p>
　　<p>提供稳定的住址证明，房屋租赁合同，水电缴纳单，物业管理等相关证明；</p>
　　<p>提供稳定的收入来源证明，银行流水单，劳动合同等；</p>
　　<p>贷款用途使用计划或声明等材料。</p>
　　<p>个人小额无抵押贷款的注意事项：</p>
　　<p>友情提醒请记住一点：如果有任何人或机构在放贷给你之前找你要任何费用，那么都是骗子！另外，上述的个人小额无抵押贷款的所需条件和材料，会根据不同的银行而有所小差异。</p>

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
