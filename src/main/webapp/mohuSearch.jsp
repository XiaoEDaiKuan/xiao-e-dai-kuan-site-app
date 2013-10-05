<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>推荐产品</title>
<%@include file="WEB-INF/inc/globalScript.jsp" %>
</head>

<body>
<jsp:include page="WEB-INF/inc/globalHeader.jsp">
	<jsp:param name="index" value="2" />
</jsp:include>

<div class="Fuzzysearch">
	<div class="top Fuzzysearch1">
    	<div class="main3 padding-bt ground">
  <div class="credit_title"> 
    <span class="credit_title1 font_f Fuzzysearch2">不知道自己的贷款需求？看看同地区同行业的人选择什么产品</span>
  </div>
  <div class="Fuzzysearch3">
  	<div class="Fuzzysearch4 ClearFix"><h1>请选择您的地区:</h1><p><a href="#">北京</a><a href="#">上海</a><a href="#">黑龙江</a><a href="#">乌鲁木齐</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">秦皇岛</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a></p></div>
    <div class="Fuzzysearch5"><a href="mohuSearchResult.jsp"><img src="images/img3.jpg" width="154" height="29" /></a></div>
    </div>
</div>
<div class="main3 ground  Fuzzysearch6">
  <div class="credit_title"> 
    <span class="credit_title1 font_f">热门贷款推荐</span>
  </div>
  <%@include file="WEB-INF/inc/productInRow.jsp" %>
</div>
    </div>
</div>

<%@include file="WEB-INF/inc/globalFooterMenu.jsp" %>
<%@include file="WEB-INF/inc/globalFooter.jsp" %>
</body>
</html>
    