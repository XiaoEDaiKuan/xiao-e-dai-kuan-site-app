<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>推荐匹配</title>
<%@include file="../../inc/globalScript.jsp" %>
<script type="text/javascript" src="Scripts/ScrollPic.js"></script>
<style type="text/css">
.Fuzzysearch4 p a.R_${param.regionId} {
	color:#f68a55;
	font-weight:bold;
	border-bottom:solid #f68a55 1px;
}
</style>
</head>

<body>
<jsp:include page="../../inc/globalHeader.jsp">
	<jsp:param name="index" value="2" />
</jsp:include>
<div class="Fuzzysearch">
	<div class="top Fuzzysearch1">
    	<div class="main3 padding-bt ground">
  <div class="credit_title"> 
    <span class="credit_title1 font_f Fuzzysearch2">不知道自己的贷款需求？看看同地区的人选择什么产品</span>
  </div>
  <div class="Fuzzysearch3">
  	<div class="Fuzzysearch4 ClearFix">
  		<h1>请选择您的地区:</h1>
  		<p>
  		<c:forEach var="region" items="${regions}">
  			<a href="?regionId=${region.id}" class="R_${region.id}">${region.name}</a>
  		</c:forEach>
  		</p>
  	</div>
    </div>
</div>
<div class="main3 ground  Fuzzysearch6">
  <div class="credit_title Fuzzysearch7"> 
    <span class="credit_title1 Fuzzysearch8">根据您的选择，我们向您推荐该地区行业的<em>${fn:length(groupProducts)}</em>款团购贷款产品</span>
  </div>
  
  <div class="blk_29">
	<div class="LeftBotton" id="LeftArr"></div>
	<div class="Cont" id="ISL_Cont_1">
	<!-- 图片列表 begin -->
	<c:forEach var="gp" items="${groupProducts}">
		<div class="box">
			<c:set var="gpid" value="0" />
			<c:if test="${gp.id == '6'}"><c:set var="gpid" value="4" /></c:if>
			<c:if test="${gp.id == '7'}"><c:set var="gpid" value="1" /></c:if>
			<c:if test="${gp.id == '8'}"><c:set var="gpid" value="3" /></c:if>
			<c:if test="${gp.id == '9'}"><c:set var="gpid" value="5" /></c:if>
			
			<c:if test="${gpid ne '0'}">
			<a class="imgBorder" href="http://tuan.9fbank.com/front/product/detail/product_detail?proId=${gpid}" target="_blank">
				<img src="images/products/110x65/${gp.icon}" alt="${gp.name}&#10;${gp.desc}" width="130" height="80" />
				${gp.name}
			</a>
			</c:if>
		</div>
	</c:forEach>
	<!-- 图片列表 end -->
  </div>

<div class="RightBotton" id="RightArr"></div></div>
  
</div>
<div class="main3 ground  Fuzzysearch6">
  <div class="credit_title"> 
    <span class="credit_title1 font_f">大家都在贷</span>
  </div>
  
  <c:forEach var="pv" items="${pvs.items}">
  <div class="Loansearch11 ClearFix">
  	<div class="Loansearch19"><a href="viewProduct?&productId=${pv.product.id}" target="_blank"><img src="images/img18.jpg" width="94" height="29" /></a></div>
  	<div class="Loansearch12">
    	<div class="Loansearch13">
        	<h1>${pv.product.issueOrgan} - ${pv.product.name}</h1>
            <p>
            	<span class="Loansearch14">
            	<fmt:bundle basename="dict/dict-mapping" prefix="PRD_GRNT_TYPE.">
            		<fmt:message key="${pv.product.guarantyType}" />
				</fmt:bundle>
            	</span><br />
            	<span class="Loansearch14 Loansearch15">
            	<fmt:bundle basename="dict/dict-mapping" prefix="PRD_IDENTITY.">
	            	<c:set var="hasIden" value="0" />
	            	<c:forTokens var="iden" items="${pv.attach.identity}" delims="|">
	            		<c:if test="${not empty iden}">
	            			<c:if test="${hasIden == '1'}">,</c:if>
	            			<fmt:message key="${iden}" />
	            			<c:set var="hasIden" value="1" />
	            		</c:if>
	            	</c:forTokens>
				</fmt:bundle>
            	</span><br />
            	<span class="Loansearch14 Loansearch16">${pv.product.paidDays}天放款</span>
            </p>
        </div>
    	<img src="images/products/40x40/${pv.product.icon}" width="40" height="40" />
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>${pv.product.desc}</p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>
            	利率: <fmt:formatNumber type="percent" pattern="0.00%" value="${pv.product.intrRate}" /><br />
            	总利息: <fmt:formatNumber pattern="#,##0.00" value="${pv.interest}" /><span> 万元</span><br />
            </p>
        </div>
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p><br />有<span>${pv.numOrders}</span>人申请<br /></p>
        </div>
    </div>
  </div>
  </c:forEach>
  
</div>
    </div>
</div>

<%@include file="../../inc/globalFooterMenu.jsp" %>
<%@include file="../../inc/globalFooter.jsp" %>
</body>
</html>
    