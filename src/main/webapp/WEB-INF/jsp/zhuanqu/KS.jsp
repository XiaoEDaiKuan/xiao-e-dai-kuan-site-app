<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
	<jsp:param name="index" value="2" />
</jsp:include>
<%@include file="../../inc/zhuanquMenu.jsp" %>
<div class="Fuzzysearch">
	<div class="top Fuzzysearch1">
    	<div class="application ClearFix">
        	<div class="applicationright">
               <div class="assistant ground">
    <div class="credit_title"> <span class="credit_title1 font_f">贷款助手</span></div>
    	<div class="assistant1">
        <div class="assistant1_1"><a href="score_choose.html" class="cal"></a></div>
        <div class="assistant1_2"><a href="score_choose.html">云信用评分器</a><br />测测你能贷多少</div>
      </div>
      
  </div>
    
            </div>
        	<div class="applicationleft">
            	<div class="credit ground Loansearch3 quickloan9">
      <div class="credit_title"><span class="credit_title1 font_f Theloanright6">快速贷款专区</span><span class="credit_title2">资金要的紧，贷款周期短</span></div>
      <div class="quickloan1">请选择方案，并从方案中挑选贷款</div>
      
      <div id="Tab1">
<div class="Menubox1 font_f">
<div id="one1" onmouseover="setTab('one',1,3)"  class="hover"><a href="#"><span>1</span><em>天</em>放款</a></div>
<div id="one2" onmouseover="setTab('one',2,3)"><a href="#"><span>3</span><em>天</em>放款</a></div>
<div id="one3" onmouseover="setTab('one',3,3)" style="margin-right:0"><a href="#"><span>5</span><em>天</em>放款</a></div>
</div>
<div class="Contentbox1">
<div id="con_one_1" class="hover">
	<div class="quickloan6">
    	<img src="images/img48.jpg" width="32" height="16" />
        <h1>方案说明：</h1>
        <p>名下需有房产或车辆等有价资产，并进行抵押，从事该业务的一般是小贷公司和中介。</p>
    </div>
</div>
<div id="con_one_2" style="display:none">
	<div class="quickloan6 quickloan7">
    	<img src="images/img48.jpg" width="32" height="16" />
        <h1>方案说明：</h1>
        <p>名下需有房产或车辆等有价资产，并进行抵押，从事该业务的一般是小贷公司和中介。</p>
    </div>
</div>
<div id="con_one_3" style="display:none">
	<div class="quickloan6 quickloan8">
    	<img src="images/img48.jpg" width="32" height="16" />
        <h1>方案说明：</h1>
        <p>名下需有房产或车辆等有价资产，并进行抵押，从事该业务的一般是小贷公司和中介。</p>
    </div>
</div>
</div>
</div>

    </div>
    <div class="credit ground  applicationleft13 quickloan5">
  <div class="credit_title Fuzzysearch7 Loansearch2"> 
    <span class="credit_title1 Fuzzysearch8">根据您的需求，我们推荐以下贷款产品</span>
  </div>
  <div class="quickloan2 ClearFix">
  	<div class="Loansearch19"><a href="#"><img src="images/img18.jpg" width="94" height="29" /></a></div>
  	 <img src="images/img49.jpg" width="119" height="99" />
     <div class="Loansearch12 quickloan3">
    	<div class="Loansearch13 quickloan4">
        	<h1>宜信 - 宜车贷</h1>
            <p><strong>额度：</strong><span>1万--200万</span> 2天放款<br /><strong>费用：</strong>月利率0%+月管理费2.38%+一次性收费2%<br /><em><strong>说明：</strong>押车，不押车均可</em></p>
        </div>
    	<img src="images/img13.jpg" width="42" height="42" />
    </div>
  </div>
  <div class="quickloan2 ClearFix">
  	<div class="Loansearch19"><a href="#"><img src="images/img18.jpg" width="94" height="29" /></a></div>
  	 <img src="images/img50.jpg" width="119" height="99" />
     <div class="Loansearch12 quickloan3">
    	<div class="Loansearch13 quickloan4">
        	<h1>宜信 - 宜车贷</h1>
            <p><strong>额度：</strong><span>1万--200万</span> 2天放款<br /><strong>费用：</strong>月利率0%+月管理费2.38%+一次性收费2%<br /><em><strong>说明：</strong>押车，不押车均可</em></p>
        </div>
    	<img src="images/img13.jpg" width="42" height="42" />
    </div>
  </div>
  <div class="quickloan2 Fuzzysearch6 ClearFix">
  	<div class="Loansearch19"><a href="#"><img src="images/img18.jpg" width="94" height="29" /></a></div>
  	 <img src="images/img49.jpg" width="119" height="99" />
     <div class="Loansearch12 quickloan3">
    	<div class="Loansearch13 quickloan4">
        	<h1>宜信 - 宜车贷</h1>
            <p><strong>额度：</strong><span>1万--200万</span> 2天放款<br /><strong>费用：</strong>月利率0%+月管理费2.38%+一次性收费2%<br /><em><strong>说明：</strong>押车，不押车均可</em></p>
        </div>
    	<img src="images/img13.jpg" width="42" height="42" />
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
