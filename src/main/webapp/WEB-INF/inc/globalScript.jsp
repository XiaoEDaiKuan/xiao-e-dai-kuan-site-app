<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/home.css" type="text/css" rel="stylesheet" />
<link href="css/tipswindown.css" type="text/css" rel="stylesheet" />
<link href="css/css.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/fix.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>
<script type="text/javascript" src="Scripts/tipswindown.js"></script>
<script type="text/javascript" src="Scripts/select2css.js"></script>
<script type="text/javascript" src="Scripts/pop_zidong.js"> </script>
<script type="text/javascript" src="Scripts/globals.js"></script>
<script type="text/javascript" src="Scripts/login.js"></script>
<style type="text/css">
.pop_contact .pop_city a.C_${sessionScope.currentRegion.id}{
	color:#f68a55;
	font-weight:bold;
	border-bottom:solid #f68a55 1px;
}
</style>
<c:if test="${sessionScope.currentRegion.name ne '北京市'}">
<script type="text/javascript">
$(document).ready(function(){
	  layer();
});
</script>
</c:if>