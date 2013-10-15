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
            
                         <h1>经营贷款申请流程以及资料</h1>
                        <h2>时间:2013-10-15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
 <p>申请所需材料</p>
<p>1、资格证明文件，如身份证、户口簿或其他有效居留证件、营业执照等；</p>
<p>2、贷款用途证明文件，如购销合同等：</p>
<p>3、经营企业的财务报表（或经营收入证明）、税单及其他还款能力证明等；</p>
<p>4、担保所需的证明文件。抵（质）押担保须提供抵（质）押物清单、权属证明、价值证明，以及有处分权人同意抵（质）押证明；信用担保须提供保证人同意履行连带责任保证的文件及有关资信证明材料；</p>
<p>5、具有固定职业和稳定的经济收入证明；</p>
<p>6、借款申请书（内容应包括借款人简历、工作业绩、投资项目可行性研究报告、还款来源、担保情况、申请借款的金额和期限）；</p>
<p>7、不低于投资项目总投资额的30%的自有资金或付款证明；</p>
<p>8、银行要求提供的其他文件资料。借款客户所提供文件资料应真实、合法。</p>
<p>流程</p>
<p>（1）客户申请</p>
<p>（2）业务经办机构受理及调查</p>
<p>（3）业务经办机构审查</p>
<p>（4）业务经办机构签批</p>
<p>（5）总行审贷机构或授权机构初审</p>
<p>（6）总行审贷机构或授权机构终审</p>
<p>（7）放款</p>
   
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
