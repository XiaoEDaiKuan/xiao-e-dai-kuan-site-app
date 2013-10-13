<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>快速贷款专区</title>
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
	<jsp:param name="index" value="0" />
</jsp:include>

<div class="Fuzzysearch">
	<div class="top Fuzzysearch1">
    	<div class="application ClearFix">
        	<div class="applicationright">
               <!-- 贷款助手 -->
			<%@include file="../../inc/daikuanTools.jsp"%>
    
            </div>
        	<div class="applicationleft">
            	<div class="credit ground Loansearch3 quickloan9">
      <div class="credit_title"><span class="credit_title1 font_f Theloanright6">快速贷款专区</span><span class="credit_title2">资金要的紧，贷款周期短</span></div>
      <div class="quickloan1">请选择方案，并从方案中挑选贷款</div>
      
      <div id="Tab1">
<div class="Menubox1 font_f">
<div id="one1" onmouseover="setTab('one',1,3)"  class="hover"><a href="?paidDay=1"><span>1</span><em>天</em>放款</a></div>
<div id="one2" onmouseover="setTab('one',2,3)"><a href="?paidDay=3"><span>3</span><em>天</em>放款</a></div>
<div id="one3" onmouseover="setTab('one',3,3)" style="margin-right:0"><a href="?paidDay=5"><span>5</span><em>天</em>放款</a></div>
</div>
<div class="Contentbox1">
<div id="con_one_1" class="hover">
	<div class="quickloan6">
    	<img src="images/img48.jpg" width="32" height="16" />
        <h1>方案说明：</h1>
        <p>可选择无抵押或抵押贷款，最快可实现1天放款。</p>
    </div>
</div>
<div id="con_one_2" style="display:none">
	<div class="quickloan6 quickloan7">
    	<img src="images/img48.jpg" width="32" height="16" />
        <h1>方案说明：</h1>
        <p>可选择无抵押或抵押贷款，最快可实现3天放款。</p>
    </div>
</div>
<div id="con_one_3" style="display:none">
	<div class="quickloan6 quickloan8">
    	<img src="images/img48.jpg" width="32" height="16" />
        <h1>方案说明：</h1>
        <p>可选择无抵押或抵押贷款，最快可实现5天放款。</p>
    </div>
</div>
</div>
</div>

    </div>
    <div class="credit ground  applicationleft13 quickloan5">
  <div class="credit_title Fuzzysearch7 Loansearch2"> 
    <span class="credit_title1 Fuzzysearch8">根据您的需求，我们推荐以下贷款产品</span>
  </div>
  
  <c:forEach var="prod" items="${quickProds.items}">
  <div class="quickloan2 ClearFix">
  	<div class="Loansearch19"><a href="viewProduct?productId=${prod.product.id}"><img src="images/img18.jpg" width="94" height="29" /></a></div>
  	 <img src="images/img50.jpg" width="119" height="99" />
     <div class="Loansearch12 quickloan3">
    	<div class="Loansearch13 quickloan4">
        	<h1>${prod.product.issueOrgan} - ${prod.product.name}</h1>
            <p>
            	<strong>额度：</strong>
            	<span>
            		<fmt:formatNumber pattern="#0.#" value="${prod.minLoanAmt div 10000}" /> 万 -
            		<fmt:formatNumber pattern="#0.#" value="${prod.maxLoanAmt div 10000}"/> 万
            	</span> ${prod.product.paidDays} 天放款 <br />
            	<strong>费用：</strong> ${prod.product.intrDesc} <br />
            	<strong>说明：</strong>
            	<em>
            	<fmt:bundle basename="dict/dict-mapping" prefix="PRD_GRNT_TYPE.">
           			<fmt:message key="${prod.product.guarantyType}" />
				</fmt:bundle>
				</em>
            </p>
        </div>
    	<img src="images/img13.jpg" width="42" height="42" />
    </div>
  </div>
  </c:forEach>
  
  </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../../inc/globalFooterMenu.jsp" %>
<%@include file="../../inc/globalFooter.jsp" %>
</body>
</html>
