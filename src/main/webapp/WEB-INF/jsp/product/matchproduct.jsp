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
  			<a href="?regionId=${region.id}">${region.name}</a>
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
		<div class="box"><a class="imgBorder" href="viewProduct?productId=${gp.id}" target="_blank"><img src="images/${gp.icon}" width="130" height="79" /></a> </div>
	</c:forEach>
	<!-- 图片列表 end -->
  </div>

<div class="RightBotton" id="RightArr"></div></div>
<script type="text/javascript">
    window.onload = function(){
      var scrollPic_02 = new ScrollPic();
      scrollPic_02.scrollContId   = "ISL_Cont_1"; //内容容器ID
      scrollPic_02.arrLeftId      = "LeftArr";//左箭头ID
      scrollPic_02.arrRightId     = "RightArr"; //右箭头ID

      scrollPic_02.frameWidth     = 830;//显示框宽度
      scrollPic_02.pageWidth      = 172; //翻页宽度

      scrollPic_02.speed          = 5; //移动速度(单位毫秒，越小越快)
      scrollPic_02.space          = 10; //每次移动像素(单位px，越大越快)
      scrollPic_02.autoPlay       = false; //自动播放
      scrollPic_02.autoPlayTime   = 3; //自动播放间隔时间(秒)

      scrollPic_02.initialize(); //初始化
    }
</script>
  
</div>
<div class="main3 ground  Fuzzysearch6">
  <div class="credit_title"> 
    <span class="credit_title1 font_f">大家都在贷</span>
  </div>
  
  <c:forEach var="pv" items="${pvs.items}">
  <div class="Loansearch11 ClearFix">
  	<div class="Loansearch19"><a href="viewProduct?&productId=${pv.product.id}"><img src="images/img18.jpg" width="94" height="29" /></a></div>
  	<div class="Loansearch12">
    	<div class="Loansearch13">
        	<h1>${pv.product.issueOrgan}</h1>
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
    	<img src="images/img13.jpg" width="42" height="42" />
    </div>
    <div class="Loansearch12 Loansearch17">
    	<div class="Loansearch18">
            <p>${prod.product.desc}</p>
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
    